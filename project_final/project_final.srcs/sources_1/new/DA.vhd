----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 08:48:32 PM
-- Design Name: 
-- Module Name: DA - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package pds_utils is
constant n:integer :=7;
constant m:integer :=5;
constant p:integer :=12;
type A11 is array (0 to n-1, 0 to n-1) of integer ;
type DA_matrix is array (0 to p-1, 0 to p-1) of integer ;
type A12 is array (0 to n-1, 0 to m-1) of integer ;
type A21 is array (0 to m-1, 0 to n-1) of integer ;
type X is array (0 to p-1) of integer ;
constant L:integer:=13;
constant R:integer:=7;

function difference (dx: X; E:integer) return boolean;

end package pds_utils;

package body pds_utils is
    
    function difference (dx: X; E:integer) return boolean is
        begin
            for I in 0 to (P - 1) loop
                if(abs(dx(I)) >= E)then
                    return true;
                end if;
            end loop;
            return false;
    end difference;
    
end package body pds_utils;
use work.pds_utils.ALL;

entity DA is

    Port (input_a : in DA_matrix;
    input_x: in X;
    output_da: out DA_Matrix );
end DA;

architecture Behavioral of DA is
signal signal_a: DA_matrix;
signal derivative_a:DA_matrix;

begin
process(input_a,input_x)
    begin
        for i in 0 to n-1 loop
            for j in 0 to n-1 loop
                if (i=j) then
                    derivative_a(i,j)<=L*R*input_x(i)*input_x(i);
                else
                    derivative_a(i,j)<=0;
                end if;
                end loop;
                end loop;
                
          for i in n to p-1 loop
            for j in 0 to p-1 loop
                derivative_a(i,j)<=input_a(i,j);
            end loop;
          end loop;
          
          for i in 0 to n-1 loop
            for j in n to p-1 loop
                derivative_a(i,j)<=input_a(i,j);
            end loop;
          end loop;
          
    end process;

output_da<=derivative_a;

end Behavioral;
