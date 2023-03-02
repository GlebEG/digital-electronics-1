library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_mux_3bit_4to1  is
  -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1 ;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_mux_3bit_4to1  is

  -- Testbench local signals
signal sig_a         : std_logic_vector(2 downto 0);
signal sig_b           : std_logic_vector(2 downto 0);
signal sig_c           : std_logic_vector(2 downto 0);
signal sig_d           : std_logic_vector(2 downto 0);
signal sig_set         : std_logic_vector(1 downto 0);
signal sig_y           : std_logic_vector(2 downto 0);



begin

  -- Connecting testbench signals with comparator_4bit
  -- entity (Unit Under Test)
  uut_mux_3bit_4to1  : entity work.mux_3bit_4to1
    port map (
      a           => sig_a,
      b           => sig_b,
      c           => sig_c,
      d           => sig_d,
      set         => sig_set,
      y           => sig_y
    );


  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    
    sig_set <= "10";
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
            sig_y = "010"

        )
      -- If false, then report an error
      -- If true, then do not report anything
      report "Input combination set=10 FAILED"
      severity error;

    ------------------------------
    -- WRITE OTHER TEST CASES HERE
    

    -- Report a note at the end of stimulus process
    report "Stimulus process finished";

    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;
