Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC58C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90CA82184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="c8tyMx/x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfAXPNd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:33 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:33 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BB13025BF04;
        Fri, 25 Jan 2019 02:12:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342765; bh=GXWlKxJfS6NEXBhINDZjuoJcIlfeoeIvwc7afD25Xm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c8tyMx/xjrYA9PuDZMzO2EbP08jvxLoIQg+Htflcq/7ZQRALQYwPdCwLHtvFcF2rC
         CDCtxmaAWaeddNonCjpHMIFGrYOPgtZ9SAULFC5tAyWNZ6s12EhnZqkJqhYCYgYzNY
         gw+A9PEUfhzlHK5QCmDpdxhG9DZasLBpwZlE+KXk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 56B16940E28; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 38/44] arm64: dts: renesas: r8a7796: remove BUSIF0 settings from rcar_sound,ssi
Date:   Thu, 24 Jan 2019 16:12:32 +0100
Message-Id: <10bd03fa896ee5e25fa3548a3d1112b9beb76943.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Before, BUSIF which is needed for DMA transfer was automatically handled
via SSI, but it cared BUSIF0 only.
Now, rsnd driver can handle BUSIF0-7 (= for Gen3) BUSIF0-3 (= for Gen2)
via SSIU, and it is keeping compatibility.
Thus, BUSIF0 settings via SSI had been kept to avoid git merge timing
issue / git bisect issue, but it is no longer needed.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 40 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index afedbf5728ec..3a9f8c7081ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2110,53 +2110,53 @@
 			rcar_sound,ssi {
 				ssi0: ssi-0 {
 					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x01>, <&audma1 0x02>, <&audma0 0x15>, <&audma1 0x16>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x01>, <&audma1 0x02>;
+					dma-names = "rx", "tx";
 				};
 				ssi1: ssi-1 {
 					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x03>, <&audma1 0x04>, <&audma0 0x49>, <&audma1 0x4a>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x03>, <&audma1 0x04>;
+					dma-names = "rx", "tx";
 				};
 				ssi2: ssi-2 {
 					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x05>, <&audma1 0x06>, <&audma0 0x63>, <&audma1 0x64>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x05>, <&audma1 0x06>;
+					dma-names = "rx", "tx";
 				};
 				ssi3: ssi-3 {
 					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x07>, <&audma1 0x08>, <&audma0 0x6f>, <&audma1 0x70>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x07>, <&audma1 0x08>;
+					dma-names = "rx", "tx";
 				};
 				ssi4: ssi-4 {
 					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x09>, <&audma1 0x0a>, <&audma0 0x71>, <&audma1 0x72>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x09>, <&audma1 0x0a>;
+					dma-names = "rx", "tx";
 				};
 				ssi5: ssi-5 {
 					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0b>, <&audma1 0x0c>, <&audma0 0x73>, <&audma1 0x74>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
+					dma-names = "rx", "tx";
 				};
 				ssi6: ssi-6 {
 					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0d>, <&audma1 0x0e>, <&audma0 0x75>, <&audma1 0x76>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
+					dma-names = "rx", "tx";
 				};
 				ssi7: ssi-7 {
 					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0f>, <&audma1 0x10>, <&audma0 0x79>, <&audma1 0x7a>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x0f>, <&audma1 0x10>;
+					dma-names = "rx", "tx";
 				};
 				ssi8: ssi-8 {
 					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x11>, <&audma1 0x12>, <&audma0 0x7b>, <&audma1 0x7c>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x11>, <&audma1 0x12>;
+					dma-names = "rx", "tx";
 				};
 				ssi9: ssi-9 {
 					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x13>, <&audma1 0x14>, <&audma0 0x7d>, <&audma1 0x7e>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x13>, <&audma1 0x14>;
+					dma-names = "rx", "tx";
 				};
 			};
 
-- 
2.11.0

