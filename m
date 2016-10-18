Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58258 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934015AbcJRI0b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 04:26:31 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id C8E14207B6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2016 10:25:39 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] clk: renesas: r8a7796: Add DU and LVDS clocks
Date: Tue, 18 Oct 2016 11:26:21 +0300
Message-Id: <1476779181-31798-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476779181-31798-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476779181-31798-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Updated the DU* parent clocks to S2D1
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 679054658f99..c1af1ec1bcaa 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -134,6 +134,10 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("vspd0",		 623,	R8A7796_CLK_S0D2),
 	DEF_MOD("vspb",			 626,	R8A7796_CLK_S0D1),
 	DEF_MOD("vspi0",		 631,	R8A7796_CLK_S0D1),
+	DEF_MOD("du2",			 722,	R8A7796_CLK_S2D1),
+	DEF_MOD("du1",			 723,	R8A7796_CLK_S2D1),
+	DEF_MOD("du0",			 724,	R8A7796_CLK_S2D1),
+	DEF_MOD("lvds",			 727,	R8A7796_CLK_S0D4),
 	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S0D6),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
-- 
Regards,

Laurent Pinchart
