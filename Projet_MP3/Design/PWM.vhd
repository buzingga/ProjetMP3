----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 11.03.2020 14:25:44
-- Design Name: 
-- Module Name: PWM - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity PWM is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           idata : in STD_LOGIC_VECTOR(10 downto 0);
           odata : out STD_LOGIC;
           audio : out STD_LOGIC);
end PWM;

architecture Behavioral of PWM is

signal reg :unsigned (11 downto 0) := (others => '0');
signal cnt :unsigned (11 downto 0) := (others => '0');

begin

reg1 : process (clock,reset) is
begin 
  
    IF reset = '1' THEN
        reg <= (others => '0');
        cnt <= (others => '0');
    ELSIF clock'event AND clock = '1' THEN
        IF ce = '1' THEN
            reg <= unsigned(signed(idata) + to_signed(1024,12));
        ELSIF cnt < 2267 THEN
            cnt <= cnt + 1;
        ELSE
            cnt <= to_unsigned(0,12);
        END IF;
    END IF; 

end process reg1;

comb : process (reg, cnt)
begin

    IF cnt < reg THEN
        odata <= '1';
    ELSE
        odata <= '0';
    END IF;

end process comb;

audio <= '1';

end Behavioral;