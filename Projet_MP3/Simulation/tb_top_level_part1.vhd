----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 21.02.2020 08:50:50
-- Design Name: 
-- Module Name: tb_top_level_part1 - Behavioral
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

entity tb_top_level_part1 is
--  Port ( );
end tb_top_level_part1;

architecture Behavioral of tb_top_level_part1 is

component top_level_part1
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           btnU : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnD : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;
           DP : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0));          
end component;

-- inputs
        signal clk : STD_LOGIC := '0';
        signal rst : STD_LOGIC := '0';
        signal btnU : STD_LOGIC := '0';
        signal btnC : STD_LOGIC := '0';
        signal btnD : STD_LOGIC := '0';
        signal btnL : STD_LOGIC := '0';
        signal btnR : STD_LOGIC := '0';
   
--outputs
      signal DP : STD_LOGIC;
      signal seg : STD_LOGIC_VECTOR(6 downto 0);
      signal an : STD_LOGIC_VECTOR(7 downto 0);
      
-- Clock period definitions
      constant clk_period : time := 10 ns;

begin
    module: top_level_part1 PORT MAP (
              clk => clk,
              rst => rst,
              btnU => btnU,
              btnC => btnC,
              btnD => btnD,
              btnL => btnL,
              btnR => btnR,
              DP => DP,
              seg => seg,
              an => an );
              
    -- create clock signal      
      clock_process :process
           begin
           clk <= '0';
           wait for clk_period/2;
           clk <= '1';
           wait for clk_period/2;
           end process;
           
    stim_proc: process
        begin  
               rst <= '1';
            wait for 100 ns;
               rst <= '0';
            wait for 100 ns; 
                btnC <= '1';
            wait for 100 ns;
                btnC <= '1';
            wait for 100 ns;
                btnC <= '0';
                btnL <= '1';
            wait for 100 ns; 
                btnL <= '0';
                btnC <= '1';
            wait for 100 ns; 
                btnC <= '0';
                btnR <= '1';
            wait for 100 ns; 
                btnR <= '0';
                btnC <= '1';
            wait for 100 ns; 
                btnC <= '1';
            wait for 100 ns; 
                btnC <= '1';
            wait;
        end process;
end Behavioral;
