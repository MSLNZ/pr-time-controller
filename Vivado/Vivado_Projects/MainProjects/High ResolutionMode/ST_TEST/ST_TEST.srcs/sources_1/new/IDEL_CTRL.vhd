----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.01.2020 13:36:15
-- Design Name: 
-- Module Name: IDEL_CTRL - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity IDEL_CTRL is
generic(
    idelay_group : string
);
    Port ( REF_CLK : in STD_LOGIC;
           RSTN : in STD_LOGIC;
           RDY : out STD_LOGIC);
end IDEL_CTRL;

architecture Behavioral of IDEL_CTRL is
attribute IODELAY_GROUP : STRING;
attribute IODELAY_GROUP of IDELAYCTRL_INST: label is idelay_group;
signal RST : std_logic;
begin
RST <= not RSTN;
    IDELAYCTRL_inst : IDELAYCTRL
   port map (
      RDY => RDY,       -- 1-bit output: Ready output
      REFCLK => REF_CLK, -- 1-bit input: Reference clock input
      RST => RST        -- 1-bit input: Active high reset input
   );

end Behavioral;
