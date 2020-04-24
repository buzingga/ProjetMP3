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

entity cpt_1_9 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           decr : in STD_LOGIC;
           incr : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end cpt_1_9;

architecture Behavioral of cpt_1_9 is

signal cnt :unsigned (3 downto 0) := "0101";

begin

count : PROCESS (clock,reset) IS
BEGIN 
  
  IF reset = '1' THEN
    cnt <= "0101";
    output <= "0101";
  ELSIF clock'event AND clock = '1' THEN     -- rising clock edge
  
  IF incr = '1' AND cnt <9 THEN
    cnt <= cnt + 1;
  ELSIF decr = '1' AND cnt > 1 THEN
    cnt <= cnt - 1;
  END IF;
  
  output <= std_logic_vector(cnt);

  END IF;
    
END PROCESS count;

end Behavioral;
