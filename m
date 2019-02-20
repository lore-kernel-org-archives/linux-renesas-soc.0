Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3D7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 16:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CD3E2084D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 16:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfBTQKB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 11:10:01 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:31765 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725842AbfBTQKA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 11:10:00 -0500
X-IronPort-AV: E=Sophos;i="5.58,391,1544454000"; 
   d="scan'208";a="8395790"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Feb 2019 01:09:58 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.184])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C46DA4012D4D;
        Thu, 21 Feb 2019 01:09:56 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and functions
Date:   Wed, 20 Feb 2019 16:09:45 +0000
Message-Id: <1550678985-1316-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CANFD is found also on the R8A774A1, therefore move CANFD pin
groups and functions to "common".

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 7e33035..30d4ffc 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -4163,8 +4163,8 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[310];
-	struct sh_pfc_pin_group automotive[33];
+	struct sh_pfc_pin_group common[313];
+	struct sh_pfc_pin_group automotive[30];
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a_a),
@@ -4199,6 +4199,9 @@ static const struct {
 		SH_PFC_PIN_GROUP(can0_data_b),
 		SH_PFC_PIN_GROUP(can1_data),
 		SH_PFC_PIN_GROUP(can_clk),
+		SH_PFC_PIN_GROUP(canfd0_data_a),
+		SH_PFC_PIN_GROUP(canfd0_data_b),
+		SH_PFC_PIN_GROUP(canfd1_data),
 		SH_PFC_PIN_GROUP(du_rgb666),
 		SH_PFC_PIN_GROUP(du_rgb888),
 		SH_PFC_PIN_GROUP(du_clk_out_0),
@@ -4479,9 +4482,6 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin5_clk),
 	},
 	.automotive = {
-		SH_PFC_PIN_GROUP(canfd0_data_a),
-		SH_PFC_PIN_GROUP(canfd0_data_b),
-		SH_PFC_PIN_GROUP(canfd1_data),
 		SH_PFC_PIN_GROUP(drif0_ctrl_a),
 		SH_PFC_PIN_GROUP(drif0_data0_a),
 		SH_PFC_PIN_GROUP(drif0_data1_a),
@@ -5021,8 +5021,8 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[48];
-	struct sh_pfc_function automotive[6];
+	struct sh_pfc_function common[50];
+	struct sh_pfc_function automotive[4];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -5030,6 +5030,8 @@ static const struct {
 		SH_PFC_FUNCTION(can0),
 		SH_PFC_FUNCTION(can1),
 		SH_PFC_FUNCTION(can_clk),
+		SH_PFC_FUNCTION(canfd0),
+		SH_PFC_FUNCTION(canfd1),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(hdmi0),
 		SH_PFC_FUNCTION(hscif0),
@@ -5075,8 +5077,6 @@ static const struct {
 		SH_PFC_FUNCTION(vin5),
 	},
 	.automotive = {
-		SH_PFC_FUNCTION(canfd0),
-		SH_PFC_FUNCTION(canfd1),
 		SH_PFC_FUNCTION(drif0),
 		SH_PFC_FUNCTION(drif1),
 		SH_PFC_FUNCTION(drif2),
-- 
2.7.4

