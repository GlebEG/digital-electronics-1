----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 12:15:15
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (0 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

  signal sig_ff0 : std_logic;
  signal sig_ff1 : std_logic;
  signal sig_ff2 : std_logic;
  signal sig_ff3 : std_logic;

begin
--------------------------------------------------------------------
  -- Four instances (copies) of D-type FF entity
  sig_ff0 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          d => SW,
          q   => sig_ff0,
          q_bar => open
      );

  sig_ff1 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          
          q   => sig_ff1

      );
      
      sig_ff2 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          q   => sig_ff2,

      );
      
      sig_ff3 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          q   => sig_ff3

      );



end Behavioral;
