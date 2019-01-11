Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213BDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E349120872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732445AbfAKMpa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:45:30 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:60876 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732439AbfAKMp3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:45:29 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id P0lP1z00s3XaVaC010lQjr; Fri, 11 Jan 2019 13:45:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghwBf-0006R1-R7; Fri, 11 Jan 2019 13:45:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghwBf-0000iq-Nj; Fri, 11 Jan 2019 13:45:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] pinctrl: sh-pfc: r8a7791: Fix VIN1 versioned groups
Date:   Fri, 11 Jan 2019 13:45:17 +0100
Message-Id: <20190111124517.2730-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The naming of the "b" versions of the VIN1 pin groups is a bit odd, in
that the "_b" appears in the middle of the names, instead of as a
suffix.

Increase consistency with other SoCs by making R-Car M2-W and M2-N, and
RZ/G1M and RZ/G1N, use the recently added optional "version" argument of
the VIN_DATA_PIN_GROUP() macro.

Note that this breaks backwards compatibility with existing DTBs, but
there are no upstream users of the "vin1_b_*" names.

Fixes: 8e32c9671f84acd8 ("pinctrl: sh-pfc: r8a7791: Add VIN pins")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is it worth making this change?
If yes, should we retain backwards-compatibility using e.g. the patch
below, increasing kernel size by 380 bytes?

