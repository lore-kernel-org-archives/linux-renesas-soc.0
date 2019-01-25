Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5ECC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 18:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 812B2218B0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 18:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtxEn0T1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfAYSCu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 13:02:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37676 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfAYSCu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 13:02:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id c25so4511265pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Jan 2019 10:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ga+38ODAbRHYv5zJ4K1vSX2g/LaflDELqe2lYf7zPCs=;
        b=VtxEn0T1wfzkSVNwxr75hUj55qQ9NY1GqU67WBjgvvvOaWSFBdETPKXaEYLNak3oVZ
         D5P7M+XaCF5XQp4rFDE48QH4sZVSNhJImxdZ4wTsSngRs7lj8FKTAHoe6r+AN5tlUsb5
         sU8Eg1zYFbPCier99hhGPlEL7mrzMHOm/6El7tjV+L4w0NbPhZoeuf2Pk/599zpo7buZ
         cw08hAF5SNK/D8ukdYqP8PkYZIjsxIMFV32nLqoGN+vPl72PL33BHAWxKX7P0pdBJ8FH
         FiEAvOsVUtgyTlcB7MWugP2cFqxNxTeFuMURWJQXOE89+TqSlhvGRgy5hK7/hGIcQ6SY
         VPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ga+38ODAbRHYv5zJ4K1vSX2g/LaflDELqe2lYf7zPCs=;
        b=Zdx4AQwMgwWGa+tGn1CGvEPOcqMcmW/C3u8okqU9A+asgjkwCpFWSjPc+0CG30EE8P
         BEIXpILMcs+znJiTIdHC/4S3/ADa61uYq5fFKy8C6KkFBqOYIs9FTXX4pMie0AmdJKad
         01DOkaDUTSP8LuFTKzUSivmuZBYrCokAgidra8z6PKyDcZkQQ9JoVrCajAeafIUTKPpn
         /vMaXFysoijZC9EzRo9mSTz95aC2Z1BgIXHEb03uhDR0/g7e9jgwNaAG8HEzOeXr6tYv
         +tE2x4/2AFOCa6ftoDAyWW9FgxD06ZvOzjVviw4BuHYLISB4qfLc9j7mRZlbUZhmSi/p
         eq9Q==
X-Gm-Message-State: AJcUukf18R2aGnWjDPct4LF39yWZ+DAvbV30fBqHYBpEaB1N8k5n2lZs
        sOBrtnITjEmpNOZQq9/qYspKZC9d
X-Google-Smtp-Source: ALg8bN5Uimfd3biUkMvWyYMMot7x3Ube8QznRUj8xGOliztmWfq0+1sE71BScpMqUUbidE0T7ZMrWw==
X-Received: by 2002:a63:61d5:: with SMTP id v204mr10809906pgb.439.1548439368698;
        Fri, 25 Jan 2019 10:02:48 -0800 (PST)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id b9sm32009675pfi.118.2019.01.25.10.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:02:47 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH/RFT v2] pinctrl: sh-pfc: r8a77990: Add DRIF pins, groups and functions
Date:   Sat, 26 Jan 2019 03:01:44 +0900
Message-Id: <1548439304-18908-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds DRIF{0,1,2,3} pins, groups and functions to the R8A77990
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

This patch is based on the sh-pfc branch of Geert Uytterhoeven's
renesas-drivers tree.

v2 [Yoshihiro Kaneko]
* As suggested by Geert Uytterhoeven
  - added DRIF pin groups and pin functions to the automotive section
    instead of the common section.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 255 +++++++++++++++++++++++++++++++++-
 1 file changed, 253 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 0a9aa62..151640c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1599,6 +1599,199 @@ enum {
 	CANFD1_TX_MARK, CANFD1_RX_MARK,
 };
 
