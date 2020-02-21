----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 21.02.2020 07:56:50
-- Design Name: 
-- Module Name: mux8 - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux8 is
    Port (seg_1 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_2 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_3 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_4 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_5 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_6 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_7 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_8 : in STD_LOGIC_VECTOR (6 downto 0);
           cmd : in STD_LOGIC_VECTOR (2 downto 0);
           DP : out STD_LOGIC;
           SG : out STD_LOGIC_VECTOR (6 downto 0));
end mux8;

architecture Behavioral of mux8 is

begin

sel_mux: PROCESS(seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7,seg_8,cmd)
    begin
    CASE (cmd) IS
          WHEN "000" => SG <= seg_1;
          WHEN "001" => SG <= seg_2;
          WHEN "010" => SG <= seg_3;
          WHEN "011" => SG <= seg_4;
          WHEN "100" => SG <= seg_5;
          WHEN "101" => SG <= seg_6;
          WHEN "110" => SG <= seg_7;
          WHEN "111" => SG <= seg_8;
          WHEN OTHERS => NULL;
    END CASE;
END PROCESS sel_mux;

DP<='0';

end Behavioral;
