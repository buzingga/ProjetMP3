----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 02.04.2020 21:40:44
-- Design Name: 
-- Module Name: cpt_timebase - Behavioral
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

entity cpt_timebase is
  Port ( clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         ce : out STD_LOGIC);
end cpt_timebase;

architecture Behavioral of cpt_timebase is

signal cnt :unsigned (11 downto 0) := (others => '0');

begin

count : PROCESS (clock,reset) IS
BEGIN 
  
  IF reset = '1' THEN
    cnt(11 downto 0) <= (others => '0');
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
        IF cnt < 2267 THEN
           cnt <= cnt + 1;
           ce <= '0';
        ELSE
           ce <= '1';
           cnt <= (others => '0');
        END IF;
  END IF;
 
END PROCESS count;

end Behavioral;
