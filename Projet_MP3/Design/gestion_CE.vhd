----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 11.03.2020 14:50:44
-- Design Name: 
-- Module Name: gestion_CE - Behavioral
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

entity gestion_CE is
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC; 
        CE : out STD_LOGIC);     -- freq : 44100 Hz
end gestion_CE;

architecture Behavioral of gestion_CE is

signal cnt : unsigned (11 downto 0) := (others=>'0');

begin

count : PROCESS (clock,reset) IS
BEGIN  -- PROCESS spi_master
  
  IF reset = '1' THEN
    cnt <= (others=>'0');
    CE <= '0';
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge  
    cnt <= cnt + 1;
    IF cnt = 2267 THEN
        cnt <= (others => '0');
        CE <= '1'; 
    ELSE
        CE <= '0';
    END IF;
  END IF;
END PROCESS count;

end Behavioral;
