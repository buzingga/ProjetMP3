----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 21.02.2020 08:50:50
-- Design Name: 
-- Module Name: top_level_part1 - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level_part1 is
    Port ( clk : in STD_LOGIC;
           btnCpuReset : in STD_LOGIC;
           btnU : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnD : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;
           led0 : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0));
end top_level_part1;

architecture Behavioral of top_level_part1 is

signal rst : std_logic;
signal BTN_PULSE_UP:std_logic;
signal BTN_PULSE_DOWN:std_logic;
signal BTN_PULSE_CENTER:std_logic;
signal BTN_PULSE_LEFT:std_logic;
signal BTN_PULSE_RIGHT:std_logic;
signal FORWARD:std_logic;
signal PLAY_PAUSE:std_logic;
signal RESTART:std_logic;
signal VOLUME_DOWN:std_logic;
signal VOLUME_UP:std_logic;
signal ce_affichage:std_logic;
signal ce_perception:std_logic;
signal volume:std_logic_vector(3 downto 0);
signal current_value:std_logic_vector(10 downto 0);
signal cmd:std_logic_vector(2 downto 0);
signal seg1:std_logic_vector(6 downto 0);
signal seg2:std_logic_vector(6 downto 0);
signal seg3:std_logic_vector(6 downto 0);
signal seg4:std_logic_vector(6 downto 0);
signal seg5:std_logic_vector(6 downto 0);
signal seg6:std_logic_vector(6 downto 0);
signal seg7:std_logic_vector(6 downto 0);
signal seg8:std_logic_vector(6 downto 0);

component Reg_Button
 Port ( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        input : in STD_LOGIC;
        output : out STD_LOGIC);
end component;

component gestion_freq
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC; 
        CE_affichage : out STD_LOGIC;
        CE_perception: out STD_LOGIC);
end component;

component FSM
    PORT ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           B_CENTER : in STD_LOGIC;
           B_DOWN : in STD_LOGIC;
           B_UP : in STD_LOGIC;
           B_LEFT : in STD_LOGIC;
           B_RIGHT : in STD_LOGIC;
           PLAY_PAUSE : out STD_LOGIC;
           RESTART : out STD_LOGIC;
           FORWARD : out STD_LOGIC;
           VOLUME_UP : out STD_LOGIC;
           VOLUME_DOWN : out STD_LOGIC);
END component;

component cpt_1_9
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           decr : in STD_LOGIC;
           incr : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component cpt_1_599 
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           reset : in STD_LOGIC;
           init : in STD_LOGIC;
           decr : in STD_LOGIC;
           incr : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (10 downto 0));
end component;

component mod8
     Port ( clock : in STD_LOGIC;
            ce : in STD_LOGIC;
            reset : in STD_LOGIC;
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            output : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component transcodeur
    Port (  FORWARD : in STD_LOGIC;
            PLAY_PAUSE : in STD_LOGIC;
            RESTART : in STD_LOGIC;
            volume : in STD_LOGIC_VECTOR(3 downto 0);
            current_value : in STD_LOGIC_VECTOR(10 downto 0);
            seg_volume : out STD_LOGIC_VECTOR(6 downto 0);
            seg_value_1: out STD_LOGIC_VECTOR(6 downto 0);
            seg_value_2: out STD_LOGIC_VECTOR(6 downto 0);
            seg_value_3: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_1: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_2: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_3: out STD_LOGIC_VECTOR(6 downto 0);
            seg_cod_4: out STD_LOGIC_VECTOR(6 downto 0));
end component;

component mux8
    Port (seg_1 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_2 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_3 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_4 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_5 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_6 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_7 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_8 : in STD_LOGIC_VECTOR (6 downto 0);
           cmd : in STD_LOGIC_VECTOR (2 downto 0);
           DP : out STD_LOGIC;
           SG : out STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

rst<= not btnCpuReset;

i_Reg_B_CENTER : Reg_Button
Port map(clock=>clk,reset=>rst,input=>btnC,output=>BTN_PULSE_CENTER);

i_Reg_B_UP : Reg_Button
Port map(clock=>clk,reset=>rst,input=>btnU,output=>BTN_PULSE_UP);

i_Reg_B_DOWN : Reg_Button
Port map(clock=>clk,reset=>rst,input=>btnD,output=>BTN_PULSE_DOWN);

i_Reg_B_LEFT : Reg_Button
Port map(clock=>clk,reset=>rst,input=>btnL,output=>BTN_PULSE_LEFT);

i_Reg_B_RIGHT : Reg_Button
Port map(clock=>clk,reset=>rst,input=>btnR,output=>BTN_PULSE_RIGHT);

i_gestion_freq :gestion_freq
Port map(clock=>clk,reset=>rst,CE_affichage=>ce_affichage,CE_perception=>ce_perception);

i_FSM_MP3 : FSM
Port map(clock=>clk,reset=>rst,B_CENTER=>BTN_PULSE_CENTER,B_UP=>BTN_PULSE_UP,B_DOWN=>BTN_PULSE_DOWN,
B_LEFT=>BTN_PULSE_LEFT,B_RIGHT=>BTN_PULSE_RIGHT,PLAY_PAUSE=>PLAY_PAUSE,RESTART=>RESTART,FORWARD=>FORWARD,
VOLUME_UP=>VOLUME_UP,VOLUME_DOWN=>VOLUME_DOWN);

i_cpt_1_9 :cpt_1_9
Port map(clock=>clk,reset=>rst,decr=>VOLUME_DOWN,incr=>VOLUME_UP,output=>volume);

i_cpt_1_599 :cpt_1_599
Port map(clock=>clk,ce=>ce_affichage,reset=>rst,init=>RESTART,decr=>FORWARD,incr=>PLAY_PAUSE,output=>current_value);

i_transcodeur :transcodeur
Port map(FORWARD=>FORWARD,PLAY_PAUSE=>PLAY_PAUSE,RESTART=>RESTART,volume=>volume,current_value=>current_value,
seg_volume=>seg1,seg_value_1=>seg2,seg_value_2=>seg3,seg_value_3=>seg4,seg_cod_1=>seg5,seg_cod_2=>seg6,
seg_cod_3=>seg7,seg_cod_4=>seg8);

i_mod8 :mod8
Port map(clock=>clk,ce=>ce_perception,reset=>rst,AN=>an,output=>cmd);

i_mux8 :mux8
Port map(seg_1=>seg8,seg_2=>seg7,seg_3=>seg6,seg_4=>seg5,seg_5=>seg4,seg_6=>seg3,seg_7=>seg2,seg_8=>seg1,cmd=>cmd,
DP=>led0,SG=>seg);

end Behavioral;



