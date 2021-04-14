----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2020 11:34:23 AM
-- Design Name: 
-- Module Name: update_x - Behavioral
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

entity update_x is
  Port (input_x:in X;
        input_dx: in X;
        output_x:out X);
end update_x;

architecture Behavioral of update_x is

begin
process(input_x,input_dx)
variable output:X;
    begin
        for i in 0 to p-1 loop
            output(i):=input_x(i)+input_dx(i);
        end loop;
    output_x<=output;        
    end process;
    
end Behavioral;
