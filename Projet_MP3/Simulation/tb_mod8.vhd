----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 20.02.2020 15:06:50
-- Design Name: 
-- Module Name: tb_mod8 - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mod8 is
--  Port ( );
end tb_mod8;

architecture Behavioral of tb_mod8 is

component mod8
     Port ( clock : in STD_LOGIC;
            ce : in STD_LOGIC;
            reset : in STD_LOGIC;
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            output : out STD_LOGIC_VECTOR(2 downto 0));
end component;

   signal clock : STD_LOGIC := '0';
   signal ce : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';
   signal AN : STD_LOGIC_VECTOR(7 downto 0);
   signal output : STD_LOGIC_VECTOR(2 downto 0);

   constant clk_period : time := 20 ns;
   
begin

module: mod8 PORT MAP (
              clock => clock,
              ce => ce,
              reset => reset,
              AN => AN,
              output => output
            );

clock_process :process
         begin
         clock <= '0';
         wait for clk_period/2;
         clock <= '1';
         wait for clk_period/2;
         end process;
         
stim_proc: process
          begin  
               reset <= '1';
               ce <= '1';
            wait for 100 ns;
               reset <= '0';
            wait;
         end process;


end Behavioral;
