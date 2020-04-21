----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 03.04.2020 08:50:50
-- Design Name: 
-- Module Name: top_level_part2 - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level_part2 is
  Port ( clk : in STD_LOGIC;
         btnCpuReset : in STD_LOGIC;
         RsRx : in STD_LOGIC;
         ampPWM : out STD_LOGIC;
         ampSD : out STD_LOGIC);
end top_level_part2;

architecture Behavioral of top_level_part2 is

CONSTANT BITS : INTEGER := 18;
CONSTANT RAM_ADDR_BITS : INTEGER := 18;

signal rst : std_logic;
signal ce : std_logic;
signal ADDRESS_OUT : std_logic_vector(BITS-1 downto 0);
signal ADDRESS_IN : std_logic_vector(BITS-1 downto 0);
signal DATA_IN   : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal DATA_OUT   : STD_LOGIC_VECTOR (10 DOWNTO 0);
signal READ_WRITE : std_logic;

component gen_audio
 Port (  clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         READ_WRITE : in STD_LOGIC;
         DATA_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         ADDRESS_IN : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         odata : out STD_LOGIC;
         audio : out STD_LOGIC );
end component;

component full_UART_recv
    Port ( clk_100MHz  : in  STD_LOGIC;
           reset       : in  STD_LOGIC;
           rx          : in  STD_LOGIC;
           memory_addr : out STD_LOGIC_VECTOR (RAM_ADDR_BITS-1 downto 0);
           data_value  : out STD_LOGIC_VECTOR (15 downto 0);
           memory_wen  : out STD_LOGIC);
end component;
          
begin

rst<= not btnCpuReset;

i_gen_audio : gen_audio
Port map(clk=>clk,rst=>rst,READ_WRITE=>READ_WRITE,DATA_IN=>DATA_IN,ADDRESS_IN=>ADDRESS_IN,odata=>ampPWM,audio=>ampSD);

i_full_UART_recv : full_UART_recv
Port map(clk_100MHz=>clk,reset=>rst,rx=>RsRx,memory_addr=>ADDRESS_IN,data_value=>DATA_IN,memory_wen=>READ_WRITE);

end Behavioral;
