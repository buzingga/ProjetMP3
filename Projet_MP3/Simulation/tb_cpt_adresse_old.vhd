----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 11.03.2020 14:50:44
-- Design Name: 
-- Module Name: tb_cpt_address - Behavioral
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

entity tb_cpt_address_old is
--  Port ( );
end tb_cpt_address_old;

architecture Behavioral of tb_cpt_address_old is

component cpt_address_old
    Port ( clock : in STD_LOGIC;
           CE : in STD_LOGIC;
           reset : in STD_LOGIC;
           address : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- inputs
   signal clock : STD_LOGIC := '0';
   signal CE : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';

--outputs
   signal address : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   
-- Clock period definitions
   constant clk_period : time := 10 ns;
   constant ce_period : time := 100 ns;

begin

    module: cpt_address_old PORT MAP (
              clock => clock,
              CE => CE,
              reset => reset,
              address => address );
              
-- create clock signal      
      clock_process :process
           begin
           clock <= '0';
           wait for clk_period/2;
           clock <= '1';
           wait for clk_period/2;
           end process;
           
     CE_process :process
           begin
           CE <= '0';
           wait for ce_period;
           CE <= '1';
           wait for clk_period;
           end process;
           
      stim_proc: process
            begin  
                 reset <= '1';
              wait for ce_period;
                 reset <= '0';
             wait;
           end process;              
              
end Behavioral;