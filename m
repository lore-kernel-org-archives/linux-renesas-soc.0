Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36530 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751168AbcINQqV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:21 -0400
Received: by mail-wm0-f67.google.com with SMTP id b184so3386296wma.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:20 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/6] clk: renesas: r8a7796: Add I2C clocks
Date: Wed, 14 Sep 2016 18:46:07 +0200
Message-Id: <20160914164611.31237-3-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c02fe34..d851c42 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -133,6 +133,13 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("gpio2",		 910,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio1",		 911,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio0",		 912,	R8A7796_CLK_S3D4),
+	DEF_MOD("i2c6",			 918,	R8A7796_CLK_S0D6),
+	DEF_MOD("i2c5",			 919,	R8A7796_CLK_S0D6),
+	DEF_MOD("i2c4",			 927,	R8A7796_CLK_S0D6),
+	DEF_MOD("i2c3",			 928,	R8A7796_CLK_S0D6),
+	DEF_MOD("i2c2",			 929,	R8A7796_CLK_S3D2),
+	DEF_MOD("i2c1",			 930,	R8A7796_CLK_S3D2),
+	DEF_MOD("i2c0",			 931,	R8A7796_CLK_S3D2),
 };
 
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
-- 
2.9.3
