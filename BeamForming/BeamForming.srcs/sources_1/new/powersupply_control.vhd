----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2017 10:23:35 AM
-- Design Name: 
-- Module Name: powersupply_control - Behavioral
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

entity powersupply_control is
Port ( 
	init_power_in     : in std_logic;
	power_ok		  : out std_logic;
	seventy_volts_out : out std_logic;
	five_volts_in 	  : in std_logic
);
end powersupply_control;

architecture Behavioral of powersupply_control is

begin
	process(five_volts_in)
		begin
			if five_volts_in = '1' and init_power_in = '1' then
				seventy_volts_out <= '1' after 50000ns;
				power_ok <= '1';
			else 
				null;
			end if;
		
	end process;

end Behavioral;
