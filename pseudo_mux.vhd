-- pseudo_mux - A Finite State Machine that mimics the behavior of mux
-- Copyright (C) 2018  Digital Systems Group - UFMG
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;

entity pseudo_mux is
    port (
        RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
    );
end pseudo_mux;

architecture arch of pseudo_mux is
	type state_type is (s0, s1, s2, s3);
	signal state   : state_type := s0;

begin

-- Logic to advance to the next state
process (CLOCK, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(CLOCK)) then
			case state is
				when s0=>
					if s = '1' then
						state <= s1;
					else
						state <= s0;
					end if;

				when s1=>
					if s = '1' then
						state <= s2;
					else
						state <= s1;
					end if;


				when s2=>
					if s = '1' then
						state <= s3;
					else
						state <= s2;
					end if;


				when s3 =>
					if s = '1' then
						state <= s0;
					else
						state <= s3;
					end if;


			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state, A, B, C, D)
	begin
		case state is
			when s0 =>
				Q <= A;


			when s1 =>
				Q <= B;


			when s2 =>
				Q <= C;


			when s3 =>
				Q <= D;

		end case;
	end process;
end arch;
