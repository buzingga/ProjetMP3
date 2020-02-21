----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 20.02.2020 15:06:50
-- Design Name: 
-- Module Name: mod8 - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mod8 is
     Port ( clock : in STD_LOGIC;
            ce : in STD_LOGIC;
            reset : in STD_LOGIC;
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            output : out STD_LOGIC_VECTOR(2 downto 0));
end mod8;

architecture Behavioral of mod8 is

signal cnt :unsigned (2 downto 0) := "000";

begin

count : PROCESS (clock,reset) IS
BEGIN 
  
  IF reset = '1' THEN
    cnt <= "000";
    output <= "000";
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
    IF ce = '1' THEN
        cnt <= cnt + 1;
        IF cnt > 7 THEN
            cnt <= to_unsigned(0,3);
        END IF;
    END IF;
  output <= std_logic_vector(cnt);
  END IF;
    
END PROCESS count;

sel_AN: PROCESS (cnt) IS 

BEGIN  -- PROCESS p1
  
  CASE (cnt) IS
    WHEN "000" => AN(0) <= '0';
                 AN(1) <= '1';
                 AN(2) <= '1';
                 AN(3) <= '1';
                 AN(4) <= '1';
                 AN(5) <= '1';
                 AN(6) <= '1';
                 AN(7) <= '1';
                 
    WHEN "001" => AN(0) <= '1';
                 AN(1) <= '0';
                 AN(2) <= '1';
                 AN(3) <= '1';
                 AN(4) <= '1';
                 AN(5) <= '1';
                 AN(6) <= '1';
                 AN(7) <= '1';
                 
    WHEN "010" => AN(0) <= '1';
                 AN(1) <= '1';
                 AN(2) <= '0';
                 AN(3) <= '1';
                 AN(4) <= '1';
                 AN(5) <= '1';
                 AN(6) <= '1';
                 AN(7) <= '1';
                 
    WHEN "011" => AN(0) <= '1';
                 AN(1) <= '1';
                 AN(2) <= '1';
                 AN(3) <= '0';
                 AN(4) <= '1';
                 AN(5) <= '1';
                 AN(6) <= '1';
                 AN(7) <= '1';
    WHEN "100" => AN(0) <= '1';
                 AN(1) <= '1';
                 AN(2) <= '1';
                 AN(3) <= '1';
                 AN(4) <= '0';
                 AN(5) <= '1';
                 AN(6) <= '1';
                 AN(7) <= '1';
                   
    WHEN "101" => AN(0) <= '1';
                 AN(1) <= '1';
                 AN(2) <= '1';
                 AN(3) <= '1';
                 AN(4) <= '1';
                 AN(5) <= '0';
                 AN(6) <= '1';
                 AN(7) <= '1';
                   
    WHEN "110" => AN(0) <= '1';
                 AN(1) <= '1';
                 AN(2) <= '1';
                 AN(3) <= '1';
                 AN(4) <= '1';
                 AN(5) <= '1';
                 AN(6) <= '0';
                 AN(7) <= '1';
                   
    WHEN "111" => AN(0) <= '1';
                 AN(1) <= '1';
                 AN(2) <= '1';
                 AN(3) <= '1';
                 AN(4) <= '1';
                 AN(5) <= '1';
                 AN(6) <= '1';
                 AN(7) <= '0';
                               
    WHEN OTHERS => NULL;
  END CASE;
  
END PROCESS sel_AN;

end Behavioral;
