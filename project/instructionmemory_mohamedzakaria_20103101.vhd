----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:37 04/24/2022 
-- Design Name: 
-- Module Name:    instructionmemory_mohamedzakaria_20103101 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionmemory_mohamedzakaria_20103101 is
port( pc : in  STD_LOGIC_VECTOR (31 downto 0);
           instruct: out  STD_LOGIC_VECTOR (31 downto 0));
           
end instructionmemory_mohamedzakaria_20103101;

architecture Behavioral of instructionmemory_mohamedzakaria_20103101 is
type A is array(0 to 127) of STD_LOGIC_VECTOR ( 7 downto 0);
signal mem: A:=
(x"00",x"85",x"10",x"20",
x"ac",x"02",x"00",x"08",
x"8c",x"06",x"00",x"08",
x"10",x"c2",x"00",x"01",
x"00",x"46",x"90",x"2a",
x"00",x"a4",x"88",x"22",
x"20",x"08",x"00",x"04",
x"08",x"00",x"00",x"10",
x"00",x"85",x"10",x"20",
x"00",x"E8",x"38",x"20",
x"00",x"69",x"50",x"2A",
x"11",x"40",x"FF",x"F9",
x"00",x"49",x"10",x"22",
others=>x"00");

begin

instruct<= mem(to_integer(unsigned(pc)))&
mem(to_integer(unsigned(pc))+1)&
mem(to_integer(unsigned(pc))+2)&
mem(to_integer(unsigned(pc))+3);

end Behavioral;


