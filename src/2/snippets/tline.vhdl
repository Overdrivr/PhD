library IEEE;
use IEEE.ELECTRICAL_SYSTEMS.all;

-- Entity
entity TLINE is
  generic (
    Z0 : REAL;
    TD : REAL := REAL'LOW;
    IC_V1 : REAL := 0.0;
    IC_I1 : REAL := REAL'LOW;
    IC_V2 : REAL := 0.0;
    IC_I2 : REAL := REAL'LOW
  );

  port (
    terminal N1 : ELECTRICAL;
    terminal N2 : ELECTRICAL;
    terminal N3 : ELECTRICAL;
    terminal N4 : ELECTRICAL
  );

begin
  assert TD > 0.0 or TD = REAL'LOW
    report "TD > 0.0 required."
    severity error;
end entity TLINE;

-- Architecture
architecture behavioral of TLINE is
  -- Voltages and currents at each port
  quantity V1 := IC_V1 across I1 through N1 to N2;
  quantity V2 := IC_V2 across I2 through N3 to N4;

  quantity ES, ER : REAL;

  -- Delayed quantities
  quantity V1_DEL, V2_DEL : REAL;
  quantity ER_DEL, ES_DEL : REAL;

begin
  -- DC conditions
  if DOMAIN = QUIESCENT_DOMAIN use
    V1 == V2;
    I1 == -I2;
    ER == Z0*I1 + 2.0*V2 - V1;
    ES == Z0*I2 + 2.0*V1 - V2;

    V1_DEL == V1;
    V2_DEL == V2;
    ER_DEL == ER;
    ES_DEL == ES;
  -- TRAN conditions
  else
    V1 == Z0*I1 + 2.0*V2_DEL - ER_DEL;
    V2 == Z0*I2 + 2.0*V1_DEL - ES_DEL;
    ES == 2.0*V2_DEL - ER_DEL;
    ER == 2.0*V1_DEL - ES_DEL;

    V1_DEL == V1'DELAYED(TD);
    V2_DEL == V2'DELAYED(TD);
    ER_DEL == ER'DELAYED(TD);
    ES_DEL == ES'DELAYED(TD);
  end use;
end architecture behavioral;
