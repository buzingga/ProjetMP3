----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 19.02.2020 08:55:44
-- Design Name: 
-- Module Name: Reg_Button - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
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

entity Reg_Button is

 Port ( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        input : in STD_LOGIC;
        output : out STD_LOGIC);
end Reg_Button;

architecture Behavioral of Reg_Button is

signal bascule : unsigned(1 downto 0);

begin

pulse : PROCESS (clock) IS
BEGIN 
    IF reset = '1' THEN
        bascule <="00";
        output <='0';
    ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
        bascule(0) <= input;
        bascule(1) <= bascule(0);
    IF bascule(0) = '1' and bascule(1) = '0' THEN
        output <='1';
    ELSE
        output <='0';
    END IF; 
  END IF;
END PROCESS pulse;

end Behavioral;