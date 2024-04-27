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

-- DATE "03/11/2024 09:28:58"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SM_CONTADOR IS
    PORT (
	reset : IN std_logic;
	clock : IN std_logic;
	output1 : OUT std_logic;
	output2 : OUT std_logic;
	output3 : OUT std_logic
	);
END SM_CONTADOR;

-- Design Ports Information
-- output1	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output2	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output3	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SM_CONTADOR IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_output1 : std_logic;
SIGNAL ww_output2 : std_logic;
SIGNAL ww_output3 : std_logic;
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \output1~output_o\ : std_logic;
SIGNAL \output2~output_o\ : std_logic;
SIGNAL \output3~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reg_fstate.state3~0_combout\ : std_logic;
SIGNAL \fstate.state3~q\ : std_logic;
SIGNAL \reg_fstate.state4~0_combout\ : std_logic;
SIGNAL \fstate.state4~q\ : std_logic;
SIGNAL \reg_fstate.state5~0_combout\ : std_logic;
SIGNAL \fstate.state5~q\ : std_logic;
SIGNAL \reg_fstate.state6~0_combout\ : std_logic;
SIGNAL \fstate.state6~q\ : std_logic;
SIGNAL \reg_fstate.state7~0_combout\ : std_logic;
SIGNAL \fstate.state7~q\ : std_logic;
SIGNAL \reg_fstate.state8~0_combout\ : std_logic;
SIGNAL \fstate.state8~q\ : std_logic;
SIGNAL \reg_fstate.state1~0_combout\ : std_logic;
SIGNAL \fstate.state1~q\ : std_logic;
SIGNAL \reg_fstate.state2~0_combout\ : std_logic;
SIGNAL \fstate.state2~q\ : std_logic;
SIGNAL \output2~0_combout\ : std_logic;
SIGNAL \output1~0_combout\ : std_logic;
SIGNAL \output2~1_combout\ : std_logic;
SIGNAL \output3~0_combout\ : std_logic;

BEGIN

ww_reset <= reset;
ww_clock <= clock;
output1 <= ww_output1;
output2 <= ww_output2;
output3 <= ww_output3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);

-- Location: IOOBUF_X12_Y0_N2
\output1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output1~0_combout\,
	devoe => ww_devoe,
	o => \output1~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\output2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output2~1_combout\,
	devoe => ww_devoe,
	o => \output2~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\output3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output3~0_combout\,
	devoe => ww_devoe,
	o => \output3~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clock~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G17
\clock~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X10_Y0_N8
\reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X9_Y1_N18
\reg_fstate.state3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state3~0_combout\ = (!\reset~input_o\ & \fstate.state2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state2~q\,
	combout => \reg_fstate.state3~0_combout\);

-- Location: FF_X9_Y1_N19
\fstate.state3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state3~q\);

-- Location: LCCOMB_X9_Y1_N20
\reg_fstate.state4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state4~0_combout\ = (!\reset~input_o\ & \fstate.state3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state3~q\,
	combout => \reg_fstate.state4~0_combout\);

-- Location: FF_X9_Y1_N21
\fstate.state4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state4~q\);

-- Location: LCCOMB_X9_Y1_N28
\reg_fstate.state5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state5~0_combout\ = (!\reset~input_o\ & \fstate.state4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state4~q\,
	combout => \reg_fstate.state5~0_combout\);

-- Location: FF_X9_Y1_N29
\fstate.state5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state5~q\);

-- Location: LCCOMB_X9_Y1_N2
\reg_fstate.state6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state6~0_combout\ = (!\reset~input_o\ & \fstate.state5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state5~q\,
	combout => \reg_fstate.state6~0_combout\);

-- Location: FF_X9_Y1_N3
\fstate.state6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state6~q\);

-- Location: LCCOMB_X9_Y1_N6
\reg_fstate.state7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state7~0_combout\ = (!\reset~input_o\ & \fstate.state6~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state6~q\,
	combout => \reg_fstate.state7~0_combout\);

-- Location: FF_X9_Y1_N7
\fstate.state7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state7~q\);

-- Location: LCCOMB_X9_Y1_N10
\reg_fstate.state8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state8~0_combout\ = (!\reset~input_o\ & \fstate.state7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state7~q\,
	combout => \reg_fstate.state8~0_combout\);

-- Location: FF_X9_Y1_N11
\fstate.state8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state8~q\);

-- Location: LCCOMB_X9_Y1_N16
\reg_fstate.state1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state1~0_combout\ = (!\reset~input_o\ & !\fstate.state8~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state8~q\,
	combout => \reg_fstate.state1~0_combout\);

-- Location: FF_X9_Y1_N17
\fstate.state1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state1~q\);

-- Location: LCCOMB_X9_Y1_N12
\reg_fstate.state2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.state2~0_combout\ = (!\reset~input_o\ & !\fstate.state1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \fstate.state1~q\,
	combout => \reg_fstate.state2~0_combout\);

-- Location: FF_X9_Y1_N13
\fstate.state2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.state2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.state2~q\);

-- Location: LCCOMB_X9_Y1_N22
\output2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \output2~0_combout\ = (\fstate.state1~q\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fstate.state1~q\,
	datad => \reset~input_o\,
	combout => \output2~0_combout\);

-- Location: LCCOMB_X9_Y1_N14
\output1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \output1~0_combout\ = (!\fstate.state2~q\ & (!\fstate.state3~q\ & (\output2~0_combout\ & !\fstate.state4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fstate.state2~q\,
	datab => \fstate.state3~q\,
	datac => \output2~0_combout\,
	datad => \fstate.state4~q\,
	combout => \output1~0_combout\);

-- Location: LCCOMB_X9_Y1_N24
\output2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \output2~1_combout\ = (!\fstate.state2~q\ & (!\fstate.state5~q\ & (\output2~0_combout\ & !\fstate.state6~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fstate.state2~q\,
	datab => \fstate.state5~q\,
	datac => \output2~0_combout\,
	datad => \fstate.state6~q\,
	combout => \output2~1_combout\);

-- Location: LCCOMB_X9_Y1_N8
\output3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \output3~0_combout\ = (!\fstate.state7~q\ & (!\fstate.state3~q\ & (\output2~0_combout\ & !\fstate.state5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fstate.state7~q\,
	datab => \fstate.state3~q\,
	datac => \output2~0_combout\,
	datad => \fstate.state5~q\,
	combout => \output3~0_combout\);

ww_output1 <= \output1~output_o\;

ww_output2 <= \output2~output_o\;

ww_output3 <= \output3~output_o\;
END structure;


