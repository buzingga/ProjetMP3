library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY FSM IS
    PORT ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           B_CENTER : in STD_LOGIC;
           B_DOWN : in STD_LOGIC;
           B_UP : in STD_LOGIC;
           B_LEFT : in STD_LOGIC;
           B_RIGHT : in STD_LOGIC;
           PLAY_PAUSE : out STD_LOGIC;
           RESTART : out STD_LOGIC;
           FORWARD : out STD_LOGIC;
           VOLUME_UP : out STD_LOGIC;
           VOLUME_DOWN : out STD_LOGIC);
END FSM;

architecture milly of FSM is -- state machine to handle state,transition,output

  type fsm_state IS(init, play_fwd, pause, play_bwd, stoop);
  
  signal next_state , current_state: fsm_state;

 begin --mooore
  
   PROCESS(clock,reset) IS
   BEGIN  -- PROCESS
    IF reset = '1' THEN                 -- asynchronous reset (active low)
      current_state <= init;
    ELSIF clock'event AND clock = '1' THEN  -- rising clock edge
        current_state <= next_state;
    END IF;
  END PROCESS;

  PROCESS(current_state, B_CENTER, B_DOWN, B_UP, B_LEFT, B_RIGHT) IS
  BEGIN
    case current_state IS
      when init => IF (B_CENTER = '1') THEN
                        next_state <= play_fwd;
                   END IF;
      when play_fwd => IF (B_CENTER = '1') THEN
                            next_state <= pause;
                       END IF;
      when pause => IF (B_LEFT = '1') THEN
                            next_state <= play_bwd
                    ELSIF (B_RIGHT = '1') THEN
                            next_state <= play_fwd;
                    ELSIF (B_CENTER = '1') THEN
                            next_state <= stoop;
                    END IF;
      when play_bwd => IF (B_CENTER = '1') THEN
                            next_state <= pause;
                       END IF;
      when stoop => IF (B_CENTER = '1') THEN
                        next_state <= play_fwd;
                    END IF;
      when others => NULL;
   end CASE;
 end PROCESS;

 PROCESS (current_state, B_UP, B_DOWN) IS
  BEGIN  -- PROCESS
    
    CASE current_state IS
      WHEN init =>  PLAY_PAUSE <= '0';
                    RESTART <= '1';
                    FORWARD <= '0';
                    VOLUME_UP <= '0';
                    VOLUME_DOWN <= '0';
      WHEN play_fwd =>  PLAY_PAUSE <= '1';
                        RESTART <= '0';
                        FORWARD <= '1';
                        VOLUME_UP <= B_UP;
                        VOLUME_DOWN <= B_DOWN;
      WHEN pause =>  PLAY_PAUSE <= '0';
                     RESTART <= '0';
                     FORWARD <= '0';
                     VOLUME_UP <= '0';
                     VOLUME_DOWN <= '0';
      WHEN play_bwd =>  PLAY_PAUSE <= '1';
                        RESTART <= '0';
                        FORWARD <= '0';
                        VOLUME_UP <= B_UP;
                        VOLUME_DOWN <= B_DOWN;
      WHEN stoop =>  PLAY_PAUSE <= '0';
                     RESTART <= '1';
                     FORWARD <= '0';
                     VOLUME_UP <= '0';
                     VOLUME_DOWN <= '0';
      WHEN OTHERS => NULL;
    END CASE;
 END PROCESS;
end milly;