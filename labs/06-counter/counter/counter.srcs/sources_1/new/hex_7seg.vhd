library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_7seg is
    Port ( blank : in STD_LOGIC;
           hex : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end hex_7seg;

architecture Behavioral of hex_7seg is

begin
--------------------------------------------------------
  -- p_7seg_decoder:
  -- A combinational process for 7-segment display (Common
  -- Anode) decoder. Any time "hex" or "blank" is changed,
  -- the process is "executed". Output pin seg(6) controls
  -- segment A, seg(5) segment B, etc.
  --     segment A
  --      | segment B
  --      |  | segment C
  --      +-+|  |   ...   segment G
  --        ||+-+          |
  --        |||            |
  -- seg = "0000001"-------+
  --
  -- Display is clear/blank if signal blank = 1.
  --------------------------------------------------------

  p_7seg_decoder : process (blank, hex) is

  begin

    if (blank = '1') then
      seg <= "1111111";     -- Blanking display
    else

      case hex is

        when "0000" =>

          seg <= "0000001"; -- 0

        when "0001" =>

          seg <= "1001111"; -- 1
        when "0010" =>     -- 2

          seg <= "0010010";
        when "0011" => -- 3

          seg <= "0000110";
          when "0100" => -- 4

          seg <= "1001100";
          
          when "0101" => -- 5

          seg <= "0100100";
          when "0110" => -- 6

          seg <= "0100000";
          when "0111" => -- 7

          seg <= "0001111";
        -- WRITE YOUR CODE HERE
        -- 2, 3, 4, 5, 6, 7



        when "1000" =>

          seg <= "0000000"; -- 8
          when "1001" => -- 9

          seg <= "0000100";
          when "1010" => -- A

          seg <= "0001000";
          when "1011" => -- B

          seg <= "1100000";
          when "1100" => -- C

          seg <= "0110001";
          when "1101" => -- D

          seg <= "1000010";
         

        -- WRITE YOUR CODE HERE
        -- 9, A, b, C, d



        when "1110" =>

          seg <= "0110000"; -- E

        when others =>

          seg <= "0111000"; -- F

      end case;

    end if;

  end process p_7seg_decoder;


end Behavioral;
