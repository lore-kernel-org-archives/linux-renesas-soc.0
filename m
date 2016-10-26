Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36290 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932115AbcJZOOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 10:14:22 -0400
Received: by mail-wm0-f65.google.com with SMTP id c17so1055436wmc.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2016 07:14:21 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 1/5] clk: renesas: r8a7796: Add I2C clocks
Date: Wed, 26 Oct 2016 16:14:05 +0200
Message-Id: <1477491249-2976-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
2.7.4
