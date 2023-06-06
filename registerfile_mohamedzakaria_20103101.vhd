----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:24 03/28/2022 
-- Design Name: 
-- Module Name:    registerfile_mohamedzakaria_20103101 - Behavioral 
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

entity registerfile_mohamedzakaria_20103101 is
    Port (RegWrite : in STD_LOGIC;
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
			  CLK: in STD_LOGIC;
			  ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end registerfile_mohamedzakaria_20103101;

architecture Behavioral of registerfile_mohamedzakaria_20103101 is
type registerFile is array (0 to 31) of std_logic_vector(31 downto 0);
	signal registers: registerFile := (
		x"00000000", x"01101111",
		x"00000000", x"00000000",
		x"00000005", x"00000007",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000",
		x"00000000", x"00000000"
	);
	begin
		process (regWrite, clk)
		begin
			ReadData1 <= registers(to_integer(unsigned(rs)));
			ReadData2 <= registers(to_integer(unsigned(rt)));
			if rising_edge(clk) and regWrite = '1' then
				registers(to_integer(unsigned(rd))) <= WriteData;
			end if;
		end process;
end Behavioral;
