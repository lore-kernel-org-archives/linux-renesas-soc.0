Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:64542 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756000AbcKVNqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 08:46:53 -0500
From: Chris Paterson <chris.paterson2@renesas.com>
To: geert+renesas@glider.be, mturquette@baylibre.com,
        sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        ramesh.shanmugasundaram@bp.renesas.com,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 3/3] clk: renesas: r8a7796: Add CAN FD peripheral clock
Date: Tue, 22 Nov 2016 13:46:02 +0000
Message-Id: <1479822362-4749-4-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
References: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index b461383..a09d6f8 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -182,6 +182,7 @@ enum clk_ids {
 	DEF_MOD("gpio2",		 910,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio1",		 911,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio0",		 912,	R8A7796_CLK_S3D4),
+	DEF_MOD("can-fd",		 914,	R8A7796_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A7796_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A7796_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A7796_CLK_S0D6),
-- 
1.9.1
