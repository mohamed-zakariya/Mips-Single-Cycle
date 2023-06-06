----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:28 03/06/2023 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
--signal s: STD_LOGIC_VECTOR (31 downto 0);
begin


process(a, b, ALUOp)
begin
	if(ALUOp = "0000") then res <= a and b;
	elsif(ALUOp = "0001") then res <= a or b;
	elsif(ALUOp = "0010") then res <= std_logic_vector(unsigned(unsigned(a) + unsigned(b)));
	elsif (ALUOp = "0110") then res<= std_logic_vector(unsigned(unsigned(a) - unsigned(b)));
	elsif (ALUOp = "0111") then if (a<b) then res <= X"00000001"; 
	else res <=	X"00000000";
	end if;
	elsif (ALUOp = "1100") then res <= a nor b;
	end if;
	
	if (a = b) then
		o <= '1';
	else
		o <= '0';
		
	end if;
	
	end process;

end Behavioral;

