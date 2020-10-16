Return-Path: <SRS0=L9bH=DX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D9BC433E7
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 16 Oct 2020 09:13:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F95120878
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 16 Oct 2020 09:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394920AbgJPJNT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 16 Oct 2020 05:13:19 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41861 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405962AbgJPJM2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 05:12:28 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 393DC20059;
        Fri, 16 Oct 2020 09:12:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] clk: renesas: r8a779a0: Add VIN clocks
Date:   Fri, 16 Oct 2020 13:11:56 +0200
Message-Id: <20201016111158.17521-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
References: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add definitions of the VIN instances clocks for R-Car V3U.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index bd54a28c50ee..2a00eb82013f 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -149,6 +149,38 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
+	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin03",	801,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin04",	802,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin05",	803,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin06",	804,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin07",	805,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin10",	806,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin11",	807,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin12",	808,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin13",	809,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin14",	810,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin15",	811,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin16",	812,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin17",	813,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin20",	814,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin21",	815,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin22",	816,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin23",	817,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin24",	818,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin25",	819,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin26",	820,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin27",	821,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin30",	822,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin31",	823,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin32",	824,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin33",	825,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin34",	826,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),
 };
 
 static spinlock_t cpg_lock;
-- 
2.28.0

