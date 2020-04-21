library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram is
    generic(
        BITS : INTEGER := 18
    );
    Port ( CLOCK          : IN  STD_LOGIC;
           --CE             : IN  STD_LOGIC;
           ADDR_R         : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
           ADDR_W         : IN  STD_LOGIC_VECTOR(BITS-1 DOWNTO 0);
           READ_WRITE    : IN STD_LOGIC;
           DATA_IN       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
           DATA_OUT       : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
end ram;

architecture Behavioral of ram is 

CONSTANT MAX_ADDR : INTEGER := 2**BITS - 1;

TYPE ram_type IS ARRAY (0 TO MAX_ADDR) OF SIGNED (10 DOWNTO 0);
  SIGNAL memory : ram_type;

--ATTRIBUTE RAM_STYLE : string;
  --ATTRIBUTE RAM_STYLE of memory: signal is "BLOCK";
  
begin


  ram : PROCESS (CLOCK)
    BEGIN

   IF CLOCK'event AND CLOCK = '1' THEN     -- falling clock edge
        --IF CE = '1' THEN
          IF READ_WRITE = '1' THEN
            memory(to_integer(UNSIGNED(ADDR_W))) <= SIGNED(DATA_IN(10 downto 0));
          ELSE
            DATA_OUT <= STD_LOGIC_VECTOR( memory(to_integer(UNSIGNED(ADDR_R))));
          END IF;
        --END IF;
    END IF;

  END PROCESS ram;

end Behavioral;
