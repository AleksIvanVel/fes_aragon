-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/30/2024 23:16:03"

-- 
-- Device: Altera EPM240T100C5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	divisor_frecuencia IS
    PORT (
	reloj : IN std_logic;
	reset : IN std_logic;
	led : OUT std_logic;
	led2 : OUT std_logic
	);
END divisor_frecuencia;

-- Design Ports Information
-- led	=>  Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- led2	=>  Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- reloj	=>  Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF divisor_frecuencia IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reloj : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_led : std_logic;
SIGNAL ww_led2 : std_logic;
SIGNAL \reloj~combout\ : std_logic;
SIGNAL \Add0~120_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~122COUT1_148\ : std_logic;
SIGNAL \Add0~117\ : std_logic;
SIGNAL \Add0~117COUT1_150\ : std_logic;
SIGNAL \Add0~110_combout\ : std_logic;
SIGNAL \Add0~112\ : std_logic;
SIGNAL \Add0~112COUT1_152\ : std_logic;
SIGNAL \Add0~105_combout\ : std_logic;
SIGNAL \Add0~107\ : std_logic;
SIGNAL \Add0~107COUT1_154\ : std_logic;
SIGNAL \Add0~95_combout\ : std_logic;
SIGNAL \Add0~97\ : std_logic;
SIGNAL \Add0~90_combout\ : std_logic;
SIGNAL \Add0~92\ : std_logic;
SIGNAL \Add0~92COUT1_156\ : std_logic;
SIGNAL \Add0~85_combout\ : std_logic;
SIGNAL \Add0~87\ : std_logic;
SIGNAL \Add0~87COUT1_158\ : std_logic;
SIGNAL \Add0~80_combout\ : std_logic;
SIGNAL \Equal0~5\ : std_logic;
SIGNAL \Add0~65_combout\ : std_logic;
SIGNAL \Add0~67\ : std_logic;
SIGNAL \Add0~67COUT1_164\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~82COUT1_160\ : std_logic;
SIGNAL \Add0~75_combout\ : std_logic;
SIGNAL \Add0~77\ : std_logic;
SIGNAL \Add0~77COUT1_162\ : std_logic;
SIGNAL \Add0~70_combout\ : std_logic;
SIGNAL \Add0~72\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~62COUT1_166\ : std_logic;
SIGNAL \Add0~45_combout\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~47COUT1_168\ : std_logic;
SIGNAL \Add0~55_combout\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~57COUT1_170\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \Add0~52\ : std_logic;
SIGNAL \Add0~52COUT1_172\ : std_logic;
SIGNAL \Add0~35_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~37COUT1_174\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~32\ : std_logic;
SIGNAL \Add0~32COUT1_176\ : std_logic;
SIGNAL \Add0~25_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~27COUT1_178\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~12COUT1_180\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~17COUT1_182\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~2COUT1_146\ : std_logic;
SIGNAL \Add0~100_combout\ : std_logic;
SIGNAL \Equal0~0\ : std_logic;
SIGNAL \Equal0~3\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~115_combout\ : std_logic;
SIGNAL \Equal0~6\ : std_logic;
SIGNAL \Equal0~7\ : std_logic;
SIGNAL \temporal~regout\ : std_logic;
SIGNAL contador : std_logic_vector(24 DOWNTO 0);

BEGIN

ww_reloj <= reloj;
ww_reset <= reset;
led <= ww_led;
led2 <= ww_led2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reloj~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reloj,
	combout => \reloj~combout\);

