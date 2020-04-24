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

entity cpt_address is
  generic(
        BITS : INTEGER := 18
  );
  Port ( clock : in STD_LOGIC;
         CE : in STD_LOGIC;
         reset : in STD_LOGIC;
         DATA_IN : in STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         pause : in STD_LOGIC;
         fw_bw : in STD_LOGIC;
         address : out STD_LOGIC_VECTOR(BITS-1 downto 0));
end cpt_address;

architecture Behavioral of cpt_address is

signal cnt :unsigned (BITS-1 downto 0) := (others => '0');
signal flip :unsigned (BITS-1 downto 0) := (others => '0');
signal flop :unsigned (BITS-1 downto 0) := (others => '0');
CONSTANT MAX_ADDR : INTEGER := 2**BITS - 1;
signal MAX :unsigned (BITS-1 downto 0) := to_unsigned(0,BITS);

begin

count : PROCESS (clock,reset) IS
BEGIN 
  
  IF reset = '1' THEN
    cnt(BITS-1 downto 0) <= (others => '0');
    flip(BITS-1 downto 0) <= (others => '0');
    flop(BITS-1 downto 0) <= (others => '0');
    address(BITS-1 downto 0) <= (others => '0');
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
    IF CE = '1' THEN 
    flip <= unsigned(DATA_IN);
    flop <= flip;
        IF (flip=flop) THEN
            IF flop > 0 THEN
               MAX<=flip;
               flip(BITS-1 downto 0) <= (others => '0');
               flip(BITS-1 downto 0) <= (others => '0');
            END IF;
        ELSIF pause = '1' THEN
            IF fw_bw = '1' THEN
                IF cnt < MAX THEN
                    cnt <= cnt + 1;
                ELSE
                    cnt <= (others => '0');
                END IF;
            ELSE
                IF cnt > 0 THEN
                    cnt <= cnt - 1;
                ELSE
                    cnt <= MAX;
                END IF;
            END IF;
        END IF;
    END IF;
 END IF;
  
address <= std_logic_vector(cnt);
 
END PROCESS count;

end Behavioral;