----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2025 02:37:16 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
			
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demo_counter is
    Port ( CLOCK   : in  STD_LOGIC;
           RESET   : in  STD_LOGIC;
           CE      : in  STD_LOGIC;
           COUNTER : out STD_LOGIC_VECTOR (9 downto 0));
    end demo_counter;

architecture Behavioral of demo_counter is

  signal count : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
  
begin

    process (CLOCK)
    begin
        if rising_edge(CLOCK) then
            if RESET = '1' then
                count <= (others => '0');
            elsif CE = '1' then
                count <= count + 1;
            end if;
        end if;
    end process;

    COUNTER <= count;

end Behavioral;
