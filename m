Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40624 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966136AbeCSQhz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:37:55 -0400
Received: by mail-wr0-f196.google.com with SMTP id z8so9570194wrh.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:37:55 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a77995: deduplicate VIN4 pin definitions
Date: Mon, 19 Mar 2018 17:37:45 +0100
Message-Id: <1521477465-1174-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use union vin_data and VIN_DATA_PIN_GROUP() to reduce redundancies
in pin definitions.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 154 ++++++++--------------------------
 1 file changed, 36 insertions(+), 118 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 62bab9f..70def2af 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -1627,68 +1627,6 @@ static const unsigned int usb0_mux[] = {
 };
 
 /* - VIN4 ------------------------------------------------------------------- */
-static const unsigned int vin4_data8_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-};
-static const unsigned int vin4_data8_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
-	VI4_DATA2_MARK, VI4_DATA3_MARK,
-	VI4_DATA4_MARK, VI4_DATA5_MARK,
-	VI4_DATA6_MARK, VI4_DATA7_MARK,
-};
-static const unsigned int vin4_data10_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-};
-static const unsigned int vin4_data10_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
-	VI4_DATA2_MARK, VI4_DATA3_MARK,
-	VI4_DATA4_MARK, VI4_DATA5_MARK,
-	VI4_DATA6_MARK, VI4_DATA7_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-};
-static const unsigned int vin4_data12_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
-};
-static const unsigned int vin4_data12_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
-	VI4_DATA2_MARK, VI4_DATA3_MARK,
-	VI4_DATA4_MARK, VI4_DATA5_MARK,
-	VI4_DATA6_MARK, VI4_DATA7_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-};
-static const unsigned int vin4_data16_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
-	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
-	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
-};
-static const unsigned int vin4_data16_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
-	VI4_DATA2_MARK, VI4_DATA3_MARK,
-	VI4_DATA4_MARK, VI4_DATA5_MARK,
-	VI4_DATA6_MARK, VI4_DATA7_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-};
 static const unsigned int vin4_data18_pins[] = {
 	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
 	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
@@ -1711,57 +1649,37 @@ static const unsigned int vin4_data18_mux[] = {
 	VI4_DATA20_MARK, VI4_DATA21_MARK,
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const unsigned int vin4_data20_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
-	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
-	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
-	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
-	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
-};
-static const unsigned int vin4_data20_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
-	VI4_DATA2_MARK, VI4_DATA3_MARK,
-	VI4_DATA4_MARK, VI4_DATA5_MARK,
-	VI4_DATA6_MARK, VI4_DATA7_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
-	VI4_DATA18_MARK, VI4_DATA19_MARK,
-};
-static const unsigned int vin4_data24_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
-	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
-	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
-	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
-	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
-	RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
-	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
+static const union vin_data vin4_data_pins = {
+	.data24 = {
+		RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+		RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+		RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+		RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+		RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+		RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+		RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+		RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+		RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+		RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
+		RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
+		RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
+	},
 };
-static const unsigned int vin4_data24_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
-	VI4_DATA2_MARK, VI4_DATA3_MARK,
-	VI4_DATA4_MARK, VI4_DATA5_MARK,
-	VI4_DATA6_MARK, VI4_DATA7_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
-	VI4_DATA18_MARK, VI4_DATA19_MARK,
-	VI4_DATA20_MARK, VI4_DATA21_MARK,
-	VI4_DATA22_MARK, VI4_DATA23_MARK,
+static const union vin_data vin4_data_mux = {
+	.data24 = {
+		VI4_DATA0_MARK, VI4_DATA1_MARK,
+		VI4_DATA2_MARK, VI4_DATA3_MARK,
+		VI4_DATA4_MARK, VI4_DATA5_MARK,
+		VI4_DATA6_MARK, VI4_DATA7_MARK,
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
@@ -1877,13 +1795,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ssi4_ctrl_b),
 	SH_PFC_PIN_GROUP(ssi4_data_b),
 	SH_PFC_PIN_GROUP(usb0),
-	SH_PFC_PIN_GROUP(vin4_data8),
-	SH_PFC_PIN_GROUP(vin4_data10),
-	SH_PFC_PIN_GROUP(vin4_data12),
-	SH_PFC_PIN_GROUP(vin4_data16),
+	VIN_DATA_PIN_GROUP(vin4_data, 8),
+	VIN_DATA_PIN_GROUP(vin4_data, 10),
+	VIN_DATA_PIN_GROUP(vin4_data, 12),
+	VIN_DATA_PIN_GROUP(vin4_data, 16),
 	SH_PFC_PIN_GROUP(vin4_data18),
-	SH_PFC_PIN_GROUP(vin4_data20),
-	SH_PFC_PIN_GROUP(vin4_data24),
+	VIN_DATA_PIN_GROUP(vin4_data, 20),
+	VIN_DATA_PIN_GROUP(vin4_data, 24),
 	SH_PFC_PIN_GROUP(vin4_sync),
 	SH_PFC_PIN_GROUP(vin4_field),
 	SH_PFC_PIN_GROUP(vin4_clkenb),
-- 
2.7.4
