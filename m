Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45175 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938383AbcJVL3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Oct 2016 07:29:12 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 5711220091
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Oct 2016 13:28:19 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] clk: renesas: r8a7796: Add FCP clocks
Date: Sat, 22 Oct 2016 14:29:04 +0300
Message-Id: <1477135746-7144-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1477135746-7144-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1477135746-7144-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v2:

- Fixed fcpci0 and fcpcs parent clocks to match the BSP
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index eb347ed265f2..a02525143eb8 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -121,6 +121,14 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("rwdt0",		 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
 	DEF_MOD("thermal",		 522,	R8A7796_CLK_CP),
+	DEF_MOD("fcpvd2",		 601,	R8A7796_CLK_S0D2),
+	DEF_MOD("fcpvd1",		 602,	R8A7796_CLK_S0D2),
+	DEF_MOD("fcpvd0",		 603,	R8A7796_CLK_S0D2),
+	DEF_MOD("fcpvb0",		 607,	R8A7796_CLK_S0D1),
+	DEF_MOD("fcpvi0",		 611,	R8A7796_CLK_S0D1),
+	DEF_MOD("fcpf0",		 615,	R8A7796_CLK_S0D1),
+	DEF_MOD("fcpci0",		 617,	R8A7796_CLK_S0D2),
+	DEF_MOD("fcpcs",		 619,	R8A7796_CLK_S0D2),
 	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S0D6),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
-- 
Regards,

Laurent Pinchart
