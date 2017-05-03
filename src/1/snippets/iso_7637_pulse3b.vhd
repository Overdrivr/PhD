-- ----------------------------------------------------------------------------
-- Copyright (C) 2004-2011 VDA/FAT
--
-- This model is a component of the open source library created by the VDA/FAT
-- working group number 30 and is covered by this license agreement. This model
-- including any updates, modifications, revisions, copies, and documentation
-- are copyrighted works of the VDA/FAT. Use of this model indicates your
-- complete and unconditional acceptance of the terms and conditions set forth
-- in this license agreement.
--
-- The VDA/FAT grants a non-exclusive license to use, reproduce, modify and
-- distribute this model under the condition, that:
-- (a) no fee or other consideration is charged for any distribution except
--     compilations distributed in accordance with Section (d) of this license
--     agreement;
-- (b) the comment text embedded in this model is included verbatim in each
--     copy of this model made or distributed by you, whether or not such
--     version is modified;
-- (c) any modified version must include a conspicuous notice that this model
--     has been modified and the date of modification; and
-- (d) any compilations sold by you that include this model must include a
--     conspicuous notice that this model is available from the VDA/FAT in
--     its original form at no charge.
--
-- THIS MODEL IS LICENSED TO YOU "AS IT IS" AND WITH NO WARRANTIES, EXPRESSED
-- OR IMPLIED. THE VDA/FAT AND ALL COMPANIES CONTRIBUTING TO THIS LIBRARY
-- SPECIFICALLY DISCLAIM ALL IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS
-- FOR A PARTICULAR PURPOSE. THE VDA/FAT AND ALL COMPANIES ORGANIZED WITHIN
-- MUST NOT HAVE ANY RESPONSIBILITY FOR ANY DAMAGES, FINANCIAL OR LEGAL CLAIMS
-- WHATEVER.
-- ----------------------------------------------------------------------------
-- Literature:
-- DIN ISO 7637-2 (Entwurf)
-- Elektrische Størungen durch Leitungen und Kopplung.
-- Dezember 2002
--
--
-- Dependencies:
-- --------------------------------------------------------------------
-- Logical Library         Design unit
-- --------------------------------------------------------------------
-- IEEE                    MATH_REAL
-- IEEE                    STD_LOGIC_1164
-- IEEE                    ELECTRICAL_SYSTEMS
--
-- Author(s):
-- Johannes Kuhnert
--
-- Validator:
--
--
--
-- Source:
-- iso_7637_pulse3b.vhd
--
--
-- Development simulator:
-- SystemVision 3.2 July 2004
--
-- Tested on:
-- ---------------------------------------------------------------------
-- Version    Simulator    Version   OS     Validator         Date
-- ---------------------------------------------------------------------
-- 1.1        SystemVision 3.2       WinXP  Johannes Kuhnert  21.09.2004
-- 1.1	      SystemVision  4.1      W2000  Ewald Hessel      18.01.2004
-- 1.1        Simplorer     7.0      W2000  Ewald Hessel      18.01.2004
--
-- Modification History:
-- ------------------------------------------------------------------
-- Version   Author              Date            Description
-- ------------------------------------------------------------------
-- 1.1       Johannes Kuhnert    15.09.04        Original version
--
--
--
--
-- ----------------------------------------------------------------------------
-- $Version: 3.0.0 $
-- $Revision: 2627 $
-- $Date: 2010-12-20 19:11:06 +0100 (Mon, 20 Dec 2010) $
-- $Author: andre $
-- ----------------------------------------------------------------------------


--/**
--
-- EMC Test Pulse 3B (ISO 7637-2).
-- EMC test pulse from EL_1 to EL_2 and resistance RI=50 Ohm are in series. The test pulse is activated if S_IN is '1' or 'H'. It can be used to test electrical disturbances by conduction and coupling  (Pruefimpuls 3a, DIN ISO 7637-2, 4.6.3, p. 19) connected in series with the voltage supply.
--
-- @generic   UA	 power net voltage (12.0 or 24.0)  [V]
-- @generic   US	 peak voltage  [V]
-- @generic   TR	 pulse rise time [s]
-- @generic   INIT_DELAY	 init delay  [s]
--
-- @port      S_IN	 control signal (activation with '1' or 'H')
-- @port      EL_1	 electrical plus terminal
-- @port      EL_2	 electrical minus terminal
--
-- @library   AUTOMOTIVE_VDA
-- @structure electrical_system/sources/iso_7637_2_sources
-- @test      iso_7637_2_sources_test
-- @reference DIN ISO 7637-2 (Entwurf)
-- <p>Elektrische Stoerungen durch Leitungen und Kopplung.</p>
-- <p>Dezember 2002</p>
--
--*/







