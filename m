Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:32958 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965145AbeCSQhw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:37:52 -0400
Received: by mail-wr0-f196.google.com with SMTP id z73so15032664wrb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:37:52 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/3] pinctrl: sh-pfc: r8a7795: deduplicate VIN4 pin definitions
Date: Mon, 19 Mar 2018 17:37:43 +0100
Message-Id: <1521477465-1174-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use union vin_data and VIN_DATA_PIN_GROUP() to reduce redundancies
in pin definitions.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 308 ++++++++---------------------------
 1 file changed, 72 insertions(+), 236 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index a9fd534..722cf6c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3928,130 +3928,6 @@ static const unsigned int usb30_mux[] = {
 };
 
 /* - VIN4 ------------------------------------------------------------------- */
-static const unsigned int vin4_data8_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-};
-static const unsigned int vin4_data8_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-};
-static const unsigned int vin4_data8_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-};
-static const unsigned int vin4_data8_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-};
-static const unsigned int vin4_data10_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-};
-static const unsigned int vin4_data10_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-};
-static const unsigned int vin4_data10_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-};
-static const unsigned int vin4_data10_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-};
-static const unsigned int vin4_data12_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-};
-static const unsigned int vin4_data12_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-};
-static const unsigned int vin4_data12_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-};
-static const unsigned int vin4_data12_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-};
-static const unsigned int vin4_data16_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-};
-static const unsigned int vin4_data16_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-};
-static const unsigned int vin4_data16_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-};
-static const unsigned int vin4_data16_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-};
 static const unsigned int vin4_data18_a_pins[] = {
 	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
 	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
@@ -4096,109 +3972,69 @@ static const unsigned int vin4_data18_b_mux[] = {
 	VI4_DATA20_MARK, VI4_DATA21_MARK,
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const unsigned int vin4_data20_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-};
-static const unsigned int vin4_data20_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
-	VI4_DATA18_MARK, VI4_DATA19_MARK,
-};
-static const unsigned int vin4_data20_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-};
-static const unsigned int vin4_data20_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
-	VI4_DATA18_MARK, VI4_DATA19_MARK,
-};
-static const unsigned int vin4_data24_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+static const union vin_data vin4_data_a_pins = {
+	.data24 = {
+		RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+		RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+		RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	},
 };
-static const unsigned int vin4_data24_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
-	VI4_DATA18_MARK, VI4_DATA19_MARK,
-	VI4_DATA20_MARK, VI4_DATA21_MARK,
-	VI4_DATA22_MARK, VI4_DATA23_MARK,
+static const union vin_data vin4_data_a_mux = {
+	.data24 = {
+		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+		VI4_DATA8_MARK,  VI4_DATA9_MARK,
+		VI4_DATA10_MARK, VI4_DATA11_MARK,
+		VI4_DATA12_MARK, VI4_DATA13_MARK,
+		VI4_DATA14_MARK, VI4_DATA15_MARK,
+		VI4_DATA16_MARK, VI4_DATA17_MARK,
+		VI4_DATA18_MARK, VI4_DATA19_MARK,
+		VI4_DATA20_MARK, VI4_DATA21_MARK,
+		VI4_DATA22_MARK, VI4_DATA23_MARK,
+	},
 };
-static const unsigned int vin4_data24_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+static const union vin_data vin4_data_b_pins = {
+	.data24 = {
+		RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+		RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	},
 };
-static const unsigned int vin4_data24_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
-	VI4_DATA18_MARK, VI4_DATA19_MARK,
-	VI4_DATA20_MARK, VI4_DATA21_MARK,
-	VI4_DATA22_MARK, VI4_DATA23_MARK,
+static const union vin_data vin4_data_b_mux = {
+	.data24 = {
+		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+		VI4_DATA8_MARK,  VI4_DATA9_MARK,
+		VI4_DATA10_MARK, VI4_DATA11_MARK,
+		VI4_DATA12_MARK, VI4_DATA13_MARK,
+		VI4_DATA14_MARK, VI4_DATA15_MARK,
+		VI4_DATA16_MARK, VI4_DATA17_MARK,
+		VI4_DATA18_MARK, VI4_DATA19_MARK,
+		VI4_DATA20_MARK, VI4_DATA21_MARK,
+		VI4_DATA22_MARK, VI4_DATA23_MARK,
+	},
 };
 static const unsigned int vin4_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -4640,20 +4476,20 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb2),
 	SH_PFC_PIN_GROUP(usb2_ch3),
 	SH_PFC_PIN_GROUP(usb30),
-	SH_PFC_PIN_GROUP(vin4_data8_a),
-	SH_PFC_PIN_GROUP(vin4_data10_a),
-	SH_PFC_PIN_GROUP(vin4_data12_a),
-	SH_PFC_PIN_GROUP(vin4_data16_a),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 8),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 10),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 12),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 16),
 	SH_PFC_PIN_GROUP(vin4_data18_a),
-	SH_PFC_PIN_GROUP(vin4_data20_a),
-	SH_PFC_PIN_GROUP(vin4_data24_a),
-	SH_PFC_PIN_GROUP(vin4_data8_b),
-	SH_PFC_PIN_GROUP(vin4_data10_b),
-	SH_PFC_PIN_GROUP(vin4_data12_b),
-	SH_PFC_PIN_GROUP(vin4_data16_b),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 20),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 24),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 8),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 10),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 12),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 16),
 	SH_PFC_PIN_GROUP(vin4_data18_b),
-	SH_PFC_PIN_GROUP(vin4_data20_b),
-	SH_PFC_PIN_GROUP(vin4_data24_b),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 20),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 24),
 	SH_PFC_PIN_GROUP(vin4_sync),
 	SH_PFC_PIN_GROUP(vin4_field),
 	SH_PFC_PIN_GROUP(vin4_clkenb),
-- 
2.7.4
