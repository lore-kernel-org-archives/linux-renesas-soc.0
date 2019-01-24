Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65800C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36E442184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="DPxubIfG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfAXPNq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:46 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:45 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5470B25BF11;
        Fri, 25 Jan 2019 02:12:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342765; bh=aVh0sCism53oNiDI+BD/WIUngb/djJrWTZlx493c/JQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DPxubIfGtvEJhw/ciF2qca9i2BhoU3o5o/tbUsZQRd4rY+A1FKQg3c+5tyXr1PErb
         RiZVg9Yo6SsWr4tFRL3HybGTG0oXN+fCodJL4KCZxjwN7KgfEkRCr5Y8uU4iHR9sBZ
         DNStFNClvyNFN5Q/id28Q0WIMg4CCYdR27CQDM90=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A64AE940708; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 43/44] arm64: dts: renesas: r8a77990: Enable DMA for SCIF2
Date:   Thu, 24 Jan 2019 16:12:37 +0100
Message-Id: <a99de47921565c233092b0d3c4652b3a10e715ec.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

SCIF2 on R-Car E3 can be used with both DMAC1 and DMAC2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 84bbe70cb0ab..786178cf1ffd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -993,7 +993,9 @@
 				 <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-
+			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
+			       <&dmac2 0x13>, <&dmac2 0x12>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.11.0

