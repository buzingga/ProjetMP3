LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY merger_8b_to_16b IS
    GENERIC(
        BITS : INTEGER := 18
    );
    PORT (
      RESET      : IN  STD_LOGIC;
      CLOCK      : IN  STD_LOGIC;
      ENABLE     : IN  STD_LOGIC;
      DATA_IN    : IN  STD_LOGIC_VECTOR ( 7 DOWNTO 0);
      
      DATA_OUT   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      DATA_READY : OUT STD_LOGIC
      );
END merger_8b_to_16b;

ARCHITECTURE Behavioral OF merger_8b_to_16b IS
    SIGNAL MERGED_DATA       : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL HALF_PACKET_READY : STD_LOGIC := '0';
    SIGNAL PACKET_READY      : STD_LOGIC := '0';
BEGIN

    PROCESS (RESET, CLOCK)
    BEGIN
        IF RESET = '1' THEN
            MERGED_DATA       <= (OTHERS => '0');
            HALF_PACKET_READY <=  '0';
        ELSIF (CLOCK'event AND CLOCK = '1') THEN
             IF ENABLE = '1' THEN
                 MERGED_DATA       <= DATA_IN & MERGED_DATA(15 DOWNTO 8);
                 HALF_PACKET_READY <= NOT HALF_PACKET_READY;
             ELSE
                 MERGED_DATA       <= MERGED_DATA;
                 HALF_PACKET_READY <= HALF_PACKET_READY;
             END IF;
         END IF;
     END PROCESS;

    PROCESS (RESET, CLOCK)
    BEGIN
        IF RESET = '1' THEN
            PACKET_READY      <=  '0';
        ELSIF (CLOCK'event AND CLOCK = '1') THEN
            PACKET_READY <= HALF_PACKET_READY AND ENABLE;
        END IF;
    END PROCESS;
    
    DATA_OUT   <= MERGED_DATA;
    DATA_READY <= PACKET_READY;

END Behavioral;