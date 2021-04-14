----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2020 12:08:46 PM
-- Design Name: 
-- Module Name: tb_F_function - testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use std.textio.all;
use ieee.std_logic_textio.all;
use work.pds_utils.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_F_function is
--  Port ( );
end tb_F_function;


architecture testbench of tb_F_function is
component F_function is
    Port (input_A : in DA_matrix;
    input_x: in X;
    input_b : in X;
    output_f : out X );
end component;

signal input_A: DA_matrix;
signal input_x,input_b,output_f:X;

begin
    
    dut: F_function
        port map(input_A => input_A,
                 input_x => input_x,
                 input_b => input_b,
                 output_f => output_f);
                 
     READ_FILE: process
       file A_INPUT : text is in "A.txt";
       file X_INPUT : text is in "X.txt";
       file B_input : text is in "B.txt";
	   variable in_line : line;
	   variable input : integer ;
	   variable counterx:integer:=0;
	   variable counterb:integer:=0;
	   begin
	       
	       for i in 0 to p-1 loop
	           readline(A_INPUT,in_line);
	           for j in 0 to p-1 loop
	               read(in_line,input);
	               input_a(i,j)<=input;
	            end loop;
	        end loop;
	       
	       while not endfile(X_INPUT) loop
	           readline(X_INPUT,in_line);
	           read(in_line,input);
	           input_x(counterx)<=input;
	           counterx:=counterx + 1;
	         --  wait for 20ns;
	        end loop;
	        
	        while not endfile(B_INPUT) loop
	           readline(B_INPUT,in_line);
	           read(in_line,input);
	           input_b(counterb)<=input;
	           counterb:=counterb + 1;
	         --  wait for 20ns;
	        end loop;
	   
	   wait;
	   end process;
	   
	   WRITE_FILE: process
    variable VEC_LINE : line;
   -- variable OUTPUT: std_logic;
    file file_OUTPUT : text is out "F.txt";
    begin
    --file_open(file_OUTPUT, "dataout.txt", write_mode);
        --OUTPUT:=dout;
            wait for 700 ns;
            for i in 0 to p-1 loop
                    write (VEC_LINE, output_f(i));
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                end loop;
            writeline (file_OUTPUT, VEC_LINE);
             --write(VEC_LINE, dout, right, 1);
             --writeline(file_OUTPUT, VEC_LINE);
            --file_close(file_OUTPUT);
end process WRITE_FILE;

end testbench;
