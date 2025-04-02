library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_controller is
    Port (
        clk        : in  STD_LOGIC;       -- 25MHz clock
        hsync      : out STD_LOGIC;
        vsync      : out STD_LOGIC;
        red, green, blue : out STD_LOGIC
    );
end vga_controller;

architecture Behavioral of vga_controller is

    -- Constants
    constant H_VISIBLE : integer := 640;
    constant H_FRONT   : integer := 16;
    constant H_SYNC    : integer := 96;
    constant H_BACK    : integer := 48;
    constant H_TOTAL   : integer := H_VISIBLE + H_FRONT + H_SYNC + H_BACK;

    constant V_VISIBLE : integer := 480;
    constant V_FRONT   : integer := 10;
    constant V_SYNC    : integer := 2;
    constant V_BACK    : integer := 33;
    constant V_TOTAL   : integer := V_VISIBLE + V_FRONT + V_SYNC + V_BACK;

    -- Counters
    signal h_count : integer range 0 to H_TOTAL - 1 := 0;
    signal v_count : integer range 0 to V_TOTAL - 1 := 0;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Horizontal counter
            if h_count = H_TOTAL - 1 then
                h_count <= 0;

                -- Vertical counter
                if v_count = V_TOTAL - 1 then
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;
        end if;
    end process;

    -- Generate hsync and vsync
    hsync <= '0' when (h_count >= H_VISIBLE + H_FRONT and h_count < H_VISIBLE + H_FRONT + H_SYNC) else '1';
    vsync <= '0' when (v_count >= V_VISIBLE + V_FRONT and v_count < V_VISIBLE + V_FRONT + V_SYNC) else '1';

    -- Display region (visible area)
    red   <= '1' when (h_count < H_VISIBLE and v_count < V_VISIBLE) else '0';
    green <= '0';
    blue  <= '1';

end Behavioral;
