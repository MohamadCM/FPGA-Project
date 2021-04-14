----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2020 11:50:44 AM
-- Design Name: 
-- Module Name: F_function - Behavioral
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

entity F_function is
    Port (input_A : in DA_matrix;
    input_x: in X;
    input_b : in X;
    output_f : out X );
end F_function;

architecture Behavioral of F_function is
begin
process(input_a,input_x,input_b)
    variable signal_f: X := ((others=>0));
    variable signal_a: DA_matrix;
    variable signal_x,signal_b : X;
    begin
        signal_a := input_A;
        signal_b := input_b;
        signal_x := input_x;
        for i in 0 to p-1 loop
            for j in 0 to p-1 loop
                if j=0 then
                    signal_f(i):= signal_a(i,j)*signal_x(j);
                else
                    signal_f(i):= signal_f(i)+signal_a(i,j)*signal_x(j);
                end if;
            end loop;
            signal_f(i):= signal_f(i)-signal_b(i);
        end loop;
        output_f<=signal_f;
    end process;

end Behavioral;
