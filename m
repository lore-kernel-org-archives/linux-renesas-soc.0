Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE10C43444
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FF7820657
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YswFs2nB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbfAOMBW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 07:01:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37343 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729292AbfAOMBW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 07:01:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id c25so1175011pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jan 2019 04:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nah9smJ21u58Fdx4tK+esoccSNXx/fgsw1VkSjgy5J8=;
        b=YswFs2nBR+GOu5uemKj+C5FQI2XECAMu+JpdQ+YPwnhfIDW8gP2LPonhW2nye4dHJm
         sNapZ++O90UIaSZ9mJlo03lZejGOc7tw/UH4cIDTD9JFf1zxDXRQQeiOuxnGL3CuObVJ
         +qiYXobX2SytL7sY/nKthef/I3DpDR74F6SPNBtgDb8VHJcZURV74HAuQA0J4kX7dTFT
         2Q3zksH2/QOUfHt+MqyCK3cwBn/n7VpW9Xegj8SaeqK3Yl3+he2s81XzixrWrQDK5+tF
         ZD9C9Ea3fW1nBM2WHHKcs23+4sqNDqlqCb3rYv3ZSslrm5wYIfW0ajiZxsTIY0ZkRypb
         9ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nah9smJ21u58Fdx4tK+esoccSNXx/fgsw1VkSjgy5J8=;
        b=QXeJ0eprY2bPmBEuS76V9O5ruPo8ChvKYp/TvVHbXh+G8OSXkxkE6jElXJwRlkxxbS
         epy0CkKJXPo4+4OyPF+NnsZRNTaVful+TX9qt0Y29aGQbTof88QTWThdzVqo//YCaq6v
         7YnEWbjmzUVGDAmZ5TXf3/dXZhpmt4b7y3BfSLxifxI14n5Bz+L/HsfjADueZMl8qgwC
         us93F0gAfJbTXxzHAnT51OhrMspxLgs+8PmYCfzMMLaucLUeNl4rO1Dm8Q7hRTFDfCfA
         9JJJvUFltZ2JfMvv7k2e47/lKfqgJy9uqQbHMCcbWYjLTIzifDVW0tERJYgjcRXla5Lx
         VI8A==
X-Gm-Message-State: AJcUukcXAEDFCvizJejg/oxcbdNRc/xNT8RmkJNjJjCWHudgHNPBm8f1
        DKYMXad80dBGzaKK2f7ZYFbzuSKz
X-Google-Smtp-Source: ALg8bN42CKMCwt613sEwTePncO5N5vVAv3BUYsGHs/cu1dZZlDoBOXc7jsLgF1BHSQAUyTT12ZIyIQ==
X-Received: by 2002:a63:4e41:: with SMTP id o1mr3636100pgl.282.1547553680839;
        Tue, 15 Jan 2019 04:01:20 -0800 (PST)
Received: from localhost.localdomain (p7732116-ipngn36501marunouchi.tokyo.ocn.ne.jp. [114.158.79.116])
        by smtp.gmail.com with ESMTPSA id y184sm3526080pgd.71.2019.01.15.04.01.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 15 Jan 2019 04:01:20 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add DRIF pins, groups and functions
Date:   Tue, 15 Jan 2019 21:01:08 +0900
Message-Id: <1547553668-4359-1-git-send-email-ykaneko0929@gmail.com>
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
---

This patch is based on the sh-pfc branch of Geert Uytterhoeven's
renesas-drivers tree.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 255 +++++++++++++++++++++++++++++++++-
 1 file changed, 253 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index e40908d..5fc50f4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1586,6 +1586,199 @@ enum {
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
@@ -3523,7 +3716,7 @@ enum {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[241];
+	struct sh_pfc_pin_group common[262];
 	struct sh_pfc_pin_group automotive[2];
 } pinmux_groups = {
 	.common = {
@@ -3555,6 +3748,27 @@ enum {
 		SH_PFC_PIN_GROUP(can0_data),
 		SH_PFC_PIN_GROUP(can1_data),
 		SH_PFC_PIN_GROUP(can_clk),
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
 		SH_PFC_PIN_GROUP(du_rgb666),
 		SH_PFC_PIN_GROUP(du_rgb888),
 		SH_PFC_PIN_GROUP(du_clk_in_0),
@@ -3826,6 +4040,39 @@ enum {
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
@@ -4157,7 +4404,7 @@ enum {
 };
 
 static const struct {
-	struct sh_pfc_function common[44];
+	struct sh_pfc_function common[48];
 	struct sh_pfc_function automotive[2];
 } pinmux_functions = {
 	.common = {
@@ -4166,6 +4413,10 @@ enum {
 		SH_PFC_FUNCTION(can0),
 		SH_PFC_FUNCTION(can1),
 		SH_PFC_FUNCTION(can_clk),
+		SH_PFC_FUNCTION(drif0),
+		SH_PFC_FUNCTION(drif1),
+		SH_PFC_FUNCTION(drif2),
+		SH_PFC_FUNCTION(drif3),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(hscif0),
 		SH_PFC_FUNCTION(hscif1),
-- 
1.9.1

