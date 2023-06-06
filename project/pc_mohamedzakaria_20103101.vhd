----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:54:26 04/11/2022 
-- Design Name: 
-- Module Name:    pc_mohamedzakaria_20103101 - Behavioral 
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

entity pc_mohamedzakaria_20103101 is
    Port ( PCin : in  STD_LOGIC_VECTOR (31 downto 0);
        CLK : in  STD_LOGIC;
        PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end pc_mohamedzakaria_20103101;

architecture Behavioral of pc_mohamedzakaria_20103101 is
signal t : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

begin
process(CLK) begin
	if(rising_edge(CLK)) then PCout <= t;
	end if;
	
	if(falling_edge(CLK)) then t <= PCin;
	end if;
	
end process;

end Behavioral;


