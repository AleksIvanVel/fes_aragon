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

-- DATE "04/24/2024 13:38:58"

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

ENTITY 	practica_5 IS
    PORT (
	CLOCK : IN std_logic;
	J : IN std_logic;
	K : IN std_logic;
	Q : OUT std_logic;
	QN : OUT std_logic
	);
END practica_5;

-- Design Ports Information
-- Q	=>  Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- QN	=>  Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- K	=>  Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- J	=>  Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF practica_5 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK : std_logic;
SIGNAL ww_J : std_logic;
SIGNAL ww_K : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL ww_QN : std_logic;
SIGNAL \CLOCK~combout\ : std_logic;
SIGNAL \J~combout\ : std_logic;
SIGNAL \Q~reg0_regout\ : std_logic;
SIGNAL \QN~reg0_regout\ : std_logic;

BEGIN

ww_CLOCK <= CLOCK;
ww_J <= J;
ww_K <= K;
Q <= ww_Q;
QN <= ww_QN;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLOCK~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CLOCK,
	combout => \CLOCK~combout\);

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\J~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_J,
	combout => \J~combout\);

-- Location: LC_X3_Y1_N6
\Q~reg0\ : maxii_lcell
-- Equation(s):
-- \Q~reg0_regout\ = DFFEAS((((!\J~combout\))), GLOBAL(\CLOCK~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~combout\,
	datad => \J~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q~reg0_regout\);

-- Location: LC_X3_Y1_N2
\QN~reg0\ : maxii_lcell
-- Equation(s):
-- \QN~reg0_regout\ = DFFEAS((((\J~combout\))), GLOBAL(\CLOCK~combout\), VCC, , , , , , )

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
	clk => \CLOCK~combout\,
	datad => \J~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \QN~reg0_regout\);

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Q~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Q~reg0_regout\,
	oe => VCC,
	padio => ww_Q);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\QN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \QN~reg0_regout\,
	oe => VCC,
	padio => ww_QN);

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\K~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_K);
END structure;


