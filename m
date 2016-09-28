Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pu1apc01on0099.outbound.protection.outlook.com ([104.47.126.99]:39391
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751888AbcI1JFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 05:05:47 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: LVDS SUPPORT RCAR
Date: Wed, 28 Sep 2016 09:05:41 +0000
Message-ID: <SG2PR0401MB12965FC668CE489CB4E22F54D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>




Hi Geert,


I am using 3.10.31-ltsi ..i have already added the specified line at the en=
d of r8a7791.dts.
here i am inculing the content of r8a7791.dts

---------------------------------------------------------

/*
=A0* Device Tree Source for the Koelsch board
=A0*
=A0* Copyright (C) 2013-2015 Renesas Electronics Corporation
=A0* Copyright (C) 2013-2014 Renesas Solutions Corp.
=A0* Copyright (C) 2014 Cogent Embedded, Inc.
=A0*
=A0* This file is licensed under the terms of the GNU General Public Licens=
e
=A0* version 2.=A0 This program is licensed "as is" without any warranty of=
 any
=A0* kind, whether express or implied.
=A0*/

/*
=A0* SSI-AK4643
=A0*
=A0* SW1: 1: AK4643
=A0*=A0=A0=A0=A0=A0 2: CN22
=A0*=A0=A0=A0=A0=A0 3: ADV7511
=A0*
=A0* This command is required when Playback/Capture
=A0*
=A0*=A0=A0 =A0amixer set "LINEOUT Mixer DACL" on
=A0*=A0=A0 =A0amixer set "DVC Out" 100%
=A0*=A0=A0 =A0amixer set "DVC In" 100%
=A0*
=A0* You can use Mute
=A0*
=A0*=A0=A0 =A0amixer set "DVC Out Mute" on
=A0*=A0=A0 =A0amixer set "DVC In Mute" on
=A0*/

/dts-v1/;

/* Reserve 16MB used for ADSP */
/memreserve/ 0x56000000 0x01000000;

#include "r8a7791.dtsi"
#include <dt-bindings/gpio/gpio.h>
#include <dt-bindings/input/input.h>

/ {
=A0=A0 =A0model =3D "Koelsch";
=A0=A0 =A0compatible =3D "renesas,koelsch", "renesas,r8a7791";

=A0=A0 =A0aliases {
=A0=A0 =A0=A0=A0 =A0serial6 =3D &scif0;
=A0=A0 =A0=A0=A0 =A0serial7 =3D &scif1;
=A0=A0 =A0=A0=A0 =A0serial16 =3D &hscif1;
=A0=A0 =A0};

=A0=A0 =A0chosen {
=A0=A0 =A0=A0=A0 =A0bootargs =3D "console=3DttySC6,38400 ignore_loglevel rw=
 root=3D/dev/nfs ip=3Ddhcp vmalloc=3D384M";
=A0=A0 =A0};

=A0=A0 =A0memory@40000000 {
=A0=A0 =A0=A0=A0 =A0device_type =3D "memory";
=A0=A0 =A0=A0=A0 =A0reg =3D <0 0x40000000 0 0x40000000>;
=A0=A0 =A0};

=A0=A0 =A0memory@200000000 {
=A0=A0 =A0=A0=A0 =A0device_type =3D "memory";
=A0=A0 =A0=A0=A0 =A0reg =3D <2 0x00000000 0 0x40000000>;
=A0=A0 =A0};

=A0=A0 =A0lbsc {
=A0=A0 =A0=A0=A0 =A0#address-cells =3D <1>;
=A0=A0 =A0=A0=A0 =A0#size-cells =3D <1>;
=A0=A0 =A0};

=A0=A0 =A0gpio-keys {
=A0=A0 =A0=A0=A0 =A0compatible =3D "gpio-keys";

=A0=A0 =A0=A0=A0 =A0key-1 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio5 0 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_1>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW2-1";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-2 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio5 1 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_2>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW2-2";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-3 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio5 2 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_3>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW2-3";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-4 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio5 3 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_4>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW2-4";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-a {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 0 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_A>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW30";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-b {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 1 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_B>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW31";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-c {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 2 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_C>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW32";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-d {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 3 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_D>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW33";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-e {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 4 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_E>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW34";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-f {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 5 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_F>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW35";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0key-g {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio7 6 GPIO_ACTIVE_LOW>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0linux,code =3D <KEY_G>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "SW36";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpio-key,wakeup;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0debounce-interval =3D <20>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};

=A0=A0 =A0leds {
=A0=A0 =A0=A0=A0 =A0compatible =3D "gpio-leds";
=A0=A0 =A0=A0=A0 =A0led6 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0led7 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio2 20 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0led8 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio2 21 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};

=A0=A0 =A0vcc_sdhi0: regulator@0 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "regulator-fixed";

=A0=A0 =A0=A0=A0 =A0regulator-name =3D "SDHI0 Vcc";
=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <3300000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <3300000>;

=A0=A0 =A0=A0=A0 =A0gpio =3D <&gpio7 17 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0enable-active-high;
=A0=A0 =A0};

=A0=A0 =A0vccq_sdhi0: regulator@1 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "regulator-gpio";

=A0=A0 =A0=A0=A0 =A0regulator-name =3D "SDHI0 VccQ";
=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <1800000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <3300000>;

=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio2 12 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0gpios-states =3D <1>;
=A0=A0 =A0=A0=A0 =A0states =3D <3300000 1
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0 1800000 0>;
=A0=A0 =A0};

=A0=A0 =A0vcc_sdhi1: regulator@2 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "regulator-fixed";

=A0=A0 =A0=A0=A0 =A0regulator-name =3D "SDHI1 Vcc";
=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <3300000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <3300000>;

=A0=A0 =A0=A0=A0 =A0gpio =3D <&gpio7 18 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0enable-active-high;
=A0=A0 =A0};

=A0=A0 =A0vccq_sdhi1: regulator@3 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "regulator-gpio";

=A0=A0 =A0=A0=A0 =A0regulator-name =3D "SDHI1 VccQ";
=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <1800000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <3300000>;

=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio2 13 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0gpios-states =3D <1>;
=A0=A0 =A0=A0=A0 =A0states =3D <3300000 1
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0 1800000 0>;
=A0=A0 =A0};

=A0=A0 =A0vcc_sdhi2: regulator@4 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "regulator-fixed";

=A0=A0 =A0=A0=A0 =A0regulator-name =3D "SDHI2 Vcc";
=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <3300000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <3300000>;

=A0=A0 =A0=A0=A0 =A0gpio =3D <&gpio7 19 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0enable-active-high;
=A0=A0 =A0};

=A0=A0 =A0vccq_sdhi2: regulator@5 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "regulator-gpio";

=A0=A0 =A0=A0=A0 =A0regulator-name =3D "SDHI2 VccQ";
=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <1800000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <3300000>;

=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio2 26 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0=A0=A0 =A0gpios-states =3D <1>;
=A0=A0 =A0=A0=A0 =A0states =3D <3300000 1
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0 1800000 0>;
=A0=A0 =A0};

