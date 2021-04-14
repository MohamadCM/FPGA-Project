----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2020 11:41:34 AM
-- Design Name: 
-- Module Name: update_a - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity update_a is
    Port (input_a : in DA_Matrix;
          input_x : in X;
          output_a : out DA_Matrix );
end update_a;

architecture Behavioral of update_a is

begin
process(input_a,input_x)
variable output: DA_Matrix;
begin
    
    for i in 0 to n-1 loop
        for j in 0 to n-1 loop
            if i=j then
                output(i,j):=R*input_x(j)*input_x(j);
            else
                output(i,j):=input_a(i,j);
            end if;
        end loop;
    end loop;
    
    for i in n to p-1 loop
            for j in 0 to p-1 loop
                output(i,j):=input_a(i,j);
            end loop;
          end loop;
          
          for i in 0 to n-1 loop
            for j in n to p-1 loop
                output(i,j):=input_a(i,j);
            end loop;
          end loop;
output_a<=output;
end process;

end Behavioral;
