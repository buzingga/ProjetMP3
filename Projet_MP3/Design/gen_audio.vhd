----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2020 17:48:18
-- Design Name: 
-- Module Name: gen_audio - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
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

entity gen_audio is
  generic(
         BITS : INTEGER := 18
  );
  Port ( clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         READ_WRITE : in STD_LOGIC;
         DATA_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         ADDRESS_IN : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         odata : out STD_LOGIC;
         audio : out STD_LOGIC );
end gen_audio;

architecture Behavioral of gen_audio is

CONSTANT RAM_ADDR_BITS : INTEGER := 18;


signal ce : std_logic;
signal ADDRESS_OUT : std_logic_vector(BITS-1 downto 0);
signal DATA_OUT   : STD_LOGIC_VECTOR (10 DOWNTO 0);

component cpt_timebase
 Port (  clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         ce : out STD_LOGIC);
end component;

component cpt_address
 Port (  clock : in STD_LOGIC;
         CE : in STD_LOGIC;
         reset : in STD_LOGIC;
         DATA_IN : in STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         address : out STD_LOGIC_VECTOR(BITS-1 downto 0));
end component;

component ram
 Port (  CLOCK          : IN  STD_LOGIC;
         --CE             : IN  STD_LOGIC;
         ADDR_R         : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         ADDR_W         : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
         READ_WRITE    : IN STD_LOGIC;
         DATA_IN       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         DATA_OUT       : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
 end component;
 
 component PWM
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           idata : in STD_LOGIC_VECTOR(10 downto 0);
           odata : out STD_LOGIC;
           audio : out STD_LOGIC);
end component;

begin

i_cpt_timebase : cpt_timebase
Port map(clock=>clk,reset=>rst,ce=>ce);

i_cpt_address : cpt_address
Port map(clock=>clk,CE=>ce,reset=>rst,DATA_IN=>ADDRESS_IN,address=>ADDRESS_OUT);

i_ram : ram
Port map(CLOCK=>clk,ADDR_R=>ADDRESS_OUT,ADDR_W=>ADDRESS_IN,READ_WRITE=>READ_WRITE,DATA_IN=>DATA_IN,DATA_OUT=>DATA_OUT);

i_PWM : PWM
Port map(clock=>clk,reset=>rst,ce=>ce,idata=>DATA_OUT,odata=>odata,audio=>audio);

end Behavioral;
