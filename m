Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35285 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759540AbcINQqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:01 -0400
Received: by mail-wm0-f66.google.com with SMTP id 133so1329299wmq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:01 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/3] clk: renesas: r8a7796: Add SYS-DMAC clocks
Date: Wed, 14 Sep 2016 18:45:47 +0200
Message-Id: <20160914164549.31121-2-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index eb347ed..c02fe34 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -109,6 +109,9 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S3D1),
+	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S3D1),
 	DEF_MOD("cmt3",			 300,	R8A7796_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A7796_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A7796_CLK_R),
-- 
2.9.3
