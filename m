Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36450 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcLGQoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:37 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so28906731wma.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:36 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 1/3] clk: renesas: r8a7796: Add SCIF clocks
Date: Wed,  7 Dec 2016 17:44:25 +0100
Message-Id: <1481129067-21949-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 1c144b2..5ab8bed 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -110,6 +110,11 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif3",		 204,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif1",		 206,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif0",		 207,	R8A7796_CLK_S3D4),
 	DEF_MOD("cmt3",			 300,	R8A7796_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A7796_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A7796_CLK_R),
-- 
2.7.4
