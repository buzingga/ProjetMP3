----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 03.04.2020 12:38:50
-- Design Name: 
-- Module Name: tb_top_level_part2 - Behavioral
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

entity tb_top_level_part2 is
--  Port ( );
end tb_top_level_part2;

architecture Behavioral of tb_top_level_part2 is

component top_level_part2
    Port ( clk : in STD_LOGIC;
           btnCpuReset : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           ampPWM : out STD_LOGIC;
           ampSD : out STD_LOGIC);          
end component;

-- inputs
        signal clk : STD_LOGIC := '0';
        signal rst : STD_LOGIC := '0';
        signal RsRx : STD_LOGIC := '0';
-- outputs      
        signal odata : STD_LOGIC;
        signal audio : STD_LOGIC;
-- Clock period definitions

      constant clk_period : time := 10 ns;
  
begin

module: top_level_part2 
    PORT MAP (
              clk => clk,
              btnCpuReset => rst,
              RsRX => RsRx,
              ampPWM => odata,
              ampSD => audio);
              
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
            rst <= '0';
           wait for clk_period;
            rst <= '1'; 
           wait for clk_period; 
           
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '0';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
           
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '0';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait for clk_period; 
            RsRX <= '1';
           wait;   
           end process; 

end Behavioral;
