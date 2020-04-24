----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 10.04.2020 15:06:50
-- Design Name: 
-- Module Name: Volume_Manager - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Volume_Manager is
  Port ( clock : in std_logic;
         reset : in std_logic;
         ce : in std_logic;
         idata : in std_logic_vector(10 downto 0);
         switch : in std_logic_vector(3 downto 0);
         odata : out std_logic_vector(10 downto 0));
end Volume_Manager;

architecture Behavioral of Volume_Manager is

CONSTANT MAX_VOL : INTEGER := 2**9;
signal data : signed (10 downto 0);

begin

    volume_manager : process (clock,reset) is
    begin
    IF reset = '1' THEN
        data<=to_signed(0,11);
    ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
        IF ce = '1' THEN
            CASE (switch) IS
                WHEN "0001" => data<= resize(signed(idata(10 downto 8)),11);
                WHEN "0010" => data<= resize(signed(idata(10 downto 7)),11);
                WHEN "0011" => data<= resize(signed(idata(10 downto 6)),11);
                WHEN "0100" => data<= resize(signed(idata(10 downto 5)),11);
                WHEN "0101" => data<= resize(signed(idata(10 downto 4)),11);
                WHEN "0110" => data<= resize(signed(idata(10 downto 3)),11);
                WHEN "0111" => data<= resize(signed(idata(10 downto 2)),11);
                WHEN "1000" => data<= resize(signed(idata(10 downto 1)),11);
                WHEN "1001" => data<= signed(idata);
                WHEN OTHERS => NULL;
           END CASE;
        END IF;
    END IF;
    end process volume_manager;
   
    odata<=std_logic_vector(data);

end Behavioral;