=A0=A0 =A0sound {
=A0=A0 =A0=A0=A0 =A0compatible =3D "simple-audio-card";
=A0=A0 =A0=A0=A0 =A0simple-audio-card,format =3D "i2s";

=A0=A0 =A0=A0=A0 =A0sndcpu: simple-audio-card,cpu {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0sound-dai =3D <&rcar_sound>;
=A0=A0 =A0=A0=A0 =A0};

=A0=A0 =A0=A0=A0 =A0sndcodec: simple-audio-card,codec {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0sound-dai =3D <&ak4643>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0system-clock-frequency =3D <11289600>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};

=A0=A0 =A0hdmi_transmitter: adv7511 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "adi,adv7511";
=A0=A0 =A0=A0=A0 =A0gpios =3D <&gpio3 29 GPIO_ACTIVE_LOW>;

=A0=A0 =A0=A0=A0 =A0adi,input-style =3D <0x02>;
=A0=A0 =A0=A0=A0 =A0adi,input-id =3D <0x00>;
=A0=A0 =A0=A0=A0 =A0adi,input-color-depth =3D <0x03>;
=A0=A0 =A0=A0=A0 =A0adi,sync-pulse =3D <0x03>;
=A0=A0 =A0=A0=A0 =A0adi,bit-justification =3D <0x01>;
=A0=A0 =A0=A0=A0 =A0adi,up-conversion =3D <0x00>;
=A0=A0 =A0=A0=A0 =A0adi,timing-generation-sequence =3D <0x00>;
=A0=A0 =A0=A0=A0 =A0adi,vsync-polarity =3D <0x02>;
=A0=A0 =A0=A0=A0 =A0adi,hsync-polarity =3D <0x02>;
=A0=A0 =A0=A0=A0 =A0adi,clock-delay =3D <0x03>;
=A0=A0 =A0};
};

&extal_clk {
=A0=A0 =A0clock-frequency =3D <20000000>;
};

&pfc {
=A0=A0 =A0pinctrl-0 =3D <&du_pins &usb0_pins &usb1_pins &vin0_pins &vin1_pi=
ns>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0i2c2_pins: i2c2 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "i2c2";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "i2c2";
=A0=A0 =A0};

=A0=A0 =A0du_pins: du {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "du_rgb666", "du_sync", "du_clk_out_=
0";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "du";
=A0=A0 =A0};

=A0=A0 =A0scif0_pins: serial6 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "scif0_data_d";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "scif0";
=A0=A0 =A0};

