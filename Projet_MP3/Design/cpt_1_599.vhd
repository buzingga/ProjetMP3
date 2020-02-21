----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 19.02.2020 08:55:44
-- Design Name: 
-- Module Name: cpt_1_599 - Behavioral
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

entity cpt_1_599 is
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           reset : in STD_LOGIC;
           init : in STD_LOGIC;
           decr : in STD_LOGIC;
           incr : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (10 downto 0));
end cpt_1_599;

architecture Behavioral of cpt_1_599 is

signal cnt :unsigned (10 downto 0) := (others => '0');

begin

count : PROCESS (clock,reset) IS
BEGIN 
  
  IF reset = '1' THEN
    cnt(10 downto 1) <= (others => '0');
    cnt(0) <= '1';
    output <= (others => '0');
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
    IF ce = '1' THEN 
        IF incr = '1' THEN
            IF cnt < 599 THEN 
                cnt <= cnt + 1;
            ELSIF cnt = 599 THEN 
                cnt <= (others => '0');
            END IF;
        ELSIF decr = '1' THEN
            IF cnt > 0 THEN
                cnt <= cnt - 1;
            ELSIF cnt = 0 THEN
                cnt <= to_unsigned(599,11);
            END IF;
        ELSIF init = '1' THEN
            cnt <= (others => '0');
        END IF;
    END IF;
  END IF;
  
output <= std_logic_vector(cnt);
 
END PROCESS count;

end Behavioral;
