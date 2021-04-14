----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2020 12:56:36 PM
-- Design Name: 
-- Module Name: calculate_loop - Behavioral
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

entity calculate_loop is

  Generic(  E:          integer := 2);
  Port   (  input_A:    in DA_Matrix;
            input_X:    in X;
            input_B:    in X;
            CLK:        in std_logic;
            reset:      in std_logic;
            valid:      out std_logic;
            G_out:       out DA_Matrix;
            X_out:      out X );
            
end calculate_loop;

architecture Behavioral of calculate_loop is
    
    component Data_Path
    Port (input_A:  in  DA_Matrix;
          input_X:  in  X;
          input_B:  in  X;
          F:        out X;
          G:        out DA_Matrix;
          dx:       out X;
          next_A:   out DA_Matrix;
          next_X :  out X );
    end component;
    
    signal  current_A:  DA_Matrix;
    signal  current_X:  X;
    signal  F:          X;
    signal  G:          DA_Matrix;
    signal  dx:         X;
    signal  next_A:     DA_Matrix;
    signal  next_X:     X;  
    
    shared  variable first: Boolean := true;
begin
    
    DP: Data_path port map(
            current_A,
            current_X,
            input_B,
            F,
            G,
            dx,
            next_A,
            next_X
        );
    process(CLK)
    begin
        if(CLK'event and CLK = '1')then
            if(reset = '1')then
                valid <= '0';
                X_out <= input_X;
                G_out<= (others => (others =>0));
                first:=true;
            else
                if( (not difference (dx, E)) and (not first))then
                    valid <= '1';
                else
                    first := false;
                    G_out <= G;
                    current_A <= next_A;
                    current_X <= next_X;
                end if;
            end if;
        end if;
        
        X_out <= current_X;
    end process;

end Behavioral;