=A0=A0 =A0scif1_pins: serial7 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "scif1_data_d";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "scif1";
=A0=A0 =A0};

=A0=A0 =A0hscif1_pins: serial16 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "hscif1_data", "hscif1_ctrl";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "hscif1";
=A0=A0 =A0};

=A0=A0 =A0ether_pins: ether {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "eth_link", "eth_mdio", "eth_rmii";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "eth";
=A0=A0 =A0};

=A0=A0 =A0phy1_pins: phy1 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "intc_irq0";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "intc";
=A0=A0 =A0};

=A0=A0 =A0sdhi0_pins: sd0 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "sdhi0_data4", "sdhi0_ctrl";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "sdhi0";
=A0=A0 =A0};

=A0=A0 =A0sdhi1_pins: sd1 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "sdhi1_data4", "sdhi1_ctrl";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "sdhi1";
=A0=A0 =A0};

=A0=A0 =A0sdhi2_pins: sd2 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "sdhi2_data4", "sdhi2_ctrl";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "sdhi2";
=A0=A0 =A0};

=A0=A0 =A0qspi_pins: spi0 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "qspi_ctrl", "qspi_data4";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "qspi";
=A0=A0 =A0};

=A0=A0 =A0msiof0_pins: spi1 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "msiof0_clk", "msiof0_sync", "msiof0=
_rx",
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 "msiof0_tx";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "msiof0";
=A0=A0 =A0};

=A0=A0 =A0msiof1_pins: spi2 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "msiof1_clk_c", "msiof1_sync_c", "ms=
iof1_rx_c",
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 "msiof1_tx_c";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "msiof1";
=A0=A0 =A0};

=A0=A0 =A0sound_pins: sound {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "ssi0129_ctrl", "ssi0_data", "ssi1_d=
ata";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "ssi";
=A0=A0 =A0};
=A0=A0 =A0sound_clk_pins: sound_clk {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "audio_clk_a";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "audio_clk";
=A0=A0 =A0};

=A0=A0 =A0vin0_pins: vin0 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "vin0_data24", "vin0_sync", "vin0_fi=
eld",
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 "vin0_clkenb", "vin0_clk";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "vin0";
=A0=A0 =A0};

=A0=A0 =A0vin1_pins: vin1 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "vin1_data8", "vin1_clk";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "vin1";
=A0=A0 =A0};

=A0=A0 =A0usb0_pins: usb0 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "usb0";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "usb0";
=A0=A0 =A0};

=A0=A0 =A0usb1_pins: usb1 {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "usb1";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "usb1";
=A0=A0 =A0};
};

&ether {
=A0=A0 =A0pinctrl-0 =3D <&ether_pins &phy1_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0phy-handle =3D <&phy1>;
=A0=A0 =A0renesas,ether-link-active-low;
=A0=A0 =A0status =3D "ok";

=A0=A0 =A0phy1: ethernet-phy@1 {
=A0=A0 =A0=A0=A0 =A0reg =3D <1>;
=A0=A0 =A0=A0=A0 =A0interrupt-parent =3D <&irqc0>;
=A0=A0 =A0=A0=A0 =A0interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
=A0=A0 =A0=A0=A0 =A0micrel,led-mode =3D <1>;
=A0=A0 =A0};
};

&sata0 {
=A0=A0 =A0status =3D "okay";
};

&scif0 {
=A0=A0 =A0pinctrl-0 =3D <&scif0_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0status =3D "okay";
};

&scif1 {
=A0=A0 =A0pinctrl-0 =3D <&scif1_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0status =3D "okay";
};

&hscif1 {
=A0=A0 =A0pinctrl-0 =3D <&hscif1_pins>;
=A0=A0 =A0pinctrl-names =3D "default";
};

&sdhi0 {
=A0=A0 =A0pinctrl-0 =3D <&sdhi0_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0vmmc-supply =3D <&vcc_sdhi0>;
=A0=A0 =A0vqmmc-supply =3D <&vccq_sdhi0>;
=A0=A0 =A0cd-gpios =3D <&gpio6 6 GPIO_ACTIVE_LOW>;
=A0=A0 =A0wp-gpios =3D <&gpio6 7 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0status =3D "okay";
};

&sdhi1 {
=A0=A0 =A0pinctrl-0 =3D <&sdhi1_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0vmmc-supply =3D <&vcc_sdhi1>;
=A0=A0 =A0vqmmc-supply =3D <&vccq_sdhi1>;
=A0=A0 =A0cd-gpios =3D <&gpio6 14 GPIO_ACTIVE_LOW>;
=A0=A0 =A0wp-gpios =3D <&gpio6 15 GPIO_ACTIVE_HIGH>;
=A0=A0 =A0status =3D "okay";
};

