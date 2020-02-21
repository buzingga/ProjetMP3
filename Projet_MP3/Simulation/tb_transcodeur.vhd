----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 20.02.2020 20:45:50
-- Design Name: 
-- Module Name: tb_transcodeur - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_transcodeur is
--  Port ( );
end tb_transcodeur;

architecture Behavioral of tb_transcodeur is

component transcodeur
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
end component;

   signal FORWARD : STD_LOGIC := '0';
   signal PLAY_PAUSE : STD_LOGIC := '0';
   signal RESTART : STD_LOGIC := '0';
   signal volume : STD_LOGIC_VECTOR(3 downto 0);
   signal current_value : STD_LOGIC_VECTOR(10 downto 0);
   signal seg_volume : STD_LOGIC_VECTOR(6 downto 0);
   signal seg_value_1:  STD_LOGIC_VECTOR(6 downto 0);
   signal seg_value_2: STD_LOGIC_VECTOR(6 downto 0);
   signal seg_value_3: STD_LOGIC_VECTOR(6 downto 0);
   signal seg_cod_1: STD_LOGIC_VECTOR(6 downto 0);
   signal seg_cod_2: STD_LOGIC_VECTOR(6 downto 0);
   signal seg_cod_3: STD_LOGIC_VECTOR(6 downto 0);
   signal seg_cod_4: STD_LOGIC_VECTOR(6 downto 0);

begin

    module : transcodeur port map(FORWARD=>FORWARD,
                                 PLAY_PAUSE=>PLAY_PAUSE,
                                 RESTART=>RESTART,
                                 volume=>volume,
                                 current_value=>current_value,
                                 seg_volume=>seg_volume,
                                 seg_value_1=>seg_value_1,
                                 seg_value_2=>seg_value_2,
                                 seg_value_3=>seg_value_3,
                                 seg_cod_1=>seg_cod_1,
                                 seg_cod_2=>seg_cod_2,
                                 seg_cod_3=>seg_cod_3,
                                 seg_cod_4=>seg_cod_4
                                 );
    stim_proc: process
          begin  
               PLAY_PAUSE <= '0';
               RESTART <= '1';
               FORWARD <= '0';
               volume <= "0101";
               current_value <= std_logic_vector(to_unsigned(1,11));
            wait for 100 ns;
               PLAY_PAUSE <= '1';
               RESTART <= '0';
               FORWARD <= '1';
               volume <= "1001";
               current_value <= std_logic_vector(to_unsigned(599,11));
            wait for 100 ns;
               PLAY_PAUSE <= '1';
               RESTART <= '0';
               FORWARD <= '0';
               volume <= "0001";
               current_value <= std_logic_vector(to_unsigned(64,11));   
            wait for 100 ns;
               PLAY_PAUSE <= '0';
               RESTART <= '1';
               FORWARD <= '0';
               volume <= "0111";
               current_value <= std_logic_vector(to_unsigned(111,11));
            wait;
         end process;

end Behavioral;
