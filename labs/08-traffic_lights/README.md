<<<<<<< HEAD
# Lab 8: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME
=======
# Lab 8: Egorov Gleb 238528
>>>>>>> b37de6a3053e07840e0d3294743b4fef475b3b84

### Traffic light controller

1. Listing of VHDL code of the completed process `p_traffic_fsm`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_traffic_fsm:
    -- A sequential process with synchronous reset and
    -- clock_enable entirely controls the s_state signal by
    -- CASE statement.
    --------------------------------------------------------
    p_traffic_fsm : process(clk) is
    begin
        if (rising_edge(clk)) then
<<<<<<< HEAD

            -- WRITE YOR CODE HERE

=======
           if (rst = '1') then                    
            sig_state <= WEST_STOP;              
            sig_cnt   <= (others => '0');        
        elsif (sig_en = '1') then
        case sig_state is

          when WEST_STOP =>
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= WEST_GO;
              sig_cnt   <= (others => '0');
            end if;

          when WEST_GO =>
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= WEST_WAIT;
              sig_cnt   <= (others => '0');
            end if;

            when WEST_WAIT =>
            if (sig_cnt < c_DELAY_1SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= SOUTH_STOP;
              sig_cnt   <= (others => '0');
            end if;

            when SOUTH_STOP =>
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= SOUTH_GO;
              sig_cnt   <= (others => '0');
            end if;

            when SOUTH_GO =>
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= SOUTH_WAIT;
              sig_cnt   <= (others => '0');
            end if;

            when SOUTH_WAIT =>
            if (sig_cnt < c_DELAY_1SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= WEST_STOP;
              sig_cnt   <= (others => '0');
            end if;

          when others =>
            sig_state <= WEST_STOP;
            sig_cnt   <= (others => '0');

        end case;

          end if; -- Synchronous reset
>>>>>>> b37de6a3053e07840e0d3294743b4fef475b3b84
        end if; -- Rising edge
    end process p_traffic_fsm;
```

2. Screenshot with simulated time waveforms. The full functionality of the entity must be verified. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

<<<<<<< HEAD
   ![your figure]()

3. Figure of Moor-based state diagram of the traffic light controller with *speed button* to ensure a synchronous transition to the `WEST_GO` state. The image can be drawn on a computer or by hand. Always name all states, transitions, and input signals!

   ![your figure]()
=======
   ![your figure](https://github.com/GlebEG/digital-electronics-1/blob/main/labs/08-traffic_lights/image.png)
    ![your figure](https://github.com/GlebEG/digital-electronics-1/blob/main/labs/08-traffic_lights/image%20(2).png)

3. Figure of Moor-based state diagram of the traffic light controller with *speed button* to ensure a synchronous transition to the `WEST_GO` state. The image can be drawn on a computer or by hand. Always name all states, transitions, and input signals!

   ![your figure](https://github.com/GlebEG/digital-electronics-1/blob/main/labs/08-traffic_lights/traffic.jpg)
>>>>>>> b37de6a3053e07840e0d3294743b4fef475b3b84
