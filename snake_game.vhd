library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity snakeGame is
 Port ( clk: in std_logic;
        btn_right, btn_left, btn_up,btn_down: in std_logic;
        led: inout std_logic_vector(7 downto 0) );
end snakeGame;

architecture Behavioral of snakeGame is
constant clk_freq : integer := 12e6;
  
  signal clk_counter : integer;
  signal led_counter : unsigned(7 downto 0);
  signal btn_right_last, btn_left_last,btn_down_last,btn_up_last : std_logic := '0';
   signal led_state_most_left : std_logic;
  signal led_state_most_right : std_logic;
begin
 process(clk)
  begin
    if rising_edge(clk) then
      if clk_counter = clk_freq - 1 then
        clk_counter <= 0;
        
        if led="10000000" then led_state_most_left <= '1' ;
          else 
            led_state_most_left <= '0';
        end if;
          if led="00000001" then led_state_most_right <= '1' ;
          else 
            led_state_most_right <= '0';
            
            
         if btn_right = '1' and btn_right_last = '0' then
          led_counter <= led_counter - 1;
           if (btn_right = '1' and btn_right_last = '0' and led_state_most_right = '1' ) then 
           led_counter <= led_counter +3;
           end if;
           end if;
           
           end if;
          if btn_left = '1' and btn_left_last = '0' then
            led_counter <= led_counter + 1;
             if (btn_left = '1' and btn_left_last = '0' and led_state_most_left = '1' ) then 
           led_counter <= led_counter -3;
           end if;
           end if;
           if btn_down = '1' and btn_down_last = '0' then
          led_counter <= led_counter -4;
            end if;
            if ((led = "00000001" or led ="00000010" or led="00000100" or led = "00001000") and btn_down = '1' and btn_down_last = '0' )then
             led_counter <= led_counter +4;
             end if;
           if btn_up = '1' and btn_up_last = '0' then
          led_counter <= led_counter + 4;
          end if;
          if ((led = "10000000" or led ="01000000" or led="00100000" or led = "00010000")and btn_up = '1' and btn_up_last = '0') then
             led_counter <= led_counter - 4;
             end if;
        btn_right_last <= btn_right;
        btn_left_last <= btn_left;
        btn_down_last <= btn_down;
        btn_up_last <= btn_up;
        else 
          clk_counter <= clk_counter + 1;
      end if;
        end if;
      end process;
 process(led_counter)
  begin
    led(7) <= '1';
    led <= (others => '0');
    led(TO_INTEGER(led_counter)) <= '1';
  end process; 
end Behavioral;