&sdhi2 {
=A0=A0 =A0pinctrl-0 =3D <&sdhi2_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0vmmc-supply =3D <&vcc_sdhi2>;
=A0=A0 =A0vqmmc-supply =3D <&vccq_sdhi2>;
=A0=A0 =A0cd-gpios =3D <&gpio6 22 GPIO_ACTIVE_LOW>;
=A0=A0 =A0status =3D "okay";
};

&qspi {
=A0=A0 =A0pinctrl-0 =3D <&qspi_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0status =3D "okay";

=A0=A0 =A0flash: flash@0 {
=A0=A0 =A0=A0=A0 =A0#address-cells =3D <1>;
=A0=A0 =A0=A0=A0 =A0#size-cells =3D <1>;
=A0=A0 =A0=A0=A0 =A0compatible =3D "spansion,s25fl512s";
=A0=A0 =A0=A0=A0 =A0reg =3D <0>;
=A0=A0 =A0=A0=A0 =A0spi-max-frequency =3D <30000000>;
=A0=A0 =A0=A0=A0 =A0spi-tx-bus-width =3D <4>;
=A0=A0 =A0=A0=A0 =A0spi-rx-bus-width =3D <4>;
=A0=A0 =A0=A0=A0 =A0m25p,fast-read;
=A0=A0 =A0=A0=A0 =A0spi-cpol;
=A0=A0 =A0=A0=A0 =A0spi-cpha;

=A0=A0 =A0=A0=A0 =A0partition@0 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "loader";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x00000000 0x00080000>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0read-only;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@40000 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "user";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x00080000 0x00580000>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0read-only;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@440000 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "flash";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x00600000 0x03a00000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};
};

&msiof0 {
=A0=A0 =A0pinctrl-0 =3D <&msiof0_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0status =3D "okay";
};

&msiof1 {
=A0=A0 =A0pinctrl-0 =3D <&msiof1_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0status =3D "okay";
};

&i2c2 {
=A0=A0 =A0pinctrl-0 =3D <&i2c2_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0status =3D "okay";
=A0=A0 =A0clock-frequency =3D <400000>;

=A0=A0 =A0eeprom@50 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "renesas,24c02";
=A0=A0 =A0=A0=A0 =A0reg =3D <0x50>;
=A0=A0 =A0=A0=A0 =A0pagesize =3D <16>;
=A0=A0 =A0};

=A0=A0 =A0ak4643: sound-codec@12 {
=A0=A0 =A0=A0=A0 =A0#sound-dai-cells =3D <0>;
=A0=A0 =A0=A0=A0 =A0compatible =3D "asahi-kasei,ak4643";
=A0=A0 =A0=A0=A0 =A0reg =3D <0x12>;
=A0=A0 =A0};
};

&i2c6 {
=A0=A0 =A0status =3D "okay";
=A0=A0 =A0clock-frequency =3D <100000>;

=A0=A0 =A0vdd_dvfs: regulator@68 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "diasemi,da9210";
=A0=A0 =A0=A0=A0 =A0reg =3D <0x68>;

=A0=A0 =A0=A0=A0 =A0regulator-min-microvolt =3D <1000000>;
=A0=A0 =A0=A0=A0 =A0regulator-max-microvolt =3D <1000000>;
=A0=A0 =A0=A0=A0 =A0regulator-boot-on;
=A0=A0 =A0=A0=A0 =A0regulator-always-on;
=A0=A0 =A0};
};

&pci0 {
=A0=A0 =A0status =3D "okay";
=A0=A0 =A0pinctrl-0 =3D <&usb0_pins>;
=A0=A0 =A0pinctrl-names =3D "default";
};

&pci1 {
=A0=A0 =A0status =3D "okay";
=A0=A0 =A0pinctrl-0 =3D <&usb1_pins>;
=A0=A0 =A0pinctrl-names =3D "default";
};

&pcie_bus_clk {
=A0=A0 =A0status =3D "okay";
};

&pciec {
=A0=A0 =A0status =3D "okay";
};

&cpu0 {
=A0=A0 =A0cpu0-supply =3D <&vdd_dvfs>;
};

&rcar_sound {
=A0=A0 =A0pinctrl-0 =3D <&sound_pins &sound_clk_pins>;
=A0=A0 =A0pinctrl-names =3D "default";

=A0=A0 =A0#sound-dai-cells =3D <0>;

=A0=A0 =A0status =3D "okay";

=A0=A0 =A0rcar_sound,dai {
=A0=A0 =A0=A0=A0 =A0dai0 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0playback =3D <&ssi0 &src0 &dvc0>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0capture=A0 =3D <&ssi1 &src1 &dvc1>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};
};

&ssi1 {
=A0=A0 =A0shared-pin;
};

#include "r8a77xx-aa104xd12-panel.dtsi"









Best Regards
Jithin T Raj



   =
