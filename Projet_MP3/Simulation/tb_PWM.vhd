----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 11.03.2020 14:25:44
-- Design Name: 
-- Module Name: tb_PWM - Behavioral
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

entity tb_PWM is
--  Port ( );
end tb_PWM;

architecture Behavioral of tb_PWM is

component PWM
    Port(   clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            ce : in STD_LOGIC;
            idata : in STD_LOGIC_VECTOR(10 downto 0);
            odata : out STD_LOGIC;
            audio : out STD_LOGIC);
end component;

   signal clock : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';
   signal ce : STD_LOGIC := '0';
   signal idata : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
   signal odata : STD_LOGIC;
   signal audio : STD_LOGIC;
   
-- Clock period definitions
   constant clk_period : time := 10 ns;
   constant ce_period : time := 22 us;
   
begin

    module: PWM PORT MAP (
        clock => clock,
        reset => reset,
        ce => ce,
        idata => idata,
        odata => odata,
        audio => audio
    );

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
               idata <= std_logic_vector(to_signed(511,11));
            wait for ce_period;
               idata <= std_logic_vector(to_signed(-1000,11));
            wait for ce_period;
               idata <= std_logic_vector(to_signed(0,11));
            wait for ce_period;
               idata <= std_logic_vector(to_signed(1000,11));
            wait;
         end process;  
         
end Behavioral;