library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.ELECTRICAL_SYSTEMS.all;
use IEEE.MATH_REAL.all;

entity ISO_7637_PULSE3B is
  generic (   UA          : REAL := 12.0;
              US          : REAL := 25.0;
              TR          : REAL := 5.0E-9;
              INIT_DELAY  : REAL := 0.1E-3   -- init delay [s], MIN: >0.0
             );
  port (
    signal   S_IN : in STD_LOGIC := '1';
    terminal EL_1 : ELECTRICAL;
    terminal EL_2 : ELECTRICAL            -- electrical minus terminal
    );

  constant  RI            : REAL := 50.0;
  constant  TD            : REAL := 0.1E-6;
  constant  T1            : REAL := 100.0E-6;
  constant  T4            : REAL := 10.0E-3;
  constant  T5            : REAL := 90.0E-3;

begin
  assert UA = 12.0 or UA = 24.0
    report "UA must be 12.0 or 24.0."
    severity ERROR;

  assert (UA = 12.0 and US >= 25.0 and US <= 100.0)
         or (UA = 24.0 and US >= 50.0 and US <= 200.0)
    report "US not in accordance with UA."
    severity ERROR;

  assert TR >= 5.0E-9*(1.0-0.3) and TR <= 5.0E-9*(1.0+0.3)
    report "TR = 5.0E-9 +/- 30% required."
    severity ERROR;

  assert INIT_DELAY > 0.0
    report "INIT_DELAY > 0.0 required."
    severity ERROR;

end entity ISO_7637_PULSE3B;

architecture IDEAL of ISO_7637_PULSE3B is
  constant UA0 : REAL := 0.0;
  constant D2 : REAL := LOG(10.0)/(TD-TR);
  type   STATE_TYP is (S0, S1, S2, S3);
  signal STATE  : STATE_TYP := S0;
  signal TSTART : REAL      := 0.0;
  signal ACTIVE : BOOLEAN   := FALSE;
  signal ACTIVE_CTRL : BOOLEAN;
  quantity VSW across ISW through EL_1 to EL_2;
  quantity V   across I   through EL_1 to EL_2;

begin
  process is
  begin
      STATE  <= S0;
      TSTART <= NOW;
      wait for INIT_DELAY;
      loop
        for I in 0 to INTEGER(T4/T1) loop
          STATE  <= S1;
          TSTART <= NOW;
          wait for TR/0.8;
          STATE  <= S2;
        TSTART <= NOW;
          wait for T1-TR/0.8;
      end loop;
      STATE  <= S3;
      TSTART <= NOW;
      wait for T5;
      end loop;
  end process;

  if ACTIVE use
     case STATE use
       when S0 => V == UA0+RI*I;
       when S1 => V == US*REALMAX(0.8/TR*(NOW-TSTART),1.0)+UA0+RI*I;
       when S2 => V == US*EXP(-D2*(NOW-TSTART))+UA0+RI*I;
       when S3 => V == UA0+RI*I;
       when others => V == UA0+RI*I;
     end case;
  else
     I == 0.0;
  end use;

  process (S_IN, STATE) is
  begin
     if (S_IN = '1' or S_IN = 'H')
         and (STATE = S0 or STATE = S3)
         and ACTIVE = FALSE then
         ACTIVE <= TRUE;
     end if;
     if not (S_IN = '1' or S_IN = 'H')
         and (STATE = S0 or STATE = S3)
         and ACTIVE = TRUE then
         ACTIVE <= FALSE;
     end if;
  end process;

  ACTIVE_CTRL <= not ACTIVE_CTRL when ACTIVE and STATE'event;

  if ACTIVE use
     ISW == 0.0;
  else
     VSW == 0.0;
  end use;

  break on ACTIVE, ACTIVE_CTRL;
end architecture IDEAL;


-- ----------------------------------------------------------------------------
-- Copyright (C) 2004-2011 VDA/FAT
-- ----------------------------------------------------------------------------
