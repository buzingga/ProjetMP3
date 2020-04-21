----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 10.04.2020 15:46:50
-- Design Name: 
-- Module Name: tb_Volume_Manager - Behavioral
-- Project Name: ProjetMP3
-- Target Devices: Nexys4

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

entity tb_Volume_Manager is
--  Port ( );
end tb_Volume_Manager;

architecture Behavioral of tb_Volume_Manager is

component Volume_Manager
    Port ( clock : in std_logic;
           reset : in std_logic;
           ce : in std_logic;
           idata : in std_logic_vector(10 downto 0);
           switch : in std_logic_vector(3 downto 0);
           odata : out std_logic_vector(10 downto 0));
end component;

-- inputs
   signal clock : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';
   signal ce : STD_LOGIC := '0';
   signal idata : std_logic_vector(10 downto 0);
   signal switch : std_logic_vector(3 downto 0);
-- outputs
   signal odata : std_logic_vector(10 downto 0);
   
-- Clock period definitions
   constant clk_period : time := 20 ns;
   
begin

module: Volume_Manager PORT MAP (
              clock => clock,
              reset => reset,
              ce => ce,
              idata => idata,
              switch => switch,
              odata => odata
            );

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
            wait for clk_period;
               reset <= '0';
            wait for clk_period;
               ce <= '1';
            wait for clk_period;
               idata <= std_logic_vector(to_signed(511,11));
            wait for clk_period;
               idata <= std_logic_vector(to_signed(811,11));
               switch <= std_logic_vector(to_unsigned(6,4));
            wait for clk_period;
               idata <= std_logic_vector(to_signed(-811,11));
               switch <= std_logic_vector(to_unsigned(9,4));
            wait for clk_period;
               idata <= std_logic_vector(to_signed(322,11));
               switch <= std_logic_vector(to_unsigned(0,4));
            wait;
         end process;          

end Behavioral;
