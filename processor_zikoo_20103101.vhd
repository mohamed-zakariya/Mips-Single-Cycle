----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:36 04/18/2022 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is	
    Port ( CLK_Main : in  STD_LOGIC);
end processor;

architecture Behavioral of processor is

component AluControl_20103101_2023 is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUoperation : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component ALU is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
          b : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUOp : in  STD_LOGIC_VECTOR (3 downto 0);
          res : out  STD_LOGIC_VECTOR (31 downto 0);
          o : out  STD_LOGIC);
end component;

component adder_mohamedzakaria_20103101 is
 Port ( Adder_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_in_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component controlunit_mohamedzakaria_20103101 is
    Port ( oP : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component  Memory_20103101_2023 is
		 Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
        	  memory_read : in  STD_LOGIC;
           memory_write : in  STD_LOGIC;
			  clk: in STD_LOGIC :='0';
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
			  read_data	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component instructionmemory_mohamedzakaria_20103101 is
port( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           instruct : out  STD_LOGIC_VECTOR (31 downto 0));
           
end component;

component mux_32_mohamedzakaria_20103101 is
    Port ( a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
end component;

component mux5_mohamedzakaria_20103101 is
    Port ( a : IN std_logic_vector(4 downto 0);
		b : IN std_logic_vector(4 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(4 downto 0)
		);
end component;

component pc_mohamedzakaria_20103101 is
    Port ( PCin : in  STD_LOGIC_VECTOR (31 downto 0);
        CLK : in  STD_LOGIC;
        PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component registerfile_mohamedzakaria_20103101 is
   Port (RegWrite : in STD_LOGIC;
        rs : in  STD_LOGIC_VECTOR (4 downto 0);
        rt : in  STD_LOGIC_VECTOR (4 downto 0);
			rd : in  STD_LOGIC_VECTOR (4 downto 0);
			WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
			CLK: in STD_LOGIC;
			ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
			ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component shift_left_mohamedzakaria_20103101 is
    Port ( Shift_Left_2_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Shift_Left_2_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component sign_extend_mohamedzakaria_20103101 is
    Port ( SignExtend_in : in  STD_LOGIC_VECTOR (15 downto 0);
           SignExtend_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal ALUinput1: std_logic_vector(31 downto 0);
	signal ALUinput2: std_logic_vector(31 downto 0);
	signal ALUoutput: std_logic_vector(31 downto 0);
	signal ALUzeroFlag: std_logic;
	signal ALUselect: std_logic_vector(3 downto 0);
	
	signal PCoutput: std_logic_vector(31 downto 0);
	signal PCinput: std_logic_vector (31 downto 0);
	signal AdderOut: std_logic_vector (31 downto 0);
	
	signal inputInstruction: std_logic_vector (31 downto 0);
	signal readData2: std_logic_vector (31 downto 0);
	signal dataMemoryOut: std_logic_vector (31 downto 0);
	signal writeDataIn: std_logic_vector (31 downto 0);
	signal MUXregDstOut:std_logic_vector (4 downto 0);
	
	signal regDst: std_logic;
	signal branch: std_logic;
	signal memRead: std_logic;
	signal memToReg: std_logic;
	signal ALUopControl: std_logic_vector (1 downto 0);
	signal memWrite: std_logic;
	signal ALUSrc: std_logic;
	signal RegWrite: std_logic;
	
	signal signExtend: std_logic_vector (31 downto 0);
	signal shiftLeft2: std_logic_vector (31 downto 0);
	
	signal ALUoutputToPCMUX: std_logic_vector (31 downto 0);
	signal PCMUXcontrol: std_logic;
	
begin
pc:pc_mohamedzakaria_20103101 port map(
    CLK => CLK_Main,
		PCin => PCinput,
		PCout => PCoutput
);

pcadder:adder_mohamedzakaria_20103101 port map (
		Adder_in_1 => PCoutput,
		Adder_in_2 => "00000000000000000000000000000100",
		Adder_out => AdderOut
);

branchadder: adder_mohamedzakaria_20103101 port map (
      Adder_in_1 => AdderOut,
		Adder_in_2 => shiftLeft2,
		Adder_out => ALUoutputToPCMUX
);
instructionmemorymain: instructionmemory_mohamedzakaria_20103101 port map(
		PC => PCoutput,
		instruct => inputInstruction
);
           

controlunitmain:controlunit_mohamedzakaria_20103101 port map (
		OP => inputInstruction (31 downto 26),
		RegDst => regDst,
		ALUSrc => ALUSrc,
		MemToReg => memToReg,
		RegWrite => RegWrite,
		MemRead => memRead,
		MemWrite => memWrite,
		Branch => branch,
		ALUop => ALUopControl
);

muxregdst: mux5_mohamedzakaria_20103101 port map (
		a => inputInstruction (20 downto 16),
		b => inputInstruction (15 downto 11),
		sel => regDst,
		output => MUXregDstOut 
);

memorymux:mux_32_mohamedzakaria_20103101 port map (
		a => ALUoutput,
		b => dataMemoryOut,
		sel => memToReg,
		output => writeDataIn
);

alumux:mux_32_mohamedzakaria_20103101 port map (
		a => readData2,
		b => signExtend,
		sel => ALUSrc,
		output => ALUinput2 
);
	PCMUXcontrol <= (branch AND ALUzeroFlag);
pcmux: mux_32_mohamedzakaria_20103101 port map (
		a => AdderOut,
		b => ALUoutputToPCMUX,
		sel => PCMUXcontrol,
		output => PCinput
);

registerflemain:registerfile_mohamedzakaria_20103101 port map (
		ReadData1 => ALUinput1,
		ReadData2 => readData2,
		rs => inputInstruction (25 downto 21),
		rt => inputInstruction (20 downto 16),
		rd => MUXregDstOut,
		WriteData => writeDataIn,
		RegWrite => RegWrite,
      CLK => CLK_Main			
);

signextendmain: sign_extend_mohamedzakaria_20103101 port map (
		SignExtend_in => inputInstruction (15 downto 0),
		SignExtend_out => signExtend
);

ShiftLeft2Main:shift_left_mohamedzakaria_20103101 port map(
		Shift_Left_2_in => signExtend,
		Shift_Left_2_out => shiftLeft2
);

alucontrolmain:AluControl_20103101_2023 port map(
		instruction => inputInstruction (5 downto 0),
		ALUOp => ALUopControl,
		ALUoperation => ALUselect
);

 ALUU: ALU port map(
		a => ALUinput1,
		b => ALUinput2,
		ALUOp => ALUselect,
		res => ALUoutput,
		o => ALUzeroFlag
);
MemoryUnitMain:Memory_20103101_2023 port map(
		memory_read => memRead,
		memory_write => memWrite,
		write_data => readData2,
		address => ALUoutput,
		read_data => dataMemoryOut,
		clk => CLK_Main	
);


end Behavioral;


