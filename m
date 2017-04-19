Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:34098 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968651AbdDSRtB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 13:49:01 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7796: add PWM clock
Date: Thu, 20 Apr 2017 02:46:38 +0900
Message-Id: <1492624001-3758-18-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ryo Kodama <ryo.kodama.vz@renesas.com>

This patch adds PWM clock for PWM.

Signed-off-by: Ryo Kodama <ryo.kodama.vz@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c5523aa..64714ca 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -156,6 +156,7 @@ enum clk_ids {
 	DEF_MOD("hscif1",		 519,	R8A7796_CLK_S3D1),
 	DEF_MOD("hscif0",		 520,	R8A7796_CLK_S3D1),
 	DEF_MOD("thermal",		 522,	R8A7796_CLK_CP),
+	DEF_MOD("pwm",			 523,	R8A7796_CLK_S3D4),
 	DEF_MOD("fcpvd2",		 601,	R8A7796_CLK_S0D2),
 	DEF_MOD("fcpvd1",		 602,	R8A7796_CLK_S0D2),
 	DEF_MOD("fcpvd0",		 603,	R8A7796_CLK_S0D2),
-- 
1.9.1
