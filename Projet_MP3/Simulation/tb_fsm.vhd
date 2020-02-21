----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 20.02.2020 14:13:50
-- Design Name: 
-- Module Name: tb_fsm - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_fsm is
--  Port ( );
end tb_fsm;

architecture Behavioral of tb_fsm is

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
end component;

 signal clock : STD_LOGIC := '0';
 signal reset : STD_LOGIC := '0';
 signal B_CENTER : STD_LOGIC := '0';
 signal B_DOWN : STD_LOGIC := '0';
 signal B_UP : STD_LOGIC := '1';
 signal B_LEFT : STD_LOGIC := '0';
 signal B_RIGHT : STD_LOGIC := '0';
 signal PLAY_PAUSE : STD_LOGIC := '0';
 signal RESTART : STD_LOGIC := '0';
 signal FORWARD : STD_LOGIC := '0';
 signal VOLUME_UP : STD_LOGIC := '0';
 signal VOLUME_DOWN : STD_LOGIC := '0';
 
 constant clk_period : time := 20 ns;

begin

module: FSM port map(
        clock=>clock,
        reset=>reset,
        B_CENTER=>B_CENTER,
        B_UP=>B_UP,
        B_DOWN=>B_DOWN,
        B_LEFT=>B_LEFT,
        B_RIGHT=>B_RIGHT,
        PLAY_PAUSE=>PLAY_PAUSE,
        RESTART=>RESTART,
        FORWARD=>FORWARD,
        VOLUME_UP=>VOLUME_UP,
        VOLUME_DOWN=>VOLUME_DOWN);

clock_process :process
         begin
         clock <= '0';
         wait for clk_period/2;
         clock <= '1';
         wait for clk_period/2;
         end process;
         
stim_proc: process
          begin  
               reset <= '1';
            wait for clk_period;
               reset <= '0';
            wait for clk_period; 
                B_CENTER <= '1';
            wait for clk_period;
                B_CENTER <= '1';
            wait for clk_period;
                B_CENTER <= '0';
                B_LEFT <= '1';
            wait for clk_period; 
                B_LEFT <= '0';
                B_CENTER <= '1';
            wait for clk_period; 
                B_CENTER <= '0';
                B_RIGHT <= '1';
            wait for clk_period; 
                B_RIGHT <= '0';
                B_CENTER <= '1';
            wait for clk_period; 
                B_CENTER <= '1';
            wait for clk_period; 
                B_CENTER <= '1';
            wait;
         end process;

end Behavioral;
