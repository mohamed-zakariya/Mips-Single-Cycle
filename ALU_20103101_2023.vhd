--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:05:32 03/13/2023
-- Design Name:   
-- Module Name:   D:/CA projects/ALU_20103101_2023/ALU_20103101_2023.vhd
-- Project Name:  ALU_20103101_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AluControl_20103101_2023
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
 
ENTITY ALU_20103101_2023 IS
END ALU_20103101_2023;
 
ARCHITECTURE behavior OF ALU_20103101_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AluControl_20103101_2023
    PORT(
         instruction : IN  std_logic_vector(5 downto 0);
         ALUOp : IN  std_logic_vector(1 downto 0);
         ALUoperation : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(5 downto 0) := (others => '0');
   signal ALUOp : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ALUoperation : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AluControl_20103101_2023 PORT MAP (
          instruction => instruction,
          ALUOp => ALUOp,
          ALUoperation => ALUoperation
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		ALUOp <= "00";
		
		wait for 100 ns;	
		ALUOp <= "01";
		
		wait for 100 ns;	
		ALUOp <= "10";
		instruction <= "000000";
		
		wait for 100 ns;	
		
		instruction <= "110010";
		
		wait for 100 ns;	
		ALUOp <= "10";
		instruction <= "000100";
		
		wait for 100 ns;	
		ALUOp <= "10";
		instruction <= "000101";
		
		wait for 100 ns;	
		ALUOp <= "10";
		instruction <= "001010";
		
		
		wait for 100 ns;	
		ALUOp <= "11";
		instruction <= "110010";
		
		wait for 100 ns;	
	
		instruction <= "001010";
		
		wait for 100 ns;	

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