-- Location: LC_X3_Y4_N5
\Add0~120\ : maxii_lcell
-- Equation(s):
-- \Add0~120_combout\ = contador(2) $ ((((!\Add0~102\))))
-- \Add0~122\ = CARRY((contador(2) & ((!\Add0~102\))))
-- \Add0~122COUT1_148\ = CARRY((contador(2) & ((!\Add0~102\))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(2),
	cin => \Add0~102\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~120_combout\,
	cout0 => \Add0~122\,
	cout1 => \Add0~122COUT1_148\);

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LC_X2_Y4_N8
\contador[2]\ : maxii_lcell
-- Equation(s):
-- contador(2) = DFFEAS((((\Add0~120_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datad => \Add0~120_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(2));

-- Location: LC_X3_Y4_N6
\Add0~115\ : maxii_lcell
-- Equation(s):
-- \Add0~115_combout\ = contador(3) $ (((((!\Add0~102\ & \Add0~122\) # (\Add0~102\ & \Add0~122COUT1_148\)))))
-- \Add0~117\ = CARRY(((!\Add0~122\)) # (!contador(3)))
-- \Add0~117COUT1_150\ = CARRY(((!\Add0~122COUT1_148\)) # (!contador(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(3),
	cin => \Add0~102\,
	cin0 => \Add0~122\,
	cin1 => \Add0~122COUT1_148\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~115_combout\,
	cout0 => \Add0~117\,
	cout1 => \Add0~117COUT1_150\);

-- Location: LC_X3_Y4_N7
\Add0~110\ : maxii_lcell
-- Equation(s):
-- \Add0~110_combout\ = (contador(4) $ ((!(!\Add0~102\ & \Add0~117\) # (\Add0~102\ & \Add0~117COUT1_150\))))
-- \Add0~112\ = CARRY(((contador(4) & !\Add0~117\)))
-- \Add0~112COUT1_152\ = CARRY(((contador(4) & !\Add0~117COUT1_150\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(4),
	cin => \Add0~102\,
	cin0 => \Add0~117\,
	cin1 => \Add0~117COUT1_150\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~110_combout\,
	cout0 => \Add0~112\,
	cout1 => \Add0~112COUT1_152\);

-- Location: LC_X2_Y4_N9
\contador[4]\ : maxii_lcell
-- Equation(s):
-- contador(4) = DFFEAS((((\Add0~110_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datad => \Add0~110_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(4));

-- Location: LC_X3_Y4_N8
\Add0~105\ : maxii_lcell
-- Equation(s):
-- \Add0~105_combout\ = (contador(5) $ (((!\Add0~102\ & \Add0~112\) # (\Add0~102\ & \Add0~112COUT1_152\))))
-- \Add0~107\ = CARRY(((!\Add0~112\) # (!contador(5))))
-- \Add0~107COUT1_154\ = CARRY(((!\Add0~112COUT1_152\) # (!contador(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(5),
	cin => \Add0~102\,
	cin0 => \Add0~112\,
	cin1 => \Add0~112COUT1_152\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~105_combout\,
	cout0 => \Add0~107\,
	cout1 => \Add0~107COUT1_154\);

-- Location: LC_X2_Y4_N1
\contador[5]\ : maxii_lcell
-- Equation(s):
-- \Equal0~6\ = (contador(3) & (contador(4) & (contador[5] & contador(2))))
-- contador(5) = DFFEAS(\Equal0~6\, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~105_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador(3),
	datab => contador(4),
	datac => \Add0~105_combout\,
	datad => contador(2),
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~6\,
	regout => contador(5));

-- Location: LC_X3_Y4_N9
\Add0~95\ : maxii_lcell
-- Equation(s):
-- \Add0~95_combout\ = (contador(6) $ ((!(!\Add0~102\ & \Add0~107\) # (\Add0~102\ & \Add0~107COUT1_154\))))
-- \Add0~97\ = CARRY(((contador(6) & !\Add0~107COUT1_154\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(6),
	cin => \Add0~102\,
	cin0 => \Add0~107\,
	cin1 => \Add0~107COUT1_154\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~95_combout\,
	cout => \Add0~97\);

-- Location: LC_X2_Y4_N7
\contador[6]\ : maxii_lcell
-- Equation(s):
-- contador(6) = DFFEAS((((\Add0~95_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~95_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(6));

-- Location: LC_X4_Y4_N0
\Add0~90\ : maxii_lcell
-- Equation(s):
-- \Add0~90_combout\ = contador(7) $ ((((\Add0~97\))))
-- \Add0~92\ = CARRY(((!\Add0~97\)) # (!contador(7)))
-- \Add0~92COUT1_156\ = CARRY(((!\Add0~97\)) # (!contador(7)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(7),
	cin => \Add0~97\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~90_combout\,
	cout0 => \Add0~92\,
	cout1 => \Add0~92COUT1_156\);

-- Location: LC_X3_Y4_N1
\contador[7]\ : maxii_lcell
-- Equation(s):
-- contador(7) = DFFEAS(GND, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~90_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~90_combout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(7));

-- Location: LC_X4_Y4_N1
\Add0~85\ : maxii_lcell
-- Equation(s):
-- \Add0~85_combout\ = (contador(8) $ ((!(!\Add0~97\ & \Add0~92\) # (\Add0~97\ & \Add0~92COUT1_156\))))
-- \Add0~87\ = CARRY(((contador(8) & !\Add0~92\)))
-- \Add0~87COUT1_158\ = CARRY(((contador(8) & !\Add0~92COUT1_156\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(8),
	cin => \Add0~97\,
	cin0 => \Add0~92\,
	cin1 => \Add0~92COUT1_156\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~85_combout\,
	cout0 => \Add0~87\,
	cout1 => \Add0~87COUT1_158\);

-- Location: LC_X3_Y4_N2
\contador[8]\ : maxii_lcell
-- Equation(s):
-- contador(8) = DFFEAS((((\Add0~85_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datad => \Add0~85_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(8));

-- Location: LC_X3_Y4_N0
\contador[9]\ : maxii_lcell
-- Equation(s):
-- \Equal0~5\ = (!contador(8) & (!contador(6) & (!contador[9] & !contador(7))))
-- contador(9) = DFFEAS(\Equal0~5\, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~80_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador(8),
	datab => contador(6),
	datac => \Add0~80_combout\,
	datad => contador(7),
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~5\,
	regout => contador(9));

-- Location: LC_X4_Y4_N2
\Add0~80\ : maxii_lcell
-- Equation(s):
-- \Add0~80_combout\ = contador(9) $ (((((!\Add0~97\ & \Add0~87\) # (\Add0~97\ & \Add0~87COUT1_158\)))))
-- \Add0~82\ = CARRY(((!\Add0~87\)) # (!contador(9)))
-- \Add0~82COUT1_160\ = CARRY(((!\Add0~87COUT1_158\)) # (!contador(9)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(9),
	cin => \Add0~97\,
	cin0 => \Add0~87\,
	cin1 => \Add0~87COUT1_158\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~80_combout\,
	cout0 => \Add0~82\,
	cout1 => \Add0~82COUT1_160\);

-- Location: LC_X4_Y4_N5
\Add0~65\ : maxii_lcell
-- Equation(s):
-- \Add0~65_combout\ = (contador(12) $ ((!\Add0~72\)))
-- \Add0~67\ = CARRY(((contador(12) & !\Add0~72\)))
-- \Add0~67COUT1_164\ = CARRY(((contador(12) & !\Add0~72\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(12),
	cin => \Add0~72\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~65_combout\,
	cout0 => \Add0~67\,
	cout1 => \Add0~67COUT1_164\);

-- Location: LC_X7_Y4_N0
\contador[12]\ : maxii_lcell
-- Equation(s):
-- contador(12) = DFFEAS((((\Add0~65_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~65_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(12));

-- Location: LC_X4_Y4_N6
\Add0~60\ : maxii_lcell
-- Equation(s):
-- \Add0~60_combout\ = contador(13) $ (((((!\Add0~72\ & \Add0~67\) # (\Add0~72\ & \Add0~67COUT1_164\)))))
-- \Add0~62\ = CARRY(((!\Add0~67\)) # (!contador(13)))
-- \Add0~62COUT1_166\ = CARRY(((!\Add0~67COUT1_164\)) # (!contador(13)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(13),
	cin => \Add0~72\,
	cin0 => \Add0~67\,
	cin1 => \Add0~67COUT1_164\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~60_combout\,
	cout0 => \Add0~62\,
	cout1 => \Add0~62COUT1_166\);

-- Location: LC_X7_Y4_N3
\contador[13]\ : maxii_lcell
-- Equation(s):
-- contador(13) = DFFEAS((((\Add0~60_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~60_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(13));

-- Location: LC_X4_Y4_N3
\Add0~75\ : maxii_lcell
-- Equation(s):
-- \Add0~75_combout\ = (contador(10) $ ((!(!\Add0~97\ & \Add0~82\) # (\Add0~97\ & \Add0~82COUT1_160\))))
-- \Add0~77\ = CARRY(((contador(10) & !\Add0~82\)))
-- \Add0~77COUT1_162\ = CARRY(((contador(10) & !\Add0~82COUT1_160\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(10),
	cin => \Add0~97\,
	cin0 => \Add0~82\,
	cin1 => \Add0~82COUT1_160\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~75_combout\,
	cout0 => \Add0~77\,
	cout1 => \Add0~77COUT1_162\);

-- Location: LC_X7_Y4_N9
\contador[10]\ : maxii_lcell
-- Equation(s):
-- \Equal0~3\ = (contador(13) & (contador(12) & (!contador[10] & contador(11))))
-- contador(10) = DFFEAS(\Equal0~3\, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~75_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0800",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador(13),
	datab => contador(12),
	datac => \Add0~75_combout\,
	datad => contador(11),
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~3\,
	regout => contador(10));

-- Location: LC_X4_Y4_N4
\Add0~70\ : maxii_lcell
-- Equation(s):
-- \Add0~70_combout\ = (contador(11) $ (((!\Add0~97\ & \Add0~77\) # (\Add0~97\ & \Add0~77COUT1_162\))))
-- \Add0~72\ = CARRY(((!\Add0~77COUT1_162\) # (!contador(11))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(11),
	cin => \Add0~97\,
	cin0 => \Add0~77\,
	cin1 => \Add0~77COUT1_162\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~70_combout\,
	cout => \Add0~72\);

-- Location: LC_X7_Y4_N8
\contador[11]\ : maxii_lcell
-- Equation(s):
-- contador(11) = DFFEAS((((\Add0~70_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~70_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(11));

-- Location: LC_X4_Y4_N7
\Add0~45\ : maxii_lcell
-- Equation(s):
-- \Add0~45_combout\ = (contador(14) $ ((!(!\Add0~72\ & \Add0~62\) # (\Add0~72\ & \Add0~62COUT1_166\))))
-- \Add0~47\ = CARRY(((contador(14) & !\Add0~62\)))
-- \Add0~47COUT1_168\ = CARRY(((contador(14) & !\Add0~62COUT1_166\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(14),
	cin => \Add0~72\,
	cin0 => \Add0~62\,
	cin1 => \Add0~62COUT1_166\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~45_combout\,
	cout0 => \Add0~47\,
	cout1 => \Add0~47COUT1_168\);

-- Location: LC_X7_Y4_N6
\contador[14]\ : maxii_lcell
-- Equation(s):
-- contador(14) = DFFEAS((((\Add0~45_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~45_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(14));

-- Location: LC_X4_Y4_N8
\Add0~55\ : maxii_lcell
-- Equation(s):
-- \Add0~55_combout\ = (contador(15) $ (((!\Add0~72\ & \Add0~47\) # (\Add0~72\ & \Add0~47COUT1_168\))))
-- \Add0~57\ = CARRY(((!\Add0~47\) # (!contador(15))))
-- \Add0~57COUT1_170\ = CARRY(((!\Add0~47COUT1_168\) # (!contador(15))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(15),
	cin => \Add0~72\,
	cin0 => \Add0~47\,
	cin1 => \Add0~47COUT1_168\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~55_combout\,
	cout0 => \Add0~57\,
	cout1 => \Add0~57COUT1_170\);

-- Location: LC_X7_Y4_N7
\contador[15]\ : maxii_lcell
-- Equation(s):
-- contador(15) = DFFEAS((((\Add0~55_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datad => \Add0~55_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(15));

-- Location: LC_X4_Y4_N9
\Add0~40\ : maxii_lcell
-- Equation(s):
-- \Add0~40_combout\ = (contador(16) $ ((!(!\Add0~72\ & \Add0~57\) # (\Add0~72\ & \Add0~57COUT1_170\))))
-- \Add0~42\ = CARRY(((contador(16) & !\Add0~57COUT1_170\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(16),
	cin => \Add0~72\,
	cin0 => \Add0~57\,
	cin1 => \Add0~57COUT1_170\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~40_combout\,
	cout => \Add0~42\);

-- Location: LC_X7_Y4_N2
\contador[16]\ : maxii_lcell
-- Equation(s):
-- contador(16) = DFFEAS((((\Add0~40_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~40_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(16));

-- Location: LC_X5_Y4_N0
\Add0~50\ : maxii_lcell
-- Equation(s):
-- \Add0~50_combout\ = contador(17) $ ((((\Add0~42\))))
-- \Add0~52\ = CARRY(((!\Add0~42\)) # (!contador(17)))
-- \Add0~52COUT1_172\ = CARRY(((!\Add0~42\)) # (!contador(17)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(17),
	cin => \Add0~42\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~50_combout\,
	cout0 => \Add0~52\,
	cout1 => \Add0~52COUT1_172\);

-- Location: LC_X6_Y4_N3
\contador[17]\ : maxii_lcell
-- Equation(s):
-- \Equal0~2\ = (contador(14) & (contador(16) & (!contador[17] & !contador(15))))
-- contador(17) = DFFEAS(\Equal0~2\, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~50_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0008",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador(14),
	datab => contador(16),
	datac => \Add0~50_combout\,
	datad => contador(15),
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~2\,
	regout => contador(17));

-- Location: LC_X5_Y4_N1
\Add0~35\ : maxii_lcell
-- Equation(s):
-- \Add0~35_combout\ = contador(18) $ ((((!(!\Add0~42\ & \Add0~52\) # (\Add0~42\ & \Add0~52COUT1_172\)))))
-- \Add0~37\ = CARRY((contador(18) & ((!\Add0~52\))))
-- \Add0~37COUT1_174\ = CARRY((contador(18) & ((!\Add0~52COUT1_172\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(18),
	cin => \Add0~42\,
	cin0 => \Add0~52\,
	cin1 => \Add0~52COUT1_172\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~35_combout\,
	cout0 => \Add0~37\,
	cout1 => \Add0~37COUT1_174\);

-- Location: LC_X5_Y4_N8
\contador[18]\ : maxii_lcell
-- Equation(s):
-- contador(18) = DFFEAS(((!\Equal0~7\ & ((\Add0~35_combout\)))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3300",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datab => \Equal0~7\,
	datad => \Add0~35_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(18));

-- Location: LC_X5_Y4_N2
\Add0~30\ : maxii_lcell
-- Equation(s):
-- \Add0~30_combout\ = (contador(19) $ (((!\Add0~42\ & \Add0~37\) # (\Add0~42\ & \Add0~37COUT1_174\))))
-- \Add0~32\ = CARRY(((!\Add0~37\) # (!contador(19))))
-- \Add0~32COUT1_176\ = CARRY(((!\Add0~37COUT1_174\) # (!contador(19))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(19),
	cin => \Add0~42\,
	cin0 => \Add0~37\,
	cin1 => \Add0~37COUT1_174\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~30_combout\,
	cout0 => \Add0~32\,
	cout1 => \Add0~32COUT1_176\);

-- Location: LC_X6_Y4_N5
\contador[19]\ : maxii_lcell
-- Equation(s):
-- contador(19) = DFFEAS((((!\Equal0~7\ & \Add0~30_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Equal0~7\,
	datad => \Add0~30_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(19));

-- Location: LC_X5_Y4_N3
\Add0~25\ : maxii_lcell
-- Equation(s):
-- \Add0~25_combout\ = (contador(20) $ ((!(!\Add0~42\ & \Add0~32\) # (\Add0~42\ & \Add0~32COUT1_176\))))
-- \Add0~27\ = CARRY(((contador(20) & !\Add0~32\)))
-- \Add0~27COUT1_178\ = CARRY(((contador(20) & !\Add0~32COUT1_176\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(20),
	cin => \Add0~42\,
	cin0 => \Add0~32\,
	cin1 => \Add0~32COUT1_176\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~25_combout\,
	cout0 => \Add0~27\,
	cout1 => \Add0~27COUT1_178\);

-- Location: LC_X6_Y4_N9
\contador[20]\ : maxii_lcell
-- Equation(s):
-- contador(20) = DFFEAS((((!\Equal0~7\ & \Add0~25_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Equal0~7\,
	datad => \Add0~25_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(20));

-- Location: LC_X5_Y4_N4
\Add0~20\ : maxii_lcell
-- Equation(s):
-- \Add0~20_combout\ = (contador(21) $ (((!\Add0~42\ & \Add0~27\) # (\Add0~42\ & \Add0~27COUT1_178\))))
-- \Add0~22\ = CARRY(((!\Add0~27COUT1_178\) # (!contador(21))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(21),
	cin => \Add0~42\,
	cin0 => \Add0~27\,
	cin1 => \Add0~27COUT1_178\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~20_combout\,
	cout => \Add0~22\);

-- Location: LC_X5_Y4_N9
\contador[21]\ : maxii_lcell
-- Equation(s):
-- contador(21) = DFFEAS((((\Add0~20_combout\ & !\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~20_combout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(21));

-- Location: LC_X5_Y4_N5
\Add0~10\ : maxii_lcell
-- Equation(s):
-- \Add0~10_combout\ = (contador(22) $ ((!\Add0~22\)))
-- \Add0~12\ = CARRY(((contador(22) & !\Add0~22\)))
-- \Add0~12COUT1_180\ = CARRY(((contador(22) & !\Add0~22\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(22),
	cin => \Add0~22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~10_combout\,
	cout0 => \Add0~12\,
	cout1 => \Add0~12COUT1_180\);

-- Location: LC_X6_Y4_N8
\contador[22]\ : maxii_lcell
-- Equation(s):
-- contador(22) = DFFEAS((((!\Equal0~7\ & \Add0~10_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Equal0~7\,
	datad => \Add0~10_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(22));

-- Location: LC_X5_Y4_N6
\Add0~15\ : maxii_lcell
-- Equation(s):
-- \Add0~15_combout\ = contador(23) $ (((((!\Add0~22\ & \Add0~12\) # (\Add0~22\ & \Add0~12COUT1_180\)))))
-- \Add0~17\ = CARRY(((!\Add0~12\)) # (!contador(23)))
-- \Add0~17COUT1_182\ = CARRY(((!\Add0~12COUT1_180\)) # (!contador(23)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(23),
	cin => \Add0~22\,
	cin0 => \Add0~12\,
	cin1 => \Add0~12COUT1_180\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~15_combout\,
	cout0 => \Add0~17\,
	cout1 => \Add0~17COUT1_182\);

-- Location: LC_X6_Y4_N0
\contador[23]\ : maxii_lcell
-- Equation(s):
-- contador(23) = DFFEAS(GND, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~15_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~15_combout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(23));

-- Location: LC_X3_Y4_N3
\Add0~0\ : maxii_lcell
-- Equation(s):
-- \Add0~0_combout\ = ((!contador(0)))
-- \Add0~2\ = CARRY(((contador(0))))
-- \Add0~2COUT1_146\ = CARRY(((contador(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~0_combout\,
	cout0 => \Add0~2\,
	cout1 => \Add0~2COUT1_146\);

-- Location: LC_X5_Y4_N7
\Add0~5\ : maxii_lcell
-- Equation(s):
-- \Add0~5_combout\ = (((!\Add0~22\ & \Add0~17\) # (\Add0~22\ & \Add0~17COUT1_182\) $ (!contador(24))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => contador(24),
	cin => \Add0~22\,
	cin0 => \Add0~17\,
	cin1 => \Add0~17COUT1_182\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~5_combout\);

-- Location: LC_X6_Y4_N1
\contador[24]\ : maxii_lcell
-- Equation(s):
-- contador(24) = DFFEAS((((!\Equal0~7\ & \Add0~5_combout\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Equal0~7\,
	datad => \Add0~5_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(24));

-- Location: LC_X6_Y4_N6
\contador[0]\ : maxii_lcell
-- Equation(s):
-- \Equal0~0\ = (contador(22) & (!contador(23) & (contador[0] & contador(24))))
-- contador(0) = DFFEAS(\Equal0~0\, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~0_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador(22),
	datab => contador(23),
	datac => \Add0~0_combout\,
	datad => contador(24),
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~0\,
	regout => contador(0));

-- Location: LC_X3_Y4_N4
\Add0~100\ : maxii_lcell
-- Equation(s):
-- \Add0~100_combout\ = (contador(1) $ ((\Add0~2\)))
-- \Add0~102\ = CARRY(((!\Add0~2COUT1_146\) # (!contador(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => contador(1),
	cin0 => \Add0~2\,
	cin1 => \Add0~2COUT1_146\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~100_combout\,
	cout => \Add0~102\);

-- Location: LC_X6_Y4_N7
\Equal0~1\ : maxii_lcell
-- Equation(s):
-- \Equal0~1_combout\ = (contador(19) & (contador(20) & (contador(21) & contador(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador(19),
	datab => contador(20),
	datac => contador(21),
	datad => contador(18),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~1_combout\);

-- Location: LC_X6_Y4_N2
\Equal0~4\ : maxii_lcell
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~0\ & (\Equal0~3\ & (\Equal0~1_combout\ & \Equal0~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0\,
	datab => \Equal0~3\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~4_combout\);

-- Location: LC_X6_Y4_N4
\contador[1]\ : maxii_lcell
-- Equation(s):
-- \Equal0~7\ = (\Equal0~6\ & (\Equal0~5\ & (contador[1] & \Equal0~4_combout\)))
-- contador(1) = DFFEAS(\Equal0~7\, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~100_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \Equal0~6\,
	datab => \Equal0~5\,
	datac => \Add0~100_combout\,
	datad => \Equal0~4_combout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~7\,
	regout => contador(1));

-- Location: LC_X2_Y4_N5
\contador[3]\ : maxii_lcell
-- Equation(s):
-- contador(3) = DFFEAS(GND, GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , \Add0~115_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \Add0~115_combout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador(3));

-- Location: LC_X7_Y4_N5
temporal : maxii_lcell
-- Equation(s):
-- \temporal~regout\ = DFFEAS(((\temporal~regout\ $ (\Equal0~7\))), GLOBAL(\reloj~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \temporal~regout\,
	datad => \Equal0~7\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \temporal~regout\);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \temporal~regout\,
	oe => VCC,
	padio => ww_led);

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led2~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \temporal~regout\,
	oe => VCC,
	padio => ww_led2);
END structure;


