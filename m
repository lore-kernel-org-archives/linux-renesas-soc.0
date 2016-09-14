Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35860 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759045AbcINQqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:55 -0400
Received: by mail-wm0-f65.google.com with SMTP id b184so3388302wma.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:55 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/3] clk: shmobile: r8a7796: Add SCIF clocks
Date: Wed, 14 Sep 2016 18:46:46 +0200
Message-Id: <20160914164648.31403-2-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164648.31403-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164648.31403-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 5cabcaa..2c1f597 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -109,6 +109,11 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif3",		 204,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif1",		 206,	R8A7796_CLK_S3D4),
+	DEF_MOD("scif0",		 207,	R8A7796_CLK_S3D4),
 	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S3D1),
-- 
2.9.3
