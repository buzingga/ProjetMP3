----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline Lam & Nicolas Boisseau
-- 
-- Create Date: 19.02.2020 10:05:50
-- Design Name: 
-- Module Name: tb_Reg_Button - Behavioral
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

entity tb_Reg_Button is
--  Port ( );
end tb_Reg_Button;

architecture Behavioral of tb_Reg_Button is

component Reg_Button
 Port ( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        input : in STD_LOGIC;
        output : out STD_LOGIC);
end component;

-- inputs
   signal clock : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';
   signal input : STD_LOGIC := '0';
--outputs
   signal output : STD_LOGIC := '0';
   
-- Clock period definitions
      constant clk_period : time := 20 ns;
      
begin 

   module: Reg_Button PORT MAP (
          clock => clock,
          reset => reset,
          input => input,
          output => output
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
       wait for 100 ns;
          reset <= '0';
          input <= '0';
       wait for 100 ns; 
          input <= '1';
       wait for 100 ns;
          input <= '0';
       wait;
    end process;

end Behavioral;