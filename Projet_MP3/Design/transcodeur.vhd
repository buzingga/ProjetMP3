----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 20.02.2020 16:56:50
-- Design Name: 
-- Module Name: transcodeur - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity transcodeur is
    Port (  FORWARD : in STD_LOGIC;
            PLAY_PAUSE : in STD_LOGIC;
            RESTART : in STD_LOGIC;
            volume : in STD_LOGIC_VECTOR(3 downto 0);
            current_value : in STD_LOGIC_VECTOR(10 downto 0);
            seg_volume : out STD_LOGIC_VECTOR(6 downto 0);
            seg_value_1: out STD_LOGIC_VECTOR(6 downto 0);
            seg_value_2: out STD_LOGIC_VECTOR(6 downto 0);
            seg_value_3: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_1: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_2: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_3: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_4: out STD_LOGIC_VECTOR(6 downto 0));
end transcodeur;

architecture Behavioral of transcodeur is

signal number: unsigned(10 downto 0);
signal unit_ini: unsigned(10 downto 0);
signal tenth_ini: unsigned(10 downto 0);
signal hundr_ini: unsigned(10 downto 0);

signal unit: std_logic_vector(3 downto 0);
signal tenth: std_logic_vector(3 downto 0);
signal hundr: std_logic_vector(3 downto 0);

begin

affichage_volume : process(volume) is
begin
    CASE (volume) IS
      WHEN "0000" => seg_volume <= "1000000"; --Affiche 0
      WHEN "0001" => seg_volume <= "1111001"; --Affiche 1
      WHEN "0010" => seg_volume <= "0100100"; --Affiche 2
      WHEN "0011" => seg_volume <= "0110000"; --Affiche 3
      WHEN "0100" => seg_volume <= "0011001"; --Affiche 4
      WHEN "0101" => seg_volume <= "0010010"; --Affiche 5
      WHEN "0110" => seg_volume <= "0000010"; --Affiche 6
      WHEN "0111" => seg_volume <= "1111000"; --Affiche 7
      WHEN "1000" => seg_volume <= "0000000"; --Affiche 8
      WHEN "1001" => seg_volume <= "0010000"; --Affiche 9
      WHEN OTHERS => NULL;
    END CASE;
end process affichage_volume;

number <= Unsigned(current_value);

hundr_ini <= number/100;
tenth_ini <= (number mod 100)/10;      
unit_ini <= (number mod 100)mod 10;

hundr <= std_logic_vector(hundr_ini(3 downto 0));
tenth <= std_logic_vector(tenth_ini(3 downto 0));
unit <= std_logic_vector(unit_ini(3 downto 0));

affichage_valeur : process(hundr, tenth, unit) is
begin    

CASE (hundr) IS
      WHEN "0000" => seg_value_1 <= "1000000"; --Affiche 0
      WHEN "0001" => seg_value_1  <= "1111001"; --Affiche 1
      WHEN "0010" => seg_value_1  <= "0100100"; --Affiche 2
      WHEN "0011" => seg_value_1  <= "0110000"; --Affiche 3
      WHEN "0100" => seg_value_1  <= "0011001"; --Affiche 4
      WHEN "0101" => seg_value_1  <= "0010010"; --Affiche 5
      WHEN "0110" => seg_value_1  <= "0000010"; --Affiche 6
      WHEN "0111" => seg_value_1  <= "1111000"; --Affiche 7
      WHEN "1000" => seg_value_1  <= "0000000"; --Affiche 8
      WHEN "1001" => seg_value_1  <= "0010000"; --Affiche 9
      WHEN OTHERS => NULL;
    END CASE;
    
CASE (tenth) IS
      WHEN "0000" => seg_value_2 <= "1000000"; --Affiche 0
      WHEN "0001" => seg_value_2  <= "1111001"; --Affiche 1
      WHEN "0010" => seg_value_2  <= "0100100"; --Affiche 2
      WHEN "0011" => seg_value_2  <= "0110000"; --Affiche 3
      WHEN "0100" => seg_value_2  <= "0011001"; --Affiche 4
      WHEN "0101" => seg_value_2  <= "0010010"; --Affiche 5
      WHEN "0110" => seg_value_2  <= "0000010"; --Affiche 6
      WHEN "0111" => seg_value_2  <= "1111000"; --Affiche 7
      WHEN "1000" => seg_value_2  <= "0000000"; --Affiche 8
      WHEN "1001" => seg_value_2  <= "0010000"; --Affiche 9
      WHEN OTHERS => NULL;
    END CASE;
    
CASE (unit) IS
      WHEN "0000" => seg_value_3 <= "1000000"; --Affiche 0
      WHEN "0001" => seg_value_3  <= "1111001"; --Affiche 1
      WHEN "0010" => seg_value_3  <= "0100100"; --Affiche 2
      WHEN "0011" => seg_value_3  <= "0110000"; --Affiche 3
      WHEN "0100" => seg_value_3  <= "0011001"; --Affiche 4
      WHEN "0101" => seg_value_3  <= "0010010"; --Affiche 5
      WHEN "0110" => seg_value_3  <= "0000010"; --Affiche 6
      WHEN "0111" => seg_value_3  <= "1111000"; --Affiche 7
      WHEN "1000" => seg_value_3  <= "0000000"; --Affiche 8
      WHEN "1001" => seg_value_3  <= "0010000"; --Affiche 9
      WHEN OTHERS => NULL;
    END CASE;
    
end process affichage_valeur;    
 
affichage_state : process(FORWARD, PLAY_PAUSE, RESTART) is
begin
    IF(PLAY_PAUSE = '0' and RESTART = '1' and FORWARD = '0') THEN -- init or stop
    seg_cod_1 <= "1000110"; --Affiche [
    seg_cod_2 <= "0111111"; --Affiche -
    seg_cod_3 <= "0111111"; --Affiche -
    seg_cod_4 <= "1110000"; --Affiche ]
    ELSIF(PLAY_PAUSE = '1' and RESTART = '0' and FORWARD = '1') THEN -- play fwd
    seg_cod_1 <= "0111111"; --Affiche -
    seg_cod_2 <= "0111111"; --Affiche -
    seg_cod_3 <= "0111111"; --Affiche -
    seg_cod_4 <= "1110000"; --Affiche ]
    ELSIF(PLAY_PAUSE = '1' and RESTART = '0' and FORWARD = '0') THEN -- play bwd
    seg_cod_1 <= "1000110"; --Affiche [
    seg_cod_2 <= "0111111"; --Affiche -
    seg_cod_3 <= "0111111"; --Affiche -
    seg_cod_4 <= "0111111"; --Affiche -
    ELSIF(PLAY_PAUSE = '0' and RESTART = '0' and FORWARD = '0') THEN -- pause
    seg_cod_1 <= "0111111"; --Affiche -
    seg_cod_2 <= "0111111"; --Affiche -
    seg_cod_3 <= "0111111"; --Affiche -
    seg_cod_4 <= "0111111"; --Affiche -
    END IF; 
end process affichage_state;

end Behavioral;
