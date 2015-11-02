#!/bin/sh
# Copyright (C) 2014 OpenWrt.org

. /lib/functions/leds.sh
. /lib/kirkwood.sh

get_status_led() {
	case $(kirkwood_board_name) in
	dir665)
		status_led="dir665:blue:status"
		;;
	dockstar|\
	goflexhome|\
	goflexnet)
		status_led="status:orange:fault"
		;;
	ea3500)
		status_led="ea3500:green:power"
		;;
	ea4500)
		status_led="ea4500:white:health"
		;;
	pogo_e02)
		status_led="pogo_e02:orange:fault"
		;;
	esac
}

set_state() {
	get_status_led

	case "$1" in
	preinit)
		status_led_blink_preinit
		;;
	failsafe)
		status_led_blink_failsafe
		;;
	preinit_regular)
		status_led_blink_preinit_regular
		;;
	done)
		status_led_on
		;;
	esac
}
