Return-Path: <SRS0=bfNf=QQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12833C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 11:02:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFA0221773
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 11:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUeWoNHm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfBILCq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Feb 2019 06:02:46 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38415 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfBILCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Feb 2019 06:02:46 -0500
Received: by mail-pl1-f196.google.com with SMTP id e5so2940627plb.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Feb 2019 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5Gu+QNL242dIA956iXotVB/jgl+JFwS2IaXraY73bfI=;
        b=YUeWoNHme9l7FdJkuOJm+sMfwafefwZsQe0zDbJrXGgBAgO1jbu9Q003+bOZLSNZT+
         9KlhF3iJFWcIOY0lumdGCGPNEfMCukRqOWPy/nWXXxbFD9ewOceksCoxEV7Pc5pvGgwm
         5eGm2GpPxJh69np1qgP5bU4LimrNaILnW738jW3L3ikSIbNpSWcBHv2CUFrYU/YC+mNd
         XO3sGCS+vfqVy4nuSEq7dC9s2xJn8RstZ1UyLpIe5ZQp3XFtIYE1ImCSmCIT9EYa0vrc
         9p/ycXMqSG16QunjPe/3cpmeIS5Z1TrgW3nNTM+H1co35R2AQuIp5FWDmIqa6BbVWd0P
         W9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5Gu+QNL242dIA956iXotVB/jgl+JFwS2IaXraY73bfI=;
        b=li5VgnZfeG7BonNDNtFweBQL51T/0yi8VAWnMLFtvv4Zfm4c9ajNGWm/ZrmhrImjkT
         fkbvxUar/3PkrZUu4rOYAXQiEdIK/J9Miz605bHDhgKjMz4xJatBq7Datx0Gta7ePvLP
         4OpHR23s1qy9L9NwOCKc9rtaJbKER5g3wbWVr9u4UDBiiE3lDHJduwenXg2+b9zQYGSw
         1/aoxeUtTCmAyH7ablCaerC1oLfQXvmc+OiJjN2DMW+1uEh5eVekd9r8oJ+tu2uopouB
         IRlYZOijhe48PqV7RRjcKNBeQrJsMOuhLAecuBjfT+nmB4HkNQ45ZcMHX1sAF9CJwEnc
         9pMw==
X-Gm-Message-State: AHQUAuZ+F6rW5uQHk/5bQ4KHFwA4iK06flVpOUKL49jHfu0Rdup/lnPk
        2vHsMcJnBeKGMUh/jXbGiphc6riQ
X-Google-Smtp-Source: AHgI3IaKZWbj/L5UWztLVGzEt/wvJF4JDipNLkzHZFJ8iZ8x95WKVFV6zolvja5+43J1l/1Ir00hRA==
X-Received: by 2002:a17:902:8d94:: with SMTP id v20mr27599811plo.194.1549710165009;
        Sat, 09 Feb 2019 03:02:45 -0800 (PST)
Received: from localhost.localdomain (p6779223-ipngn28001marunouchi.tokyo.ocn.ne.jp. [114.162.71.223])
        by smtp.gmail.com with ESMTPSA id f62sm5992426pgc.67.2019.02.09.03.02.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 09 Feb 2019 03:02:44 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH/RFT] pinctrl: sh-pfc: r8a77965: Add DRIF pins, groups and functions
Date:   Sat,  9 Feb 2019 20:02:32 +0900
Message-Id: <1549710152-19762-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds DRIF{0,1,2,3} pins, groups and functions to the R8A77965
SoC.

Based on a similar patch of the R8A7796 PFC driver
by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the sh-pfc branch of Geert Uytterhoeven's
renesas-drivers tree.

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 350 ++++++++++++++++++++++++++++++++++
 1 file changed, 350 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 7899ffd..14c4b67 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1850,6 +1850,280 @@ enum {
 	CANFD1_TX_MARK,         CANFD1_RX_MARK,
 };
 
