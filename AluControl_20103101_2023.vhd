----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:35 03/13/2023 
-- Design Name: 
-- Module Name:    AluControl_20103101_2023 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AluControl_20103101_2023 is
    Port ( instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUoperation : out  STD_LOGIC_VECTOR (3 downto 0));
end AluControl_20103101_2023;

architecture Behavioral of AluControl_20103101_2023 is
signal func : STD_LOGIC_VECTOR(3 downto 0);
begin
func <= instruction(3 downto 0);
process(instruction, ALUOp)
begin

if(ALUOp = "00") then ALUoperation <= "0010";
elsif(ALUOp = "01") then ALUoperation <= "0110" ;
elsif(ALUOp= "10") then if(func = "0000") then ALUoperation <= "0010";
elsif(func = "0010") then ALUoperation <= "0110";  
elsif(func = "0100") then ALUoperation <= "0000";
elsif(func = "0101") then ALUoperation <= "0001";
elsif(func = "1010") then ALUoperation <= "0111";   
end if;
elsif(ALUOp = "11") then if(func = "0010") then ALUoperation <= "0110";
elsif(func = "1010") then ALUoperation <= "0111";
end if;
end if;
end process;
end Behavioral;

