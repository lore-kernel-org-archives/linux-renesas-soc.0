Return-Path: <SRS0=L9bH=DX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3BBC43457
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 16 Oct 2020 09:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E83AD20848
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 16 Oct 2020 09:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405057AbgJPJNf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 16 Oct 2020 05:13:35 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:48687 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405271AbgJPJMY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 05:12:24 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 12EA920055;
        Fri, 16 Oct 2020 09:12:20 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] clk: renesas: r8a779a0: Add CSI4[0-3] clocks
Date:   Fri, 16 Oct 2020 13:11:53 +0200
Message-Id: <20201016111158.17521-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
References: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add definitions of the CSI-2 receivers clocks for R-Car V3U.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 7e25b3b8945b..bd54a28c50ee 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -141,6 +141,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("csi40",	331,	R8A779A0_CLK_CSI0),
+	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
+	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
+	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
 	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
-- 
2.28.0

