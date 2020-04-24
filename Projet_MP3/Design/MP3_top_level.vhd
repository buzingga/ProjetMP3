----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 22.04.2020 15:50:50
-- Design Name: 
-- Module Name: MP3_top_level - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MP3_top_level is
  Port (   clk : in STD_LOGIC;
           btnCpuReset : in STD_LOGIC;
           btnU : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnD : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           ampPWM : out STD_LOGIC;
           ampSD : out STD_LOGIC;
           dp : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0));
end MP3_top_level;

architecture Behavioral of MP3_top_level is

signal pause : std_logic;
signal fw_bw : std_logic;
signal vol : std_logic_vector(3 downto 0);

component top_level_part1
    Port ( clk : in STD_LOGIC;
           btnCpuReset : in STD_LOGIC;
           btnU : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnD : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;
           dp : out STD_LOGIC;
           pause : out STD_LOGIC;
           fw_bw : out STD_LOGIC;
           vol : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component top_level_part2 
  Port ( clk : in STD_LOGIC;
         btnCpuReset : in STD_LOGIC;
         RsRx : in STD_LOGIC;
         vol : in STD_LOGIC_VECTOR(3 downto 0);
         fw_bw : in STD_LOGIC;
         pause : in STD_LOGIC;
         ampPWM : out STD_LOGIC;
         ampSD : out STD_LOGIC);
end component;

begin

i_top_level_part1 : top_level_part1
Port map(clk=>clk,btnCpuReset=>btnCpuReset,btnU=>btnU,btnC=>btnC,btnD=>btnD,btnL=>btnL,btnR=>btnR,DP=>dp,pause=>pause,fw_bw=>fw_bw,vol=>vol,seg=>seg,an=>an);

i_top_level_part2 : top_level_part2
Port map(clk=>clk,btnCpuReset=>btnCpuReset,RsRx=>RsRx,vol=>vol,fw_bw=>fw_bw,pause=>pause,ampPWM=>ampPWM,ampSD=>ampSD);

end Behavioral;
