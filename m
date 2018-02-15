Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35814 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967889AbeBOMBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 07:01:45 -0500
Received: by mail-wr0-f196.google.com with SMTP id l43so3099777wrc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 04:01:44 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a77995: Add VIN4 pins, groups and function
Date: Thu, 15 Feb 2018 13:01:30 +0100
Message-Id: <1518696091-23561-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds VIN4 pins, groups and function for the
R8A77995 (D3) SoC.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 192 ++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index a4927b7..f11edf1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -1545,6 +1545,172 @@ static const unsigned int usb0_mux[] = {
 	USB0_PWEN_MARK, USB0_OVC_MARK,
 };
 
+/* - VIN4 ------------------------------------------------------------------- */
+static const unsigned int vin4_data8_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+};
+static const unsigned int vin4_data8_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+};
+static const unsigned int vin4_data10_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+};
+static const unsigned int vin4_data10_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+};
+static const unsigned int vin4_data12_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+};
+static const unsigned int vin4_data12_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+};
+static const unsigned int vin4_data16_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+};
+static const unsigned int vin4_data16_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
+static const unsigned int vin4_data18_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+};
+static const unsigned int vin4_data18_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+};
+static const unsigned int vin4_data20_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
+};
+static const unsigned int vin4_data20_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+};
+static const unsigned int vin4_data24_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
+	RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
+	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
+};
+static const unsigned int vin4_data24_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_sync_pins[] = {
+	/* HSYNC#, VSYNC# */
+	RCAR_GP_PIN(2, 26), RCAR_GP_PIN(2, 25),
+};
+static const unsigned int vin4_sync_mux[] = {
+	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
+};
+static const unsigned int vin4_field_pins[] = {
+	/* FIELD */
+	RCAR_GP_PIN(2, 27),
+};
+static const unsigned int vin4_field_mux[] = {
+	VI4_FIELD_MARK,
+};
+static const unsigned int vin4_clkenb_pins[] = {
+	/* CLKENB */
+	RCAR_GP_PIN(2, 28),
+};
+static const unsigned int vin4_clkenb_mux[] = {
+	VI4_CLKENB_MARK,
+};
+static const unsigned int vin4_clk_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(2, 0),
+};
+static const unsigned int vin4_clk_mux[] = {
+	VI4_CLK_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a),
 	SH_PFC_PIN_GROUP(audio_clk_b),
@@ -1622,6 +1788,17 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ssi4_ctrl_b),
 	SH_PFC_PIN_GROUP(ssi4_data_b),
 	SH_PFC_PIN_GROUP(usb0),
+	SH_PFC_PIN_GROUP(vin4_data8),
+	SH_PFC_PIN_GROUP(vin4_data10),
+	SH_PFC_PIN_GROUP(vin4_data12),
+	SH_PFC_PIN_GROUP(vin4_data16),
+	SH_PFC_PIN_GROUP(vin4_data18),
+	SH_PFC_PIN_GROUP(vin4_data20),
+	SH_PFC_PIN_GROUP(vin4_data24),
+	SH_PFC_PIN_GROUP(vin4_sync),
+	SH_PFC_PIN_GROUP(vin4_field),
+	SH_PFC_PIN_GROUP(vin4_clkenb),
+	SH_PFC_PIN_GROUP(vin4_clk),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -1771,6 +1948,20 @@ static const char * const usb0_groups[] = {
 	"usb0",
 };
 
+static const char * const vin4_groups[] = {
+	"vin4_data8",
+	"vin4_data10",
+	"vin4_data12",
+	"vin4_data16",
+	"vin4_data18",
+	"vin4_data20",
+	"vin4_data24",
+	"vin4_sync",
+	"vin4_field",
+	"vin4_clkenb",
+	"vin4_clk",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb0),
@@ -1797,6 +1988,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(ssi),
 	SH_PFC_FUNCTION(usb0),
+	SH_PFC_FUNCTION(vin4),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.7.4
