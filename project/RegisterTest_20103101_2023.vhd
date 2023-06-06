--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:45:28 03/27/2023
-- Design Name:   
-- Module Name:   D:/CA projects/Mips-Desgin/RegisterTest_20103101_2023.vhd
-- Project Name:  ALU_20103101_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile_20103101_2023
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
 
ENTITY RegisterTest_20103101_2023 IS
END RegisterTest_20103101_2023;
 
ARCHITECTURE behavior OF RegisterTest_20103101_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile_20103101_2023
    PORT(
         read_register1 : IN  std_logic_vector(4 downto 0);
         read_register2 : IN  std_logic_vector(4 downto 0);
         write_register : IN  std_logic_vector(4 downto 0);
         read_data1 : OUT  std_logic_vector(31 downto 0);
         read_data2 : OUT  std_logic_vector(31 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         register_write : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal read_register1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_register2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_register : std_logic_vector(4 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal register_write : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal read_data1 : std_logic_vector(31 downto 0);
   signal read_data2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile_20103101_2023 PORT MAP (
          read_register1 => read_register1,
          read_register2 => read_register2,
          write_register => write_register,
          read_data1 => read_data1,
          read_data2 => read_data2,
          write_data => write_data,
          register_write => register_write,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		read_register1 <= "00001";
		read_register2 <= "00010";
		write_register <= "00011";
		register_write <= '1';
		write_data <= X"00000002";
		wait for 100 ns;
		read_register1 <= "00011";
		wait for 100 ns;
		
      wait for clk_period*10;
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
