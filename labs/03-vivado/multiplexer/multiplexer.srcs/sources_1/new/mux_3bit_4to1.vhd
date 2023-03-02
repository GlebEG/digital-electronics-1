----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2023 12:31:33
-- Design Name: 
-- Module Name: mux_3bit_4to1 - Behavioral
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


entity mux_3bit_4to1 is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           b : in STD_LOGIC_VECTOR (2 downto 0);
           c : in STD_LOGIC_VECTOR (2 downto 0);
           d : in STD_LOGIC_VECTOR (2 downto 0);
           set : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (2 downto 0)
           );
end mux_3bit_4to1;

architecture Behavioral of mux_3bit_4to1 is

begin

y <=   a when (set = "00" ) else
       b when (set = "01" ) else
       c when (set = "10" ) else
       d;      

end Behavioral;
