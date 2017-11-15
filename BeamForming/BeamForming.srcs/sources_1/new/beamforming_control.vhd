----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2017 10:03:59 AM
-- Design Name: 
-- Module Name: beamforming_control - Behavioral
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
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity beamforming_control is
Port ( 
		clk_in              : in  std_logic;                      -- input clock signal    
        
		switches_state      : in  std_logic_vector (3 downto 0) := "0000";  -- signals made for selecting beam angle        
        
		transmit_pulse		: out std_logic := '0';					  -- singal to trigger the pulser to fire
		pulser_fired		: in  std_logic;					  -- feedback signal for beamforming control
		
		tr_change_sw		: out std_logic_vector (7 downto 0) := "00000000"; -- 
		tr_sw_changed_ok 	: in  std_logic;
		
		power_init			: out std_logic := '0';
		power_ok			: in  std_logic
);
end beamforming_control;

architecture Behavioral of beamforming_control is
	signal init_system :  std_logic := '0';
	
begin
	process(clk_in)
		variable beam_delay : integer := 0;
		variable tr_switch_fired : integer := 0;
		variable pulser_fired_high : integer := 0;
		variable power_initialization : integer := 0;
		-- variable switch_increment: integer := 0;
		begin 
			if rising_edge(clk_in) then
				-- Initializing the power supply of the system.
				if init_system = '0' and power_ok = '0' then 
					power_init <= '0';
					init_system <= '1';	
					tr_change_sw <= std_logic_vector(to_unsigned(tr_switch_fired, 8));
				end if;
			
				if power_ok = '1' then
					if power_initialization = 0 then
						power_init <= '1' after 20000ns;
						power_initialization := 1;
					end if;
					
					if power_initialization = 1 then
						-- Checking the state of the switches and calculating the delay.
						case switches_state is
							when "0000" => 
								beam_delay := 0;
							when "0001" =>
								beam_delay := 4;
							when "0010" =>
								beam_delay := 8;		
							when "0011" =>
								beam_delay := 12;
							when "0100" =>
								beam_delay := 16;
							when "0101" =>
								beam_delay := 20;
							when "0110" =>
								beam_delay := 24;
							when "0111" =>
								beam_delay := 30;
							when others =>
								beam_delay := 0;
						end case;
						
						if tr_switch_fired = 7 then
							tr_switch_fired := 0;
						else
							if pulser_fired = '0' then
								transmit_pulse <= '1' after beam_delay * 1ns;
								pulser_fired_high := 0;
							
							elsif pulser_fired = '1' and pulser_fired_high = 0 then 
								tr_switch_fired := tr_switch_fired + 1;
								tr_change_sw <= std_logic_vector(to_unsigned(tr_switch_fired, 8));
								transmit_pulse <= '0';
								pulser_fired_high := 1;
							end if;
						end if;
					end if;
				end if;
			end if;
		
	end process;
	process(transmit_pulse)
		begin
			
			
	end process;
	
end Behavioral;
