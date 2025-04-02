library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_controller_tb is
end vga_controller_tb;

architecture Behavioral of vga_controller_tb is

    -- Signals to connect to the DUT (Device Under Test)
    signal clk_tb    : std_logic := '0';
    signal hsync_tb  : std_logic;
    signal vsync_tb  : std_logic;
    signal red_tb    : std_logic;
    signal green_tb  : std_logic;
    signal blue_tb   : std_logic;

    -- Clock period constant (for 25 MHz clock -> 40 ns)
    constant clk_period : time := 40 ns;

begin

    -- Instantiate the DUT
    uut: entity work.vga_controller
        port map (
            clk    => clk_tb,
            hsync  => hsync_tb,
            vsync  => vsync_tb,
            red    => red_tb,
            green  => green_tb,
            blue   => blue_tb
        );

    -- Clock process
    clk_process : process
    begin
        while now < 2 ms loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Monitor VGA signals
    monitor_proc: process
    begin
        wait for 1 us;
        report "Starting VGA testbench";

        -- Wait some time to observe sync pulses
        wait for 1 ms;

        report "Finished simulation";
        wait;
    end process;

end Behavioral;
