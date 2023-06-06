----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:50:19 04/11/2022 
-- Design Name: 
-- Module Name:    branchadder_mohamedzakaria_20103101 - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity branchadder_mohamedzakaria_20103101 is
    Port ( Adder_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_in_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_out : out  STD_LOGIC_VECTOR (31 downto 0));
end branchadder_mohamedzakaria_20103101;

architecture Behavioral of branchadder_mohamedzakaria_20103101 is

begin
Adder_out <=STD_LOGIC_VECTOR(to_unsigned((to_integer(unsigned(Adder_in_1))+to_integer(unsigned(Adder_in_2))), 32));

end Behavioral;

