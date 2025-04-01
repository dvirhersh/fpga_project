----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 06:57:39 PM
-- Design Name: 
-- Module Name: nuclear_monitor - Behavioral
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
use IEEE.std_logic_unsigned.ALL;  -- vhdl-linter-disable-line not-declared

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nuclear_monitor is
    Port ( CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           RAD   : in  STD_LOGIC;
           ALARM : out STD_LOGIC);
end nuclear_monitor;

architecture Behavioral of nuclear_monitor is

-- no need more than 500 clocks (CLOCK = 20 nS, need to check that the RAD < 10 uS
signal count : std_logic_vector (8 downto 0) := (others => '0');
  
--constant alarm_time
constant max_rad : integer := 500;


begin

    process (CLOCK)
    begin
        if rising_edge (CLOCK) then
            if (RESET = '1') or (RAD = '0') then  
                count <= (others => '0');
            elsif count < max_rad then  
                count <= count + 1;
            else
                count <= count;
            end if;
        end if;
    end process;

    process (CLOCK)
    begin
        if rising_edge (CLOCK) then
            if RESET = '1' then 
                ALARM <= '0';
            elsif count = max_rad then  
                ALARM <= '1';
            else 
                ALARM <= '0';
            end if;
        end if;
    end process;

end Behavioral;
