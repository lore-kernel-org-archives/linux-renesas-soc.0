Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:35352 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968769AbdDSRsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 13:48:05 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7796: Add USB-DMAC clocks
Date: Thu, 20 Apr 2017 02:46:29 +0900
Message-Id: <1492624001-3758-9-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds USB-DMAC{0,1} clocks for R8A7796 SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index f217796..27afd48 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -137,6 +137,8 @@ enum clk_ids {
 	DEF_MOD("sdif1",		 313,	R8A7796_CLK_SD1),
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
 	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
+	DEF_MOD("usb-dmac0",		 330,	R8A7796_CLK_S3D1),
+	DEF_MOD("usb-dmac1",		 331,	R8A7796_CLK_S3D1),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S3D4),
-- 
1.9.1
