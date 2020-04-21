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

entity top_level_part2_old is
  Port ( clk : in STD_LOGIC;
         btnCpuReset : in STD_LOGIC;
         ampPWM : out STD_LOGIC;
         ampSD : out STD_LOGIC);
end top_level_part2_old;

architecture Behavioral of top_level_part2_old is

signal ce : std_logic;
signal rst : std_logic;
signal address : std_logic_vector(15 downto 0);
signal data_out : std_logic_vector(10 downto 0);

component cpt_timebase
 Port (  clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         ce : out STD_LOGIC);
end component;

component cpt_address_old
 Port (  clock : in STD_LOGIC;
         CE : in STD_LOGIC;
         reset : in STD_LOGIC;
         address : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component wav_rom
 Port (  CLOCK          : IN  STD_LOGIC;
         ADDR_R         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         DATA_OUT       : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
 end component;
 
 component PWM
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           idata : in STD_LOGIC_VECTOR(10 downto 0);
           odata : out STD_LOGIC;
           audio : out STD_LOGIC);
end component;
 
begin

rst<= not btnCpuReset;

i_cpt_timebase : cpt_timebase
Port map(clock=>clk,reset=>rst,ce=>ce);

i_cpt_address_old : cpt_address_old
Port map(clock=>clk,CE=>ce,reset=>rst,address=>address);

i_wav_rom : wav_rom
Port map(CLOCK=>clk,ADDR_R=>address,DATA_OUT=>data_out);

i_PWM : PWM
Port map(clock=>clk,reset=>rst,ce=>ce,idata=>data_out,odata=>ampPWM,audio=>ampSD);

end Behavioral;
