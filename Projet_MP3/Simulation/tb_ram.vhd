----------------------------------------------------------------------------------
-- Company: Enseirb-Matmeca
-- Engineer: Aline LAM & Nicolas BOISSEAU
-- 
-- Create Date: 11.03.2020 14:50:44
-- Design Name: 
-- Module Name: cpt_address - Behavioral
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

entity tb_ram is
--  Port ( );
end tb_ram;

architecture Behavioral of tb_ram is

component ram
    generic(
        BITS : INTEGER := 18
    );
    Port(  CLOCK          : IN  STD_LOGIC;
           CE             : IN  STD_LOGIC;
           ADDR_R         : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
           ADDR_W         : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
           READ_WRITE    : IN STD_LOGIC;
           DATA_IN       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
           DATA_OUT       : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
end component;

    CONSTANT BITS : INTEGER := 18;
    signal CLOCK : STD_LOGIC := '0';
    signal CE : STD_LOGIC := '0';
    signal ADDR_R : STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
    signal ADDR_W : STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
    signal READ_WRITE : STD_LOGIC := '0';
    signal DATA_IN : STD_LOGIC_VECTOR(15 DOWNTO 0);
    signal DATA_OUT : STD_LOGIC_VECTOR(10 DOWNTO 0);
    
    constant clk_period : time := 20 ns;
    
begin

module : ram Port map(CLOCK=>CLOCK,
                      CE=>CE,
                      ADDR_R=>ADDR_R,
                      ADDR_W=>ADDR_W,
                      READ_WRITE=>READ_WRITE,
                      DATA_IN=>DATA_IN,
                      DATA_OUT=>DATA_OUT);
                      
clock_process :process
         begin
         clock <= '0';
         wait for clk_period/2;
         clock <= '1';
         wait for clk_period/2;
         end process;                

stim_proc: process
          begin  
               CE <= '1';
            wait for clk_period;
               ADDR_W<=STD_LOGIC_VECTOR(TO_UNSIGNED(1,BITS));
               DATA_IN<=STD_LOGIC_VECTOR(TO_SIGNED(1,16));   
            wait for clk_period;
               READ_WRITE <= '1';
               ADDR_R<=STD_LOGIC_VECTOR(TO_UNSIGNED(2,BITS));
            wait for clk_period;
               ADDR_W<=STD_LOGIC_VECTOR(TO_UNSIGNED(3,BITS));
               DATA_IN<=STD_LOGIC_VECTOR(TO_SIGNED(-3,16));   
            wait for clk_period;
               READ_WRITE <= '0';
               ADDR_R<=STD_LOGIC_VECTOR(TO_UNSIGNED(3,BITS));
            wait for clk_period;
               ADDR_R<=STD_LOGIC_VECTOR(TO_UNSIGNED(1,BITS));
            wait;
end process;

end Behavioral;
