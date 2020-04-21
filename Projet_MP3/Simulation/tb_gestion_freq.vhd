----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 19.02.2020 10:05:50
-- Design Name: 
-- Module Name: tb_gestion_freq - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_gestion_freq is
--  Port ( );
end tb_gestion_freq;

architecture Behavioral of tb_gestion_freq is

component gestion_freq
    Port (clock : in STD_LOGIC;
          reset : in STD_LOGIC; 
          CE_affichage : out STD_LOGIC;
          CE_perception: out STD_LOGIC);
end component;

-- inputs
   signal clock : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';
   
--outputs
      signal CE_affichage : STD_LOGIC;
      signal CE_perception : STD_LOGIC;
      
   -- Clock period definitions
      constant clk_period : time := 10 ns;

begin

    module: gestion_freq PORT MAP (
              clock => clock,
              reset => reset,
              Ce_affichage => CE_affichage,
              CE_perception => CE_perception
            );
        
-- create clock signal      
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
         wait for 100 ns;
            reset <= '0';
         wait for 200 ms;
      end process;

end Behavioral;
