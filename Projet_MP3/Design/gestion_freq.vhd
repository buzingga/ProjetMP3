----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 19.02.2020 08:55:44
-- Design Name: 
-- Module Name: gestion_freq - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gestion_freq is
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC; 
        CE_affichage : out STD_LOGIC;
        CE_perception: out STD_LOGIC);
end gestion_freq;

architecture Behavioral of gestion_freq is

signal cnt_affichage : unsigned (23 downto 0) := (others=>'0');
signal cnt_perception : unsigned (15 downto 0) := (others=>'0');

begin

count : PROCESS (clock,reset) IS
BEGIN  -- PROCESS spi_master
  
  IF reset = '1' THEN
    cnt_affichage <= (others=>'0');
    cnt_perception <= (others=>'0');
    CE_affichage <= '0';
    CE_perception <= '0';
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge  
    cnt_affichage <= cnt_affichage + 1;
    cnt_perception <= cnt_perception + 1;
    IF cnt_perception = 33333 THEN
        cnt_perception <= (others => '0');
        CE_perception <= '1'; 
    ELSE
        CE_perception <= '0';
    END IF;
    IF cnt_affichage = 10000000 THEN
        cnt_affichage<= (others=>'0');
        CE_affichage <= '1';
    ELSE
        CE_affichage <= '0';
    END IF;
  END IF;
END PROCESS count;

end Behavioral;
