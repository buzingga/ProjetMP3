----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 20.02.2020 15:06:50
-- Design Name: 
-- Module Name: tb_mux8 - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mux8 is
--  Port ( );
end tb_mux8;

architecture Behavioral of tb_mux8 is

component mux8
     Port ( seg_1 : in STD_LOGIC_VECTOR (6 downto 0);
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
end component;

    signal seg_1 : STD_LOGIC_VECTOR(6 downto 0) := "0000001";
    signal seg_2 : STD_LOGIC_VECTOR(6 downto 0) := "0000010";
    signal seg_3 : STD_LOGIC_VECTOR(6 downto 0) := "0000011";
    signal seg_4 : STD_LOGIC_VECTOR(6 downto 0) := "0000100";
    signal seg_5 : STD_LOGIC_VECTOR(6 downto 0) := "0000101";
    signal seg_6 : STD_LOGIC_VECTOR(6 downto 0) := "0000110";
    signal seg_7 : STD_LOGIC_VECTOR(6 downto 0) := "0000111";
    signal seg_8 : STD_LOGIC_VECTOR(6 downto 0) := "0001000";
    signal cmd : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal DP : STD_LOGIC := '0';
    signal SG : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
    
begin

module: mux8 PORT MAP (
              seg_1 => seg_1,
              seg_2 => seg_2,
              seg_3 => seg_3,
              seg_4 => seg_4,
              seg_5 => seg_5,
              seg_6 => seg_6,
              seg_7 => seg_7,
              seg_8 => seg_8,
              cmd => cmd,
              DP => DP,
              SG => SG
            );
            
stim_proc: process
          begin  
               cmd <= "000";
            wait for 100 ns;
               cmd <= "001";
            wait for 100 ns;
               cmd <= "010";
            wait for 100 ns;
               cmd <= "011";
            wait for 100 ns;
               cmd <= "100";
            wait for 100 ns;
               cmd <= "101";
            wait for 100 ns;
               cmd <= "110";
            wait for 100 ns;
               cmd <= "111";
            wait;
         end process;

end Behavioral;
