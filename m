Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB68C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:14:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFA9B218A5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="VUo8HrKU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfCOKOp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 06:14:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfCOKOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 06:14:45 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 08E8325BE91;
        Fri, 15 Mar 2019 21:14:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552644882; bh=YQOzXm4EuxT/2NLBbeyr07+NmKFCSCheh/kn60v6Bbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VUo8HrKUf2fnqnNdiBr4YnS2j4qBWtcPy6XqyNhqYHDrf1hRvJ36E4sILyweRQAMP
         NUWc8nrjtDxsJxHqKYbXHsNkKHFHtWXZ0UpiPBCYJTq0/u5qBcjL582cghbknrN4LA
         eI5FjeNDnVSZuA+jgyDipvfvi0FOzOGEOUOaRXis=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 329CB9403F2; Fri, 15 Mar 2019 11:14:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
Date:   Fri, 15 Mar 2019 11:14:37 +0100
Message-Id: <e20119f7eaaaf6aad5b44f35155ce500429e17f6.1552644639.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1552644639.git.horms+renesas@verge.net.au>
References: <cover.1552644639.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
12, 2019, the DMA channels for SCIF5 are corrected from 16..47 to 0..15
on R-Car E3.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: a5ebe5e49a862e21 ("arm64: dts: renesas: r8a77990: Add SCIF-{0,1,3,4,5} device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 786178cf1ffd..36f409091cfc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2,7 +2,7 @@
 /*
  * Device Tree Source for the R-Car E3 (R8A77990) SoC
  *
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  */
 
 #include <dt-bindings/clock/r8a77990-cpg-mssr.h>
@@ -1042,9 +1042,8 @@
 				 <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
-			       <&dmac2 0x5b>, <&dmac2 0x5a>;
-			dma-names = "tx", "rx", "tx", "rx";
+			dmas = <&dmac0 0x5b>, <&dmac0 0x5a>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 202>;
 			status = "disabled";
-- 
2.11.0

