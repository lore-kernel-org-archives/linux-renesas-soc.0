Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2719C43613
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC6832133F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732298AbfAKM1P (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:27:15 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:60222 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732319AbfAKM1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:27:14 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id P0TC1z00K3XaVaC010TCj1; Fri, 11 Jan 2019 13:27:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0006J7-KP; Fri, 11 Jan 2019 13:27:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvu4-0008R4-Is; Fri, 11 Jan 2019 13:27:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] pinctrl: sh-pfc: r8a77980: Deduplicate VIN1 pin definitions
Date:   Fri, 11 Jan 2019 13:27:05 +0100
Message-Id: <20190111122705.32365-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111122705.32365-1-geert+renesas@glider.be>
References: <20190111122705.32365-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use union vin_data12 and VIN_DATA_PIN_GROUP() to reduce redundancies in
pin definitions for the VIN1 channel.

This reduces kernel size by 144 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 64 +++++++++------------------
 1 file changed, 21 insertions(+), 43 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 8bef24502f0c608d..b807b67ae143e30b 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -1970,47 +1970,25 @@ static const unsigned int vin0_clk_mux[] = {
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
-	VI1_DATA8_MARK, VI1_DATA9_MARK,
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
 	/* VI1_VSYNC#, VI1_HSYNC# */
@@ -2182,9 +2160,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
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

