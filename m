Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167D8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3FB92133F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732318AbfAKM1Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:27:16 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:51028 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732312AbfAKM1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:27:16 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id P0TC1z00Q3XaVaC060TCyh; Fri, 11 Jan 2019 13:27:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0006J2-JB; Fri, 11 Jan 2019 13:27:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0008R1-I3; Fri, 11 Jan 2019 13:27:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a77970: Deduplicate VIN[01] pin definitions
Date:   Fri, 11 Jan 2019 13:27:04 +0100
Message-Id: <20190111122705.32365-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111122705.32365-1-geert+renesas@glider.be>
References: <20190111122705.32365-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use union vin_data12 and VIN_DATA_PIN_GROUP() to reduce redundancies in
pin definitions for the VIN0 and VIN1 channels.

This reduces kernel size by 288 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 128 +++++++++-----------------
 1 file changed, 42 insertions(+), 86 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index 4a7ab84b366be986..c5e67ba29f7c88cd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -1578,47 +1578,25 @@ static const unsigned int tmu_tclk2_b_mux[] = {
 };
 
 /* - VIN0 ------------------------------------------------------------------- */
-static const unsigned int vin0_data8_pins[] = {
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
-	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-};
-static const unsigned int vin0_data8_mux[] = {
-	VI0_DATA0_MARK, VI0_DATA1_MARK,
-	VI0_DATA2_MARK, VI0_DATA3_MARK,
-	VI0_DATA4_MARK, VI0_DATA5_MARK,
-	VI0_DATA6_MARK, VI0_DATA7_MARK,
+static const union vin_data12 vin0_data_pins = {
+	.data12 = {
+		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+		RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
+		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+		RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
+	},
 };
-static const unsigned int vin0_data10_pins[] = {
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
-	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
-};
-static const unsigned int vin0_data10_mux[] = {
-	VI0_DATA0_MARK, VI0_DATA1_MARK,
-	VI0_DATA2_MARK, VI0_DATA3_MARK,
-	VI0_DATA4_MARK, VI0_DATA5_MARK,
-	VI0_DATA6_MARK, VI0_DATA7_MARK,
-	VI0_DATA8_MARK,  VI0_DATA9_MARK,
-};
-static const unsigned int vin0_data12_pins[] = {
-	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
-	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
-	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
-};
-static const unsigned int vin0_data12_mux[] = {
-	VI0_DATA0_MARK, VI0_DATA1_MARK,
-	VI0_DATA2_MARK, VI0_DATA3_MARK,
-	VI0_DATA4_MARK, VI0_DATA5_MARK,
-	VI0_DATA6_MARK, VI0_DATA7_MARK,
-	VI0_DATA8_MARK,  VI0_DATA9_MARK,
-	VI0_DATA10_MARK, VI0_DATA11_MARK,
+static const union vin_data12 vin0_data_mux = {
+	.data12 = {
+		VI0_DATA0_MARK, VI0_DATA1_MARK,
+		VI0_DATA2_MARK, VI0_DATA3_MARK,
+		VI0_DATA4_MARK, VI0_DATA5_MARK,
+		VI0_DATA6_MARK, VI0_DATA7_MARK,
+		VI0_DATA8_MARK,  VI0_DATA9_MARK,
+		VI0_DATA10_MARK, VI0_DATA11_MARK,
+	},
 };
 static const unsigned int vin0_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1650,47 +1628,25 @@ static const unsigned int vin0_clk_mux[] = {
 };
 
 /* - VIN1 ------------------------------------------------------------------- */
-static const unsigned int vin1_data8_pins[] = {
-	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-};
-static const unsigned int vin1_data8_mux[] = {
-	VI1_DATA0_MARK, VI1_DATA1_MARK,
-	VI1_DATA2_MARK, VI1_DATA3_MARK,
-	VI1_DATA4_MARK, VI1_DATA5_MARK,
-	VI1_DATA6_MARK, VI1_DATA7_MARK,
-};
-static const unsigned int vin1_data10_pins[] = {
-	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
-};
-static const unsigned int vin1_data10_mux[] = {
-	VI1_DATA0_MARK, VI1_DATA1_MARK,
-	VI1_DATA2_MARK, VI1_DATA3_MARK,
-	VI1_DATA4_MARK, VI1_DATA5_MARK,
-	VI1_DATA6_MARK, VI1_DATA7_MARK,
-	VI1_DATA8_MARK,  VI1_DATA9_MARK,
-};
-static const unsigned int vin1_data12_pins[] = {
-	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
-	RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
+static const union vin_data12 vin1_data_pins = {
+	.data12 = {
+		RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+		RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+		RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
+		RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+		RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
+		RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
+	},
 };
-static const unsigned int vin1_data12_mux[] = {
-	VI1_DATA0_MARK, VI1_DATA1_MARK,
-	VI1_DATA2_MARK, VI1_DATA3_MARK,
-	VI1_DATA4_MARK, VI1_DATA5_MARK,
-	VI1_DATA6_MARK, VI1_DATA7_MARK,
-	VI1_DATA8_MARK,  VI1_DATA9_MARK,
-	VI1_DATA10_MARK, VI1_DATA11_MARK,
+static const union vin_data12 vin1_data_mux = {
+	.data12 = {
+		VI1_DATA0_MARK, VI1_DATA1_MARK,
+		VI1_DATA2_MARK, VI1_DATA3_MARK,
+		VI1_DATA4_MARK, VI1_DATA5_MARK,
+		VI1_DATA6_MARK, VI1_DATA7_MARK,
+		VI1_DATA8_MARK,  VI1_DATA9_MARK,
+		VI1_DATA10_MARK, VI1_DATA11_MARK,
+	},
 };
 static const unsigned int vin1_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1831,16 +1787,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tmu_tclk1_b),
 	SH_PFC_PIN_GROUP(tmu_tclk2_a),
 	SH_PFC_PIN_GROUP(tmu_tclk2_b),
-	SH_PFC_PIN_GROUP(vin0_data8),
-	SH_PFC_PIN_GROUP(vin0_data10),
-	SH_PFC_PIN_GROUP(vin0_data12),
+	VIN_DATA_PIN_GROUP(vin0_data, 8),
+	VIN_DATA_PIN_GROUP(vin0_data, 10),
+	VIN_DATA_PIN_GROUP(vin0_data, 12),
 	SH_PFC_PIN_GROUP(vin0_sync),
 	SH_PFC_PIN_GROUP(vin0_field),
 	SH_PFC_PIN_GROUP(vin0_clkenb),
 	SH_PFC_PIN_GROUP(vin0_clk),
-	SH_PFC_PIN_GROUP(vin1_data8),
-	SH_PFC_PIN_GROUP(vin1_data10),
-	SH_PFC_PIN_GROUP(vin1_data12),
+	VIN_DATA_PIN_GROUP(vin1_data, 8),
+	VIN_DATA_PIN_GROUP(vin1_data, 10),
+	VIN_DATA_PIN_GROUP(vin1_data, 12),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
-- 
2.17.1