+/* - DRIF0 --------------------------------------------------------------- */
+static const unsigned int drif0_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+};
+
+static const unsigned int drif0_ctrl_a_mux[] = {
+	RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK,
+};
+
+static const unsigned int drif0_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 10),
+};
+
+static const unsigned int drif0_data0_a_mux[] = {
+	RIF0_D0_A_MARK,
+};
+
+static const unsigned int drif0_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 7),
+};
+
+static const unsigned int drif0_data1_a_mux[] = {
+	RIF0_D1_A_MARK,
+};
+
+static const unsigned int drif0_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
+};
+
+static const unsigned int drif0_ctrl_b_mux[] = {
+	RIF0_CLK_B_MARK, RIF0_SYNC_B_MARK,
+};
+
+static const unsigned int drif0_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 1),
+};
+
+static const unsigned int drif0_data0_b_mux[] = {
+	RIF0_D0_B_MARK,
+};
+
+static const unsigned int drif0_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 2),
+};
+
+static const unsigned int drif0_data1_b_mux[] = {
+	RIF0_D1_B_MARK,
+};
+
+static const unsigned int drif0_ctrl_c_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 15),
+};
+
+static const unsigned int drif0_ctrl_c_mux[] = {
+	RIF0_CLK_C_MARK, RIF0_SYNC_C_MARK,
+};
+
+static const unsigned int drif0_data0_c_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 13),
+};
+
+static const unsigned int drif0_data0_c_mux[] = {
+	RIF0_D0_C_MARK,
+};
+
+static const unsigned int drif0_data1_c_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 14),
+};
+
+static const unsigned int drif0_data1_c_mux[] = {
+	RIF0_D1_C_MARK,
+};
+
+/* - DRIF1 --------------------------------------------------------------- */
+static const unsigned int drif1_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
+};
+
+static const unsigned int drif1_ctrl_a_mux[] = {
+	RIF1_CLK_A_MARK, RIF1_SYNC_A_MARK,
+};
+
+static const unsigned int drif1_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 19),
+};
+
+static const unsigned int drif1_data0_a_mux[] = {
+	RIF1_D0_A_MARK,
+};
+
+static const unsigned int drif1_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 20),
+};
+
+static const unsigned int drif1_data1_a_mux[] = {
+	RIF1_D1_A_MARK,
+};
+
+static const unsigned int drif1_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 3),
+};
+
+static const unsigned int drif1_ctrl_b_mux[] = {
+	RIF1_CLK_B_MARK, RIF1_SYNC_B_MARK,
+};
+
+static const unsigned int drif1_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 7),
+};
+
+static const unsigned int drif1_data0_b_mux[] = {
+	RIF1_D0_B_MARK,
+};
+
+static const unsigned int drif1_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 8),
+};
+
+static const unsigned int drif1_data1_b_mux[] = {
+	RIF1_D1_B_MARK,
+};
+
+static const unsigned int drif1_ctrl_c_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11),
+};
+
+static const unsigned int drif1_ctrl_c_mux[] = {
+	RIF1_CLK_C_MARK, RIF1_SYNC_C_MARK,
+};
+
+static const unsigned int drif1_data0_c_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 6),
+};
+
+static const unsigned int drif1_data0_c_mux[] = {
+	RIF1_D0_C_MARK,
+};
+
+static const unsigned int drif1_data1_c_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 10),
+};
+
+static const unsigned int drif1_data1_c_mux[] = {
+	RIF1_D1_C_MARK,
+};
+
+/* - DRIF2 --------------------------------------------------------------- */
+static const unsigned int drif2_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+};
+
+static const unsigned int drif2_ctrl_a_mux[] = {
+	RIF2_CLK_A_MARK, RIF2_SYNC_A_MARK,
+};
+
+static const unsigned int drif2_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 7),
+};
+
+static const unsigned int drif2_data0_a_mux[] = {
+	RIF2_D0_A_MARK,
+};
+
+static const unsigned int drif2_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 10),
+};
+
+static const unsigned int drif2_data1_a_mux[] = {
+	RIF2_D1_A_MARK,
+};
+
+static const unsigned int drif2_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
+};
+
+static const unsigned int drif2_ctrl_b_mux[] = {
+	RIF2_CLK_B_MARK, RIF2_SYNC_B_MARK,
+};
+
+static const unsigned int drif2_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 30),
+};
+
+static const unsigned int drif2_data0_b_mux[] = {
+	RIF2_D0_B_MARK,
+};
+
+static const unsigned int drif2_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 31),
+};
+
+static const unsigned int drif2_data1_b_mux[] = {
+	RIF2_D1_B_MARK,
+};
+
+/* - DRIF3 --------------------------------------------------------------- */
+static const unsigned int drif3_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
+};
+
+static const unsigned int drif3_ctrl_a_mux[] = {
+	RIF3_CLK_A_MARK, RIF3_SYNC_A_MARK,
+};
+
+static const unsigned int drif3_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 19),
+};
+
+static const unsigned int drif3_data0_a_mux[] = {
+	RIF3_D0_A_MARK,
+};
+
+static const unsigned int drif3_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 20),
+};
+
+static const unsigned int drif3_data1_a_mux[] = {
+	RIF3_D1_A_MARK,
+};
+
+static const unsigned int drif3_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
+};
+
+static const unsigned int drif3_ctrl_b_mux[] = {
+	RIF3_CLK_B_MARK, RIF3_SYNC_B_MARK,
+};
+
+static const unsigned int drif3_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 28),
+};
+
+static const unsigned int drif3_data0_b_mux[] = {
+	RIF3_D0_B_MARK,
+};
+
+static const unsigned int drif3_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 29),
+};
+
+static const unsigned int drif3_data1_b_mux[] = {
+	RIF3_D1_B_MARK,
+};
+
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -4073,6 +4347,36 @@ enum {
 	SH_PFC_PIN_GROUP(canfd0_data_a),
 	SH_PFC_PIN_GROUP(canfd0_data_b),
 	SH_PFC_PIN_GROUP(canfd1_data),
+	SH_PFC_PIN_GROUP(drif0_ctrl_a),
+	SH_PFC_PIN_GROUP(drif0_data0_a),
+	SH_PFC_PIN_GROUP(drif0_data1_a),
+	SH_PFC_PIN_GROUP(drif0_ctrl_b),
+	SH_PFC_PIN_GROUP(drif0_data0_b),
+	SH_PFC_PIN_GROUP(drif0_data1_b),
+	SH_PFC_PIN_GROUP(drif0_ctrl_c),
+	SH_PFC_PIN_GROUP(drif0_data0_c),
+	SH_PFC_PIN_GROUP(drif0_data1_c),
+	SH_PFC_PIN_GROUP(drif1_ctrl_a),
+	SH_PFC_PIN_GROUP(drif1_data0_a),
+	SH_PFC_PIN_GROUP(drif1_data1_a),
+	SH_PFC_PIN_GROUP(drif1_ctrl_b),
+	SH_PFC_PIN_GROUP(drif1_data0_b),
+	SH_PFC_PIN_GROUP(drif1_data1_b),
+	SH_PFC_PIN_GROUP(drif1_ctrl_c),
+	SH_PFC_PIN_GROUP(drif1_data0_c),
+	SH_PFC_PIN_GROUP(drif1_data1_c),
+	SH_PFC_PIN_GROUP(drif2_ctrl_a),
+	SH_PFC_PIN_GROUP(drif2_data0_a),
+	SH_PFC_PIN_GROUP(drif2_data1_a),
+	SH_PFC_PIN_GROUP(drif2_ctrl_b),
+	SH_PFC_PIN_GROUP(drif2_data0_b),
+	SH_PFC_PIN_GROUP(drif2_data1_b),
+	SH_PFC_PIN_GROUP(drif3_ctrl_a),
+	SH_PFC_PIN_GROUP(drif3_data0_a),
+	SH_PFC_PIN_GROUP(drif3_data1_a),
+	SH_PFC_PIN_GROUP(drif3_ctrl_b),
+	SH_PFC_PIN_GROUP(drif3_data0_b),
+	SH_PFC_PIN_GROUP(drif3_data1_b),
 	SH_PFC_PIN_GROUP(du_rgb666),
 	SH_PFC_PIN_GROUP(du_rgb888),
 	SH_PFC_PIN_GROUP(du_clk_out_0),
@@ -4407,6 +4711,48 @@ enum {
 	"canfd1_data",
 };
 
+static const char * const drif0_groups[] = {
+	"drif0_ctrl_a",
+	"drif0_data0_a",
+	"drif0_data1_a",
+	"drif0_ctrl_b",
+	"drif0_data0_b",
+	"drif0_data1_b",
+	"drif0_ctrl_c",
+	"drif0_data0_c",
+	"drif0_data1_c",
+};
+
+static const char * const drif1_groups[] = {
+	"drif1_ctrl_a",
+	"drif1_data0_a",
+	"drif1_data1_a",
+	"drif1_ctrl_b",
+	"drif1_data0_b",
+	"drif1_data1_b",
+	"drif1_ctrl_c",
+	"drif1_data0_c",
+	"drif1_data1_c",
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
@@ -4810,6 +5156,10 @@ enum {
 	SH_PFC_FUNCTION(can_clk),
 	SH_PFC_FUNCTION(canfd0),
 	SH_PFC_FUNCTION(canfd1),
+	SH_PFC_FUNCTION(drif0),
+	SH_PFC_FUNCTION(drif1),
+	SH_PFC_FUNCTION(drif2),
+	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
-- 
1.9.1

