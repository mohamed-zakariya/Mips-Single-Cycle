--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:51:27 04/03/2023
-- Design Name:   
-- Module Name:   D:/CA projects/Mips-Desgin/Memory_Test.vhd
-- Project Name:  ALU_20103101_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory_20103101_2023
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
 
ENTITY Memory_Test IS
END Memory_Test;
 
ARCHITECTURE behavior OF Memory_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_20103101_2023
    PORT(
         write_data : IN  std_logic_vector(31 downto 0);
         address : IN  std_logic_vector(31 downto 0);
         memory_write : IN  std_logic;
         memory_read : IN  std_logic;
         read_data : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal memory_write : std_logic := '0';
   signal memory_read : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_20103101_2023 PORT MAP (
          write_data => write_data,
          address => address,
          memory_write => memory_write,
          memory_read => memory_read,
          read_data => read_data,
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

      wait for clk_period*10;
		memory_write <= '0';
		memory_read <= '1';
		address <= X"00000000";
		
		
      wait for clk_period*10;
		memory_write <= '1';
		memory_read <= '0';
		write_data <= X"FFFFFFFF";
		
      -- insert stimulus here 

      wait;
   end process;

END;
