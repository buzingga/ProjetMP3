----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 02.04.2020 21:50:44
-- Design Name: 
-- Module Name: tb_cpt_timebase - Behavioral
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

entity tb_cpt_timebase is
--  Port ( );
end tb_cpt_timebase;

architecture Behavioral of tb_cpt_timebase is

component cpt_timebase
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : out STD_LOGIC);
end component;

-- inputs
   signal clock : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';

--outputs
   signal ce : STD_LOGIC := '0';
   
-- Clock period definitions
   constant clk_period : time := 10 ns;
   constant ce_period : time := 100 ns;

begin

    module: cpt_timebase PORT MAP (
              clock => clock,
              reset => reset, 
              ce => ce);
              
-- create clock signal      
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
              wait for ce_period;
                 reset <= '0';  
              wait;   
            end process;    
                      
end Behavioral;