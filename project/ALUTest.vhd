--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:56:52 03/06/2023
-- Design Name:   
-- Module Name:   D:/ALU/ALU_20103101_2023/ALUTest.vhd
-- Project Name:  ALU_20103101_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALUTest IS
END ALUTest;
 
ARCHITECTURE behavior OF ALUTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         ALUOp : IN  std_logic_vector(3 downto 0);
         res : OUT  std_logic_vector(31 downto 0);
         o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOp : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(31 downto 0);
   signal o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          ALUOp => ALUOp,
          res => res,
          o => o
        );

   -- Clock process definitions
   
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      a <= X"00000005";
		b <= X"00000007";
		
		ALUOp <= "0000";
		wait for 100 ns;
		
		ALUOp <= "0001";
		wait for 100 ns;
		
		ALUOp <= "0010";
		wait for 100 ns;
		
		ALUOp <= "0110";
		wait for 100 ns;
		
		ALUOp <= "0111";
		wait for 100 ns;
		
		ALUOp <= "1100";
		wait for 100 ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
