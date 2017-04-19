Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35897 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968620AbdDSRtF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 13:49:05 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7796: Add PCIe clocks
Date: Thu, 20 Apr 2017 02:46:39 +0900
Message-Id: <1492624001-3758-19-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>

This patch adds PCIEC{0,1} clocks for R8A7796 SoC.

Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 64714ca..877fc75 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -137,6 +137,8 @@ enum clk_ids {
 	DEF_MOD("sdif1",		 313,	R8A7796_CLK_SD1),
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
 	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
+	DEF_MOD("pcie1",		 318,	R8A7796_CLK_S3D1),
+	DEF_MOD("pcie0",		 319,	R8A7796_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7796_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7796_CLK_S3D1),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
-- 
1.9.1
