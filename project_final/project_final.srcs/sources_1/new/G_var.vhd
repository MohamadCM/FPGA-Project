----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2020 02:23:22 PM
-- Design Name: 
-- Module Name: Module_3 - Behavioral
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
library WORK;
use WORK.pds_utils.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity G_var is
     Generic(Z: integer := 2);
     Port (input_DA: in DA_matrix;
            G: out DA_matrix);
end G_var;

architecture Behavioral of G_var is
    constant two_z : integer := 2**z;
begin
    process(input_DA)
    variable S: integer;
    variable main_diameter : integer := 0;
    variable sub_diameter: integer := 0;
    variable DAT_S: DA_Matrix;
    begin
            
            
            for K in 0 to P-1 loop
                    if k=0 then
                        main_diameter := input_DA(0,0);
                        sub_diameter := input_DA(0,11);
                    else
                        main_diameter := main_diameter * input_DA(k, k);
                        sub_diameter := sub_diameter * input_DA(k, P-1 - k);
                        end if; 
            end loop;
            S := (main_diameter - sub_diameter) / two_z;
            
            for I in 0 to p-1 loop -- Calculate DA transpose
                for J in 0 to P-1 loop
                    DAT_s(I, J) := -s * input_DA(J, I);
                end loop;
            end loop;
            G <= DAT_s; 
            main_diameter:=0;
            sub_diameter:=0;
    end process;

end Behavioral;
