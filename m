Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A65C43612
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34F242133F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732312AbfAKM1Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:27:16 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:58452 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732317AbfAKM1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:27:16 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id P0TC1z00V3XaVaC010TCXR; Fri, 11 Jan 2019 13:27:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0006J0-IK; Fri, 11 Jan 2019 13:27:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0008Qx-GR; Fri, 11 Jan 2019 13:27:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] pinctrl: sh-pfc: r8a7796: Deduplicate VIN5 pin definitions
Date:   Fri, 11 Jan 2019 13:27:03 +0100
Message-Id: <20190111122705.32365-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111122705.32365-1-geert+renesas@glider.be>
References: <20190111122705.32365-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use union vin_data16 and VIN_DATA_PIN_GROUP() to reduce redundancies in
pin definitions for the VIN5 channel.

This reduces kernel size by 240 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 90 ++++++++--------------------
 1 file changed, 26 insertions(+), 64 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 4b98ad8d93d9e545..72348a4f2ece13b6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -4070,67 +4070,29 @@ static const unsigned int vin4_clk_mux[] = {
 };
 
 /* - VIN5 ------------------------------------------------------------------- */
-static const unsigned int vin5_data8_pins[] = {
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-};
-static const unsigned int vin5_data8_mux[] = {
-	VI5_DATA0_MARK, VI5_DATA1_MARK,
-	VI5_DATA2_MARK, VI5_DATA3_MARK,
-	VI5_DATA4_MARK, VI5_DATA5_MARK,
-	VI5_DATA6_MARK, VI5_DATA7_MARK,
-};
-static const unsigned int vin5_data10_pins[] = {
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-};
-static const unsigned int vin5_data10_mux[] = {
-	VI5_DATA0_MARK, VI5_DATA1_MARK,
-	VI5_DATA2_MARK, VI5_DATA3_MARK,
-	VI5_DATA4_MARK, VI5_DATA5_MARK,
-	VI5_DATA6_MARK, VI5_DATA7_MARK,
-	VI5_DATA8_MARK,  VI5_DATA9_MARK,
-};
-static const unsigned int vin5_data12_pins[] = {
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-};
-static const unsigned int vin5_data12_mux[] = {
-	VI5_DATA0_MARK, VI5_DATA1_MARK,
-	VI5_DATA2_MARK, VI5_DATA3_MARK,
-	VI5_DATA4_MARK, VI5_DATA5_MARK,
-	VI5_DATA6_MARK, VI5_DATA7_MARK,
-	VI5_DATA8_MARK,  VI5_DATA9_MARK,
-	VI5_DATA10_MARK, VI5_DATA11_MARK,
-};
-static const unsigned int vin5_data16_pins[] = {
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+static const union vin_data16 vin5_data_pins = {
+	.data16 = {
+		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	},
 };
-static const unsigned int vin5_data16_mux[] = {
-	VI5_DATA0_MARK, VI5_DATA1_MARK,
-	VI5_DATA2_MARK, VI5_DATA3_MARK,
-	VI5_DATA4_MARK, VI5_DATA5_MARK,
-	VI5_DATA6_MARK, VI5_DATA7_MARK,
-	VI5_DATA8_MARK,  VI5_DATA9_MARK,
-	VI5_DATA10_MARK, VI5_DATA11_MARK,
-	VI5_DATA12_MARK, VI5_DATA13_MARK,
-	VI5_DATA14_MARK, VI5_DATA15_MARK,
+static const union vin_data16 vin5_data_mux = {
+	.data16 = {
+		VI5_DATA0_MARK, VI5_DATA1_MARK,
+		VI5_DATA2_MARK, VI5_DATA3_MARK,
+		VI5_DATA4_MARK, VI5_DATA5_MARK,
+		VI5_DATA6_MARK, VI5_DATA7_MARK,
+		VI5_DATA8_MARK,  VI5_DATA9_MARK,
+		VI5_DATA10_MARK, VI5_DATA11_MARK,
+		VI5_DATA12_MARK, VI5_DATA13_MARK,
+		VI5_DATA14_MARK, VI5_DATA15_MARK,
+	},
 };
 static const unsigned int vin5_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -4468,10 +4430,10 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
 		SH_PFC_PIN_GROUP(vin4_clk),
-		SH_PFC_PIN_GROUP(vin5_data8),
-		SH_PFC_PIN_GROUP(vin5_data10),
-		SH_PFC_PIN_GROUP(vin5_data12),
-		SH_PFC_PIN_GROUP(vin5_data16),
+		VIN_DATA_PIN_GROUP(vin5_data, 8),
+		VIN_DATA_PIN_GROUP(vin5_data, 10),
+		VIN_DATA_PIN_GROUP(vin5_data, 12),
+		VIN_DATA_PIN_GROUP(vin5_data, 16),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
 		SH_PFC_PIN_GROUP(vin5_clkenb),
-- 
2.17.1

