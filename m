Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49171 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933255AbcIFIZ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 04:25:27 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 45711201E3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Sep 2016 10:25:00 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] clk: shmobile: r8a7796: Add RAVB clock
Date: Tue,  6 Sep 2016 11:25:49 +0300
Message-Id: <1473150352-31081-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index cfd5ffb77dfe..868dfe30dfe7 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -99,6 +99,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("scif2",		 310,	R8A7796_CLK_S3D4),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
+	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S3D2),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio5",		 907,	R8A7796_CLK_S3D4),
-- 
Regards,

Laurent Pinchart
