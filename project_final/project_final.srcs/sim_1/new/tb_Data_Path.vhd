----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2020 11:56:06 AM
-- Design Name: 
-- Module Name: tb_Data_Path - testbench
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
use work.pds_utils.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Data_Path is
--  Port ( );
end tb_Data_Path;

architecture testbench of tb_Data_Path is
component Data_Path is
    Port (input_A: in DA_Matrix;
          input_X: in X;
          input_B:in X;
          F: out X;
          G:out DA_Matrix;
          next_X : out X );
end component;
signal input_A,G:DA_Matrix;
signal input_x,input_B,F,next_X: X;
begin

    dut : Data_Path
		port map (
			input_A    => input_A ,
			input_X  => input_X ,
            input_B  => input_B ,
            F => F,
            G => G,			
			next_X   => next_X
		);

        READ_FILE: process
       file A_INPUT : text is in "A.txt";
       file X_INPUT : text is in "X.txt";
       file B_INPUT : text is in "B.txt";
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
	        end loop;
	        
	        while not endfile(B_INPUT) loop
	           readline(B_INPUT,in_line);
	           read(in_line,input);
	           input_B(counterb)<=input;
	           counterb:=counterb + 1;
	        end loop;
	         wait;
	         end process;
	         
	         
	         WRITE_FILE: process
    variable VEC_LINE : line;
    variable X_LINE : line;
    variable G_LINE : line;
   -- variable OUTPUT: std_logic;
    file f_OUTPUT : text is out "F.txt";
    file X_OUTPUT : text is out "Next_X.txt";
    file G_OUTPUT : text is out "G.txt";
    begin
    --file_open(file_OUTPUT, "dataout.txt", write_mode);
        --OUTPUT:=dout;
            wait for 700 ns;
            for i in 0 to p-1 loop
                    write (VEC_LINE, f(i));
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    
                    write (X_LINE, next_x(i));
                    write (X_LINE, ' ');
                    write (X_LINE, ' ');
                    write (X_LINE, ' ');
                    write (X_LINE, ' ');
                end loop;
            writeline (f_OUTPUT, VEC_LINE);
            writeline (X_OUTPUT, X_LINE);
            
             --write(VEC_LINE, dout, right, 1);
             --writeline(file_OUTPUT, VEC_LINE);
            --file_close(file_OUTPUT);
            
            for i in 0 to p-1 loop
                for j in 0 to p-1 loop
                    write (G_LINE, G(i,j));
                    write (G_LINE, ' ');
                    write (G_LINE, ' ');
                    write (G_LINE, ' ');
                    write (G_LINE, ' ');
                end loop;
            writeline (G_OUTPUT, G_LINE);
            end loop;
            
end process WRITE_FILE;



end testbench;
