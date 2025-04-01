----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 07:09:29 PM
-- Design Name: 
-- Module Name: nuclear_monitor_tb - Behavioral
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

entity nuclear_monitor_tb is
--  Port ( );
end nuclear_monitor_tb;

architecture Behavioral of nuclear_monitor_tb is

component nuclear_monitor
    port (CLOCK : in  STD_LOGIC;
          RESET : in  STD_LOGIC;
          RAD   : in  STD_LOGIC;
          ALARM : out STD_LOGIC);
end component; 

signal CLOCK : STD_LOGIC :='0';
signal RESET : STD_LOGIC :='0';
signal RAD   : STD_LOGIC :='0';
signal ALARM : STD_LOGIC :='0';

constant clock_period : time := 20 ns;

begin

uut: nuclear_monitor port map (
    CLOCK => CLOCK,
    RESET => RESET,
    RAD => RAD,
    ALARM => ALARM);
    
CLOCK <= not CLOCK after clock_period / 2;
RESET <= '1', '0' after clock_period * 10;

process

begin
    RAD <= '1';
    wait for 40 us;
    RAD <= '0';
    wait for 60 us;
    RAD <= '1';
    wait for 7 us;
    RAD <= '0';
    wait for 93 us;
    RAD <= '1';
    wait for 15 us;
    RAD <= '0';
    wait for 85 us;
    wait;
end process;

end Behavioral;
