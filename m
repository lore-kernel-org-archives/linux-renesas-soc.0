Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC86DC282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 14:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A55D20989
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 14:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XGKbEVnq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfA1OBg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 09:01:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60765 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfA1OBg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 09:01:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EE77025BE02;
        Tue, 29 Jan 2019 01:01:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548684094; bh=4/VrSwFsbSxZTXcqJqHgjm6k/0gutHwhX5oDwYoN3VU=;
        h=From:To:Cc:Subject:Date:From;
        b=XGKbEVnqRy/ruQQTuvWYH1y4uDDgeLbaX7YP++j18ngR5LYEuugfZyVSwMkFrj4N2
         nJz1M/zxQMKkBe0m9VwAfKaere5DeV3zaDONlvUTannyK4qE1Uhim+LNu3zULQbnLk
         HDd/w5UEY6WMvky/+FU7niHDLG4s5Ex3GKzJzfj4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EC04E9403E0; Mon, 28 Jan 2019 15:01:31 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] clk: renesas: r8a77990: Add Z2 clock
Date:   Mon, 28 Jan 2019 15:01:27 +0100
Message-Id: <20190128140127.17540-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Adds Z2 clock to CPG driver for the R-Car E3 (r8a77990) SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

 Tested on top of renesas-devel-20190128-v5.0-rc4
 in conjunction with 
 "[PATCH/RFT] arm64: dts: renesas: r8a77990: Add OPPs table for cpu devices"

 https://patchwork.kernel.org/patch/10764359/

 Test results to be posted to that thread shortly.

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9a278c75c918..a41a92fb8d48 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -79,6 +79,7 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
 
 	/* Core Clock Outputs */
+	DEF_FIXED("z2",        R8A77990_CLK_Z2,    CLK_PLL0D4,     1, 1),
 	DEF_FIXED("za2",       R8A77990_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
 	DEF_FIXED("ztr",       R8A77990_CLK_ZTR,   CLK_PLL1,       6, 1),
-- 
2.11.0

