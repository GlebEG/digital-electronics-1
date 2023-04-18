
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


entity top is
  port (
    CLK100MHZ               : in  std_logic;      
    SW                      : in  std_logic;   
    BTNC                    : in  std_logic;  
    sig_pause_rst           : in  std_logic;
    sig_timer_rst           : in  std_logic;
    sig_timer_12bit_O       : out std_logic_vector(11 downto 0); 
    sig_rounds_6bit_O       : out std_logic_vector(5 downto 0);   
    sig_pause_12bit_O       : out std_logic_vector(11 downto 0);
    sig_clk_1ns_O           : out std_logic
  );
end entity top;

-- Architecture body for top level
architecture behavioral of top is

  -- Signal declarations
  signal sig_pause_12bit : std_logic_vector(11 downto 0);
  signal sig_rounds_6bit : unsigned(5 downto 0) := (others => '0');
  signal sig_timer_12bit : std_logic_vector(11 downto 0);
  signal sig_timer_en : std_logic := '1';
  signal sig_pause_en : std_logic := '0';

  signal sig_clk_1ns : std_logic;
  
type t_state is (
    START,
    COUNTER,
    PAUSE,
    TEST,
    FINISH
);

  signal sig_state : t_state;
  
begin

  -- Instance of clock_enable entity
  clk_en1 : entity work.clock_enable
    generic map (
      g_MAX => 2      
    )
    port map (
      clk => CLK100MHZ, 
      rst => BTNC,     
      ce  => sig_clk_1ns 
    );

  -- Instance of cnt_up_down entity for Timer
  cnt_timer : entity work.cnt_up_down
    generic map (
      g_CNT_WIDTH => 12   
    )
    port map (
      clk    => sig_clk_1ns,       -- Main clock input
      rst    => sig_timer_rst,              
      en     => sig_timer_en,
      cnt_up => '1',              
      cnt    => sig_timer_12bit 
    );
    
    cnt_pause : entity work.cnt_up_down
    generic map (
      g_CNT_WIDTH => 12    -- Counter width (12 bits)
    )
    port map (
      clk    => sig_clk_1ns,        
      rst    => sig_pause_rst,              
      en     => sig_pause_en,       
      cnt_up => '1',              
      cnt    => sig_pause_12bit    
    );

p_pause_cycle : process (sig_clk_1ns) is
begin
  if (rising_edge(sig_clk_1ns)) then
    if (BTNC = '1') then                   
      sig_state             <= START;              
      sig_rounds_6bit       <= "000000";         
    elsif (SW = '1') then
      case sig_state is
        
        when START=>
          BTNC <= '0';
          sig_timer_en <= '0';
          sig_pause_en <= '0';
          sig_state <= COUNTER;
        
        when COUNTER =>
          sig_timer_en <= '1';
          sig_pause_en <= '0';
          if (sig_timer_12bit = "111111111111") then
            sig_state <= PAUSE;
            sig_timer_rst <= '1';
          end if;
        
        when PAUSE =>
          sig_timer_rst <= '0';

          sig_timer_en <= '0';
          sig_pause_en <= '1';
          if (sig_pause_12bit = "111111111111") then
            sig_state <= TEST;
            sig_pause_rst<= '1';
          end if;
        
        when TEST =>
          sig_timer_rst<= '0';
          sig_pause_rst<= '0';
          sig_timer_en <= '0';
          sig_pause_en <= '0';
        if (sig_rounds_6bit = "111111") then
            sig_state <= FINISH;
        else
           sig_rounds_6bit <= sig_rounds_6bit + 1;
           sig_state    <= COUNTER;

        end if;
        
        when FINISH =>
          BTNC <= '1';
          
        
        
        
      end case;
    end if;
  end if; 
end process p_pause_cycle;

p_out : process (sig_clk_1ns) is
begin
sig_timer_12bit_O   <= sig_timer_12bit;
  -- Output must be retyped from "unsigned" to "std_logic_vector"
sig_rounds_6bit_O   <= std_logic_vector(sig_rounds_6bit);
sig_pause_12bit_O   <= sig_pause_12bit;
sig_clk_1ns_O       <= sig_clk_1ns;
end process p_out;
    
    
end architecture behavioral;
