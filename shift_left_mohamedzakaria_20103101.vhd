----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:03:28 04/11/2022 
-- Design Name: 
-- Module Name:    shift_left_imanmohamed_20101953 - Behavioral 
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

entity shift_left_mohamedzakaria_20103101 is
    Port ( Shift_Left_2_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Shift_Left_2_out : out  STD_LOGIC_VECTOR (31 downto 0));
end shift_left_mohamedzakaria_20103101;

architecture Behavioral of shift_left_mohamedzakaria_20103101 is

begin
Shift_Left_2_out <= STD_LOGIC_VECTOR(shift_left(unsigned(Shift_Left_2_in),2));

end Behavioral;

