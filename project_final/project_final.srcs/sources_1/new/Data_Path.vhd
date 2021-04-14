----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2020 08:06:10 PM
-- Design Name: 
-- Module Name: Data_Path - Behavioral
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

entity Data_Path is
    Port (input_A: in DA_Matrix;
          input_X: in X;
          input_B:in X;
          F: out X;
          G:out DA_Matrix;
          dx: out X;
          next_A: out DA_Matrix;
          next_X : out X );
end Data_Path;

architecture Behavioral of Data_Path is

component F_function is
    Port (input_A : in DA_matrix;
    input_x: in X;
    input_b : in X;
    output_f : out X );
end component;

component G_var is
     Generic(Z: integer := 2);
     Port (input_DA: in DA_matrix;
            G: out DA_matrix);
end component;

component DA is

    Port (input_a : in DA_matrix;
    input_x: in X;
    output_da: out DA_Matrix );
end component;

component Delta_X is
    Port (G:in DA_matrix;
          F:in X;
          dx:out X);
end component;

component update_x is
  Port (input_x:in X;
        input_dx: in X;
        output_x:out X);
end component;

component update_a is
    Port (input_a : in DA_Matrix;
          input_x : in X;
          output_a : out DA_Matrix );
end component;


signal signal_f: X;
signal signal_da:DA_Matrix;
signal signal_G: DA_Matrix;
signal signal_dx:X;
signal updated_x: X;
signal updated_a: DA_Matrix;
begin

calculateF:  F_function     port map(input_A,input_X,input_B,signal_f);
calculateDA: DA             port map(input_a, input_x, signal_da);
calculateG:  G_var          port map(signal_da, signal_G);
solveDeltaX: Delta_X        port map(signal_G, signal_f, dx);
updateX:     update_X       port map(input_X, signal_dx, updated_x);
updateA:     update_A       port map(input_a, updated_x, updated_a);

    F <=        signal_f;
    G <=        signal_G;
    next_x <=   updated_x;
    next_a <=   updated_a;


end Behavioral;
