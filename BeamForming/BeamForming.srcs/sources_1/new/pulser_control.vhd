----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2017 10:16:38 AM
-- Design Name: 
-- Module Name: pulser_control - Behavioral
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

entity pulser_control is
Port ( 
	init_pulser_in   :  in  std_logic; 
	pulser_fired_out :	out std_logic;
	pulse_out 		 :  out std_logic_vector(3 downto 0)
	);
end pulser_control;

architecture Behavioral of pulser_control is

begin
	process(init_pulser_in)
		begin 
		
			if init_pulser_in = '1' then
				pulse_out <= "0000";
			else 
				null;
			end if;
			
	end process; 

end Behavioral;
