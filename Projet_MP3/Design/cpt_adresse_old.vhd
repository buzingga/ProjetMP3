----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 11.03.2020 14:50:44
-- Design Name: 
-- Module Name: cpt_address - Behavioral
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

entity cpt_address_old is
  Port ( clock : in STD_LOGIC;
         CE : in STD_LOGIC;
         reset : in STD_LOGIC;
         address : out STD_LOGIC_VECTOR (15 downto 0));
end cpt_address_old;

architecture Behavioral of cpt_address_old is

signal cnt :unsigned (15 downto 0) := (others => '0');

begin

count : PROCESS (clock,reset) IS
BEGIN 
  
  IF reset = '1' THEN
    cnt(15 downto 0) <= (others => '0');
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
    IF CE = '1' THEN 
        IF cnt < 44100 THEN
           cnt <= cnt + 1;
        ELSE
            cnt <= (others => '0');
        END IF;
    END IF;
  END IF;
  
address <= std_logic_vector(cnt);
 
END PROCESS count;

end Behavioral;
