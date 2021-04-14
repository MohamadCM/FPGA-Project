----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2020 08:32:57 PM
-- Design Name: 
-- Module Name: Delta_X - Behavioral
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

entity Delta_X is
    Port (G:in DA_matrix;
          F:in X;
          dx:out X);
end Delta_X;

architecture Behavioral of Delta_X is

begin
process(G,F)
variable deltax: X;
    begin
        for i in 0 to p-1 loop
            for j in 0 to p-1 loop
                if(j=0)then
                    deltax(i):=G(i,j)*F(j);
                else
                    deltax(i):=deltax(i)+G(i,j)*F(j);
                end if;
             end loop;
         end loop;
         dx<=deltax;
     end process;

end Behavioral;
