----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 03.04.2020 12:38:50
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

entity tb_top_level_part2_old is
--  Port ( );
end tb_top_level_part2_old;

architecture Behavioral of tb_top_level_part2_old is

component top_level_part2_old
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           odata : out STD_LOGIC;
           audio : out STD_LOGIC);          
end component;

-- inputs
        signal clk : STD_LOGIC := '0';
        signal rst : STD_LOGIC := '0';
-- outputs      
        signal odata : STD_LOGIC;
        signal audio : STD_LOGIC;
-- Clock period definitions
      constant clk_period : time := 10 ns;
        
begin

module: top_level_part2_old 
    PORT MAP (
              clk => clk,
              rst => rst,
              odata => odata,
              audio => audio);
              
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
           wait for clk_period;
            rst <= '0';  
           wait;   
           end process; 

end Behavioral;
