--Single snapback structure
--BEGES REMI, 13/05/2013
--Based off work from MONNEREAU Nicolas
--LAAS/CNRS

library IEEE;
    use IEEE.electrical_systems.all;
    use IEEE.math_real.all;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;
    use work.all;

entity simple_snapback is
   generic  (
      v_1 : real:=12.0;
      v_2 : real:=13.0;
      v_3 : real:=2.0;
      v_4 : real:=3.0;
      i_1 : real:=0.0;
      i_2 : real:=0.2;
      i_3 : real:=0.2;
      i_4 : real:=1.1);

   port     (
      terminal P,N : ELECTRICAL
      );
end entity simple_snapback;

architecture behav of simple_snapback is
 	quantity Vscr across Iscr through P to N;
    signal flag: integer range 2 downto 0:=0;
    signal previous_state: integer range 2 downto 0:=0;
begin
--digital state machine
process
	variable state: integer range 2 downto 0 := 0;
begin
	flag <= state;
	case state is
		when 0 => wait until Vscr'Above(v_1);
					state:=1;
					previous_state<=0;
		when 1 => wait until ((not Vscr'Above(v_1)) or Vscr'Above(v_2));
					if (Vscr'Above(v_2)) then state:= 2;
					else state:=0;
					end if;
					previous_state<=1;
		when 2 => wait until not Vscr'Above(v_3);
					state:=0;
					previous_state<=2;
		when others => null;
	end case;
end process;

process (flag) is
begin
	case flag is
		when 0 =>	if (previous_state = 1) then break Vscr=>v_1 , Iscr =>i_1;
					else break Vscr=>v_3 , Iscr =>i_3;
					end if;
		when 1 =>	break Vscr => v_1 , Iscr => i_1;
		when 2 =>	break Vscr => v_2 , Iscr => i_2 ;
		when others => null;
	end case;
end process;

-- Analog part
if (flag = 2)    use Iscr == ((i_4 - i_3) / (v_4-v_3)) * Vscr + (i_4 - v_4 * ((i_4 - i_3) / (v_4 - v_3))) ;
elsif (flag = 1) use Iscr == ((i_2 - i_1) / (v_2-v_1)) * Vscr + (i_2 - v_2 * ((i_2 - i_1) / (v_2 - v_1))) ;
else                 Iscr == 0.0;
end use;

--break on flag; --liaison analogique numerique

end architecture behav;
