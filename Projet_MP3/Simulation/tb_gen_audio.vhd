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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_gen_audio is
--  Port ( );
end tb_gen_audio;

architecture Behavioral of tb_gen_audio is

component gen_audio
    generic(
             BITS : INTEGER := 18
      );
    Port ( clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         READ_WRITE : in STD_LOGIC;
         DATA_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         ADDRESS_IN : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         odata : out STD_LOGIC;
         audio : out STD_LOGIC);          
end component;

-- inputs
        CONSTANT BITS : INTEGER := 18;
        signal clk : STD_LOGIC := '0';
        signal rst : STD_LOGIC := '0';
        signal read_write : STD_LOGIC := '0';
        signal DATA_IN : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others =>'0');
        signal ADDRESS_IN :  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0) := (others =>'0');
-- outputs      
        signal odata : STD_LOGIC;
        signal audio : STD_LOGIC;
-- Clock period definitions
      constant clk_period : time := 10 ns;
        
begin

    module: gen_audio
        PORT MAP (
                  clk => clk,
                  rst => rst,
                  READ_WRITE => READ_WRITE,
                  DATA_IN => DATA_IN,
                  ADDRESS_IN => ADDRESS_IN,
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
           wait for clk_period;
              READ_WRITE <= '1';
              ADDRESS_IN<=STD_LOGIC_VECTOR(TO_UNSIGNED(0,BITS));
              DATA_IN<=STD_LOGIC_VECTOR(TO_SIGNED(-1023,16));
           wait for 23us;
              READ_WRITE <= '1';
              ADDRESS_IN<=STD_LOGIC_VECTOR(TO_UNSIGNED(1,BITS));
              DATA_IN<=STD_LOGIC_VECTOR(TO_SIGNED(-500,16));
           wait for 23us;
              READ_WRITE <= '1';
              ADDRESS_IN<=STD_LOGIC_VECTOR(TO_UNSIGNED(2,BITS));
              DATA_IN<=STD_LOGIC_VECTOR(TO_SIGNED(500,16));  
           wait for 23us;
              READ_WRITE <= '1';
              ADDRESS_IN<=STD_LOGIC_VECTOR(TO_UNSIGNED(3,BITS));
              DATA_IN<=STD_LOGIC_VECTOR(TO_SIGNED(1023,16)); 
           wait for 23us;
              READ_WRITE <= '0';
           wait;   
           end process; 

end Behavioral;
