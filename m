Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57346 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964890AbcJQVMm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 17:12:42 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 8BFFB207B1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2016 23:11:51 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] clk: renesas: r8a7796: Add VSP clocks
Date: Tue, 18 Oct 2016 00:12:32 +0300
Message-Id: <1476738753-24304-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476738753-24304-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476738753-24304-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 41a3677a4b3a..679054658f99 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -129,6 +129,11 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("fcpf0",		 615,	R8A7796_CLK_S0D1),
 	DEF_MOD("fcpci0",		 617,	R8A7796_CLK_S0D1),
 	DEF_MOD("fcpcs",		 619,	R8A7796_CLK_S0D1),
+	DEF_MOD("vspd2",		 621,	R8A7796_CLK_S0D2),
+	DEF_MOD("vspd1",		 622,	R8A7796_CLK_S0D2),
+	DEF_MOD("vspd0",		 623,	R8A7796_CLK_S0D2),
+	DEF_MOD("vspb",			 626,	R8A7796_CLK_S0D1),
+	DEF_MOD("vspi0",		 631,	R8A7796_CLK_S0D1),
 	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S0D6),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
-- 
Regards,

Laurent Pinchart