Note that unlike the deprecated "avb_mdc" pin groups on R-Car Gen3, the
"vin1_b_*" groups never had upstream users, so I'm inclined not to care
about backwards compatibility.

	diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
	index 25a3dff77e6fa06f..48935495276a16ae 100644
	--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
	+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
	@@ -4450,7 +4450,7 @@ static const unsigned int vin2_clk_mux[] = {
	 };

	 static const struct {
	-	struct sh_pfc_pin_group common[346];
	+	struct sh_pfc_pin_group common[357];
		struct sh_pfc_pin_group automotive[9];
	 } pinmux_groups = {
		.common = {
	@@ -4795,6 +4795,18 @@ static const struct {
			SH_PFC_PIN_GROUP(vin1_field_b),
			SH_PFC_PIN_GROUP(vin1_clkenb_b),
			SH_PFC_PIN_GROUP(vin1_clk_b),
	+		/* The "vin1_b_*" groups are deprecated */
	+		VIN_DATA_PIN_GROUP_ALIAS(vin1_b_data, vin1_data, 24, _b),
	+		VIN_DATA_PIN_GROUP_ALIAS(vin1_b_data, vin1_data, 20, _b),
	+		SH_PFC_PIN_GROUP_ALIAS(vin1_b_data18, vin1_data18_b),
	+		VIN_DATA_PIN_GROUP_ALIAS(vin1_b_data, vin1_data, 16, _b),
	+		VIN_DATA_PIN_GROUP_ALIAS(vin1_b_data, vin1_data, 12, _b),
	+		VIN_DATA_PIN_GROUP_ALIAS(vin1_b_data, vin1_data, 10, _b),
	+		VIN_DATA_PIN_GROUP_ALIAS(vin1_b_data, vin1_data, 8, _b),
	+		SH_PFC_PIN_GROUP_ALIAS(vin1_b_sync, vin1_sync_b),
	+		SH_PFC_PIN_GROUP_ALIAS(vin1_b_field, vin1_field_b),
	+		SH_PFC_PIN_GROUP_ALIAS(vin1_b_clkenb, vin1_clkenb_b),
	+		SH_PFC_PIN_GROUP_ALIAS(vin1_b_clk, vin1_clk_b),
			SH_PFC_PIN_GROUP(vin2_data8),
			SH_PFC_PIN_GROUP(vin2_sync),
			SH_PFC_PIN_GROUP(vin2_field),
	@@ -5346,6 +5358,17 @@ static const char * const vin1_groups[] = {
		"vin1_field_b",
		"vin1_clkenb_b",
		"vin1_clk_b",
	+	"vin1_b_data24",	/* Deprecated, please use "vin1_data24_b" */
	+	"vin1_b_data20",	/* Deprecated, please use "vin1_data20_b" */
	+	"vin1_b_data18",	/* Deprecated, please use "vin1_data18_b" */
	+	"vin1_b_data16",	/* Deprecated, please use "vin1_data16_b" */
	+	"vin1_b_data12",	/* Deprecated, please use "vin1_data12_b" */
	+	"vin1_b_data10",	/* Deprecated, please use "vin1_data10_b" */
	+	"vin1_b_data8",		/* Deprecated, please use "vin1_data8_b" */
	+	"vin1_b_sync",		/* Deprecated, please use "vin1_sync_b" */
	+	"vin1_b_field",		/* Deprecated, please use "vin1_field_b" */
	+	"vin1_b_clkenb",	/* Deprecated, please use "vin1_clkenb_b" */
	+	"vin1_b_clk",		/* Deprecated, please use "vin1_clk_b" */
	 };

	 static const char * const vin2_groups[] = {
	diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
	index 3ccd3b61e94aa028..293b3963c63b9295 100644
	--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
	+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
	@@ -67,6 +67,14 @@ struct sh_pfc_pin_group {
			.nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),	\
		}

	+#define VIN_DATA_PIN_GROUP_ALIAS(alias, n, s, ...)			\
	+	{								\
	+		.name = #alias,						\
	+		.pins = n##__VA_ARGS__##_pins.data##s,			\
	+		.mux = n##__VA_ARGS__##_mux.data##s,			\
	+		.nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),	\
	+	}
	+
	 union vin_data12 {
		unsigned int data12[12];
		unsigned int data10[10];
---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 68 ++++++++++++++--------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 2859231aaffc4546..bd363f2e196fcc26 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -4317,7 +4317,7 @@ static const unsigned int vin1_clk_pins[] = {
 static const unsigned int vin1_clk_mux[] = {
 	VI1_CLK_MARK,
 };
-static const union vin_data vin1_b_data_pins = {
+static const union vin_data vin1_data_b_pins = {
 	.data24 = {
 		/* B */
 		RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
@@ -4336,7 +4336,7 @@ static const union vin_data vin1_b_data_pins = {
 		RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
 	},
 };
-static const union vin_data vin1_b_data_mux = {
+static const union vin_data vin1_data_b_mux = {
 	.data24 = {
 		/* B */
 		VI1_DATA0_B_MARK, VI1_DATA1_B_MARK,
@@ -4355,7 +4355,7 @@ static const union vin_data vin1_b_data_mux = {
 		VI1_R6_B_MARK, VI1_R7_B_MARK,
 	},
 };
-static const unsigned int vin1_b_data18_pins[] = {
+static const unsigned int vin1_data18_b_pins[] = {
 	/* B */
 	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
 	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
@@ -4369,7 +4369,7 @@ static const unsigned int vin1_b_data18_pins[] = {
 	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
 	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
 };
-static const unsigned int vin1_b_data18_mux[] = {
+static const unsigned int vin1_data18_b_mux[] = {
 	/* B */
 	VI1_DATA2_B_MARK, VI1_DATA3_B_MARK,
 	VI1_DATA4_B_MARK, VI1_DATA5_B_MARK,
@@ -4383,30 +4383,30 @@ static const unsigned int vin1_b_data18_mux[] = {
 	VI1_R4_B_MARK, VI1_R5_B_MARK,
 	VI1_R6_B_MARK, VI1_R7_B_MARK,
 };
-static const unsigned int vin1_b_sync_pins[] = {
+static const unsigned int vin1_sync_b_pins[] = {
 	RCAR_GP_PIN(3, 17), /* HSYNC */
 	RCAR_GP_PIN(3, 18), /* VSYNC */
 };
-static const unsigned int vin1_b_sync_mux[] = {
+static const unsigned int vin1_sync_b_mux[] = {
 	VI1_HSYNC_N_B_MARK,
 	VI1_VSYNC_N_B_MARK,
 };
-static const unsigned int vin1_b_field_pins[] = {
+static const unsigned int vin1_field_b_pins[] = {
 	RCAR_GP_PIN(3, 20),
 };
-static const unsigned int vin1_b_field_mux[] = {
+static const unsigned int vin1_field_b_mux[] = {
 	VI1_FIELD_B_MARK,
 };
-static const unsigned int vin1_b_clkenb_pins[] = {
+static const unsigned int vin1_clkenb_b_pins[] = {
 	RCAR_GP_PIN(3, 19),
 };
-static const unsigned int vin1_b_clkenb_mux[] = {
+static const unsigned int vin1_clkenb_b_mux[] = {
 	VI1_CLKENB_B_MARK,
 };
-static const unsigned int vin1_b_clk_pins[] = {
+static const unsigned int vin1_clk_b_pins[] = {
 	RCAR_GP_PIN(3, 16),
 };
-static const unsigned int vin1_b_clk_mux[] = {
+static const unsigned int vin1_clk_b_mux[] = {
 	VI1_CLK_B_MARK,
 };
 /* - VIN2 ----------------------------------------------------------------- */
@@ -4784,17 +4784,17 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin1_field),
 		SH_PFC_PIN_GROUP(vin1_clkenb),
 		SH_PFC_PIN_GROUP(vin1_clk),
-		VIN_DATA_PIN_GROUP(vin1_b_data, 24),
-		VIN_DATA_PIN_GROUP(vin1_b_data, 20),
-		SH_PFC_PIN_GROUP(vin1_b_data18),
-		VIN_DATA_PIN_GROUP(vin1_b_data, 16),
-		VIN_DATA_PIN_GROUP(vin1_b_data, 12),
-		VIN_DATA_PIN_GROUP(vin1_b_data, 10),
-		VIN_DATA_PIN_GROUP(vin1_b_data, 8),
-		SH_PFC_PIN_GROUP(vin1_b_sync),
-		SH_PFC_PIN_GROUP(vin1_b_field),
-		SH_PFC_PIN_GROUP(vin1_b_clkenb),
-		SH_PFC_PIN_GROUP(vin1_b_clk),
+		VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
+		SH_PFC_PIN_GROUP(vin1_data18_b),
+		VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
+		SH_PFC_PIN_GROUP(vin1_sync_b),
+		SH_PFC_PIN_GROUP(vin1_field_b),
+		SH_PFC_PIN_GROUP(vin1_clkenb_b),
+		SH_PFC_PIN_GROUP(vin1_clk_b),
 		SH_PFC_PIN_GROUP(vin2_data8),
 		SH_PFC_PIN_GROUP(vin2_sync),
 		SH_PFC_PIN_GROUP(vin2_field),
@@ -5335,17 +5335,17 @@ static const char * const vin1_groups[] = {
 	"vin1_field",
 	"vin1_clkenb",
 	"vin1_clk",
-	"vin1_b_data24",
-	"vin1_b_data20",
-	"vin1_b_data18",
-	"vin1_b_data16",
-	"vin1_b_data12",
-	"vin1_b_data10",
-	"vin1_b_data8",
-	"vin1_b_sync",
-	"vin1_b_field",
-	"vin1_b_clkenb",
-	"vin1_b_clk",
+	"vin1_data24_b",
+	"vin1_data20_b",
+	"vin1_data18_b",
+	"vin1_data16_b",
+	"vin1_data12_b",
+	"vin1_data10_b",
+	"vin1_data8_b",
+	"vin1_sync_b",
+	"vin1_field_b",
+	"vin1_clkenb_b",
+	"vin1_clk_b",
 };
 
 static const char * const vin2_groups[] = {
-- 
2.17.1

