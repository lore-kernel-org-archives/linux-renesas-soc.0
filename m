Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33190 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcLGQoz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:55 -0500
Received: by mail-wm0-f67.google.com with SMTP id u144so28872321wmu.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:54 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 1/4] clk: shmobile: r8a7796: Add HSCIF clocks
Date: Wed,  7 Dec 2016 17:44:45 +0100
Message-Id: <1481129088-22026-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 1c144b2..d25bfd4 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -121,6 +121,11 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
 	DEF_MOD("rwdt0",		 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
+	DEF_MOD("hscif4",		 516,	R8A7796_CLK_S3D1),
+	DEF_MOD("hscif3",		 517,	R8A7796_CLK_S3D1),
+	DEF_MOD("hscif2",		 518,	R8A7796_CLK_S3D1),
+	DEF_MOD("hscif1",		 519,	R8A7796_CLK_S3D1),
+	DEF_MOD("hscif0",		 520,	R8A7796_CLK_S3D1),
 	DEF_MOD("thermal",		 522,	R8A7796_CLK_CP),
 	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S0D6),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
-- 
2.7.4