+/* - DRIF0 --------------------------------------------------------------- */
+static const unsigned int drif0_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 19),
+};
+
+static const unsigned int drif0_ctrl_a_mux[] = {
+	RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK,
+};
+
+static const unsigned int drif0_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 17),
+};
+
+static const unsigned int drif0_data0_a_mux[] = {
+	RIF0_D0_A_MARK,
+};
+
+static const unsigned int drif0_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 18),
+};
+
+static const unsigned int drif0_data1_a_mux[] = {
+	RIF0_D1_A_MARK,
+};
+
+static const unsigned int drif0_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 15),
+};
+
+static const unsigned int drif0_ctrl_b_mux[] = {
+	RIF0_CLK_B_MARK, RIF0_SYNC_B_MARK,
+};
+
+static const unsigned int drif0_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(3, 13),
+};
+
+static const unsigned int drif0_data0_b_mux[] = {
+	RIF0_D0_B_MARK,
+};
+
+static const unsigned int drif0_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(3, 14),
+};
+
+static const unsigned int drif0_data1_b_mux[] = {
+	RIF0_D1_B_MARK,
+};
+
+/* - DRIF1 --------------------------------------------------------------- */
+static const unsigned int drif1_ctrl_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 1),
+};
+
+static const unsigned int drif1_ctrl_mux[] = {
+	RIF1_CLK_MARK, RIF1_SYNC_MARK,
+};
+
+static const unsigned int drif1_data0_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 2),
+};
+
+static const unsigned int drif1_data0_mux[] = {
+	RIF1_D0_MARK,
+};
+
+static const unsigned int drif1_data1_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 3),
+};
+
+static const unsigned int drif1_data1_mux[] = {
+	RIF1_D1_MARK,
+};
+
+/* - DRIF2 --------------------------------------------------------------- */
+static const unsigned int drif2_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+};
+
+static const unsigned int drif2_ctrl_a_mux[] = {
+	RIF2_CLK_A_MARK, RIF2_SYNC_A_MARK,
+};
+
+static const unsigned int drif2_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(2, 8),
+};
+
+static const unsigned int drif2_data0_a_mux[] = {
+	RIF2_D0_A_MARK,
+};
+
+static const unsigned int drif2_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(2, 9),
+};
+
+static const unsigned int drif2_data1_a_mux[] = {
+	RIF2_D1_A_MARK,
+};
+
+static const unsigned int drif2_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+};
+
+static const unsigned int drif2_ctrl_b_mux[] = {
+	RIF2_CLK_B_MARK, RIF2_SYNC_B_MARK,
+};
+
+static const unsigned int drif2_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(1, 6),
+};
+
+static const unsigned int drif2_data0_b_mux[] = {
+	RIF2_D0_B_MARK,
+};
+
+static const unsigned int drif2_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(1, 7),
+};
+
+static const unsigned int drif2_data1_b_mux[] = {
+	RIF2_D1_B_MARK,
+};
+
+/* - DRIF3 --------------------------------------------------------------- */
+static const unsigned int drif3_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+};
+
+static const unsigned int drif3_ctrl_a_mux[] = {
+	RIF3_CLK_A_MARK, RIF3_SYNC_A_MARK,
+};
+
+static const unsigned int drif3_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(2, 12),
+};
+
+static const unsigned int drif3_data0_a_mux[] = {
+	RIF3_D0_A_MARK,
+};
+
+static const unsigned int drif3_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(2, 13),
+};
+
+static const unsigned int drif3_data1_a_mux[] = {
+	RIF3_D1_A_MARK,
+};
+
+static const unsigned int drif3_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+};
+
+static const unsigned int drif3_ctrl_b_mux[] = {
+	RIF3_CLK_B_MARK, RIF3_SYNC_B_MARK,
+};
+
+static const unsigned int drif3_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(0, 10),
+};
+
+static const unsigned int drif3_data0_b_mux[] = {
+	RIF3_D0_B_MARK,
+};
+
+static const unsigned int drif3_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(0, 11),
+};
+
+static const unsigned int drif3_data1_b_mux[] = {
+	RIF3_D1_B_MARK,
+};
+
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -3574,7 +3767,7 @@ enum {
 
 static const struct {
 	struct sh_pfc_pin_group common[245];
-	struct sh_pfc_pin_group automotive[2];
+	struct sh_pfc_pin_group automotive[23];
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a),
@@ -3826,6 +4019,27 @@ enum {
 	.automotive = {
 		SH_PFC_PIN_GROUP(canfd0_data),
 		SH_PFC_PIN_GROUP(canfd1_data),
+		SH_PFC_PIN_GROUP(drif0_ctrl_a),
+		SH_PFC_PIN_GROUP(drif0_data0_a),
+		SH_PFC_PIN_GROUP(drif0_data1_a),
+		SH_PFC_PIN_GROUP(drif0_ctrl_b),
+		SH_PFC_PIN_GROUP(drif0_data0_b),
+		SH_PFC_PIN_GROUP(drif0_data1_b),
+		SH_PFC_PIN_GROUP(drif1_ctrl),
+		SH_PFC_PIN_GROUP(drif1_data0),
+		SH_PFC_PIN_GROUP(drif1_data1),
+		SH_PFC_PIN_GROUP(drif2_ctrl_a),
+		SH_PFC_PIN_GROUP(drif2_data0_a),
+		SH_PFC_PIN_GROUP(drif2_data1_a),
+		SH_PFC_PIN_GROUP(drif2_ctrl_b),
+		SH_PFC_PIN_GROUP(drif2_data0_b),
+		SH_PFC_PIN_GROUP(drif2_data1_b),
+		SH_PFC_PIN_GROUP(drif3_ctrl_a),
+		SH_PFC_PIN_GROUP(drif3_data0_a),
+		SH_PFC_PIN_GROUP(drif3_data1_a),
+		SH_PFC_PIN_GROUP(drif3_ctrl_b),
+		SH_PFC_PIN_GROUP(drif3_data0_b),
+		SH_PFC_PIN_GROUP(drif3_data1_b),
 	}
 };
 
@@ -3880,6 +4094,39 @@ enum {
 	"canfd1_data",
 };
 
+static const char * const drif0_groups[] = {
+	"drif0_ctrl_a",
+	"drif0_data0_a",
+	"drif0_data1_a",
+	"drif0_ctrl_b",
+	"drif0_data0_b",
+	"drif0_data1_b",
+};
+
+static const char * const drif1_groups[] = {
+	"drif1_ctrl",
+	"drif1_data0",
+	"drif1_data1",
+};
+
+static const char * const drif2_groups[] = {
+	"drif2_ctrl_a",
+	"drif2_data0_a",
+	"drif2_data1_a",
+	"drif2_ctrl_b",
+	"drif2_data0_b",
+	"drif2_data1_b",
+};
+
+static const char * const drif3_groups[] = {
+	"drif3_ctrl_a",
+	"drif3_data0_a",
+	"drif3_data1_a",
+	"drif3_ctrl_b",
+	"drif3_data0_b",
+	"drif3_data1_b",
+};
+
 static const char * const du_groups[] = {
 	"du_rgb666",
 	"du_rgb888",
@@ -4219,7 +4466,7 @@ enum {
 
 static const struct {
 	struct sh_pfc_function common[45];
-	struct sh_pfc_function automotive[2];
+	struct sh_pfc_function automotive[6];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -4271,6 +4518,10 @@ enum {
 	.automotive = {
 		SH_PFC_FUNCTION(canfd0),
 		SH_PFC_FUNCTION(canfd1),
+		SH_PFC_FUNCTION(drif0),
+		SH_PFC_FUNCTION(drif1),
+		SH_PFC_FUNCTION(drif2),
+		SH_PFC_FUNCTION(drif3),
 	}
 };
 
-- 
1.9.1

