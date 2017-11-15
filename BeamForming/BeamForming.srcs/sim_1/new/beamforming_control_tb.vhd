
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity beamforming_control_tb is
end;

architecture bench of beamforming_control_tb is

  component beamforming_control
  Port ( 
  		clk_in              : in  std_logic;
  		switches_state      : in  std_logic_vector (3 downto 0);
  		transmit_pulse		: out std_logic;
  		pulser_fired		: in  std_logic;
  		tr_change_sw		: out std_logic_vector (7 downto 0);
  		-- tr_control			: out std_logic_vector (2 downto 0);
  		tr_sw_changed_ok 	: in  std_logic;
  		power_init			: out std_logic;
  		power_ok			: in  std_logic
  );
  end component;

  signal clk_in: std_logic;
  signal switches_state: std_logic_vector (3 downto 0);
  signal transmit_pulse: std_logic;
  signal pulser_fired: std_logic;
  signal tr_change_sw: std_logic_vector (7 downto 0);
  -- signal tr_control: std_logic_vector (2 downto 0);
  signal tr_sw_changed_ok: std_logic;
  signal power_init: std_logic;
  signal power_ok: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: beamforming_control port map ( clk_in           => clk_in,
                                      switches_state   => switches_state,
                                      transmit_pulse   => transmit_pulse,
                                      pulser_fired     => pulser_fired,
                                      tr_change_sw     => tr_change_sw,
                                      -- tr_control       => tr_control,
                                      tr_sw_changed_ok => tr_sw_changed_ok,
                                      power_init       => power_init,
                                      power_ok         => power_ok );

  stimulus: process
  begin
	tr_sw_changed_ok <= '0';
	power_ok <= '0';
	switches_state <= "0110";
	pulser_fired <= '0';
	wait for 50ns;
	
	
	
	power_ok <= '1';
    -- Put initialisation code here

	
	-- 1
	pulser_fired <= '0';
	wait for 50ns;
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--2
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--3
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--4
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--5
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--6
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--7
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--8
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	--9
	pulser_fired <= '1';
	wait for 10ns;
	pulser_fired <= '0';
	wait for 50ns;
	
	-- wait for 200ns;
	-- pulser_fired <= '1';
	
	-- wait for 10ns;
	-- pulser_fired <= '0';
	-- pulser_fired <= '1';
	-- wait for 5ns;
	-- pulser_fired <= '0';
	
	-- pulser_fired <= '1';
	-- wait for 50ns;
	-- pulser_fired <= '0';
	-- wait for 50ns;
	
	-- pulser_fired <= '1';
	-- wait for 50ns;
	-- pulser_fired <= '0';
	-- wait for 50ns;
	
	-- pulser_fired <= '1';
	-- wait for 50ns;
	-- pulser_fired <= '0';
	-- wait for 50ns;
	
    -- Put test bench stimulus code here
	wait for 1000000ns; 
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk_in <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;