----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 11:08:22 PM
-- Design Name: 
-- Module Name: tb_DA - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.pds_utils.ALL;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity tb_DA is
--  Port ( );
end tb_DA;

architecture testbench of tb_DA is

component DA is

    Port (input_a : in DA_Matrix;
    input_x: in X;
    output_da: out DA_Matrix );
end component;

  signal input_a : DA_Matrix;
  signal input_x: X;
  signal output_da: DA_Matrix;

begin

    -- Matrix Under Test
	dut : DA
		port map (
			input_a    => input_a ,
			input_x  => input_x ,
			output_da   => output_da 
		);
		
		READ_FILE: process
       file A_INPUT : text is in "A.txt";
       file X_INPUT : text is in "X.txt";
	   variable in_line : line;
	   variable input : integer ;
	   variable counter:integer:=0;
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
	           input_x(counter)<=input;
	           counter:=counter + 1;
	        end loop;
	         wait;
	         end process;
	         
	         
	         -- write process for write to dataout.txt file
	WRITE_FILE: process
    variable VEC_LINE : line;
   -- variable OUTPUT: std_logic;
    file file_OUTPUT : text is out "DA_Matrix.txt";
    begin
    --file_open(file_OUTPUT, "dataout.txt", write_mode);
        --OUTPUT:=dout;
            wait for 700 ns;
            for i in 0 to p-1 loop
                for j in 0 to p-1 loop
                    write (VEC_LINE, output_da(i,j));
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                    write (VEC_LINE, ' ');
                end loop;
            writeline (file_OUTPUT, VEC_LINE);
            end loop;
             --write(VEC_LINE, dout, right, 1);
             --writeline(file_OUTPUT, VEC_LINE);
            --file_close(file_OUTPUT);
end process WRITE_FILE;
	         
end testbench;
