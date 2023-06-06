----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:20 04/03/2023 
-- Design Name: 
-- Module Name:    Memory_20103101_2023 - Behavioral 
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

entity Memory_20103101_2023 is
    Port ( write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           memory_write : in  STD_LOGIC;
           memory_read : in  STD_LOGIC;
           read_data : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end Memory_20103101_2023;

architecture Behavioral of Memory_20103101_2023 is
type mem is array(0 to 127) of STD_LOGIC_VECTOR(7 downto 0);

signal dataMem: mem := (
x"AB", x"CD", x"EF", x"00",
x"75", x"74", x"65", x"72",
x"20", x"41", x"72", x"63",
x"68", x"69", x"74", x"65",
x"12", x"34", x"56", x"78",
x"7F", x"7F", x"6D", x"6D",
x"00", x"00", x"00", x"00",
x"78", x"78", x"6A", x"6A",
x"00", x"00", x"00", x"01",
others => x"00");

begin
	process(address, write_data, memory_write, memory_read, clk)
	begin
		if(memory_read='1' and memory_write='0') then
		read_data(31 downto 24) <= dataMem(to_integer(unsigned(address)));
		read_data(23 downto 16) <= dataMem(to_integer(unsigned(address)+1));
		read_data(15 downto 8) <= dataMem(to_integer(unsigned(address)+2));
		read_data(7 downto 0) <= dataMem(to_integer(unsigned(address)+3));
		elsif(memory_read='0' and memory_write='1') then		
		dataMem(to_integer(unsigned(address))) <= write_data(31 downto 24);
		dataMem(to_integer(unsigned(address)+1)) <= write_data(23 downto 16);
		dataMem(to_integer(unsigned(address)+2)) <= write_data(15 downto 8);
		dataMem(to_integer(unsigned(address)+3)) <= write_data(7 downto 0);

		end if;
	end process;	
end Behavioral;

