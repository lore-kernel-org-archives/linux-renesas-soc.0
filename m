Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DD6C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AC2A218A5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="G1C8CD/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfCOKOo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 06:14:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfCOKOo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 06:14:44 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 04B3525BE0A;
        Fri, 15 Mar 2019 21:14:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552644882; bh=pfBJZom56U4xu1vNEtX5DClaSClxOlY1fPlOzSAF/IY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G1C8CD/F6IZVqkH29muGU2PWl1F0uRppm/tWotpliswRvMxFQA7dFBq1K8DBB+pmK
         ElKWaZ3x2ErOMAQaqcEv8JoZeuXsEWhcZqES5DgmKrY8TCdMxVUzx/zkN6qMrePM/1
         sr1lyUX3MEC4O6Tab2gjZPydCWsz4bJzFjoh7WAE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3E5F99401EF; Fri, 15 Mar 2019 11:14:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
Date:   Fri, 15 Mar 2019 11:14:38 +0100
Message-Id: <c21cd4ae82e169b394139243684aaacf31bfcdf8.1552644639.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1552644639.git.horms+renesas@verge.net.au>
References: <cover.1552644639.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Correct the DMA channels for SCIF5 from 16..47 to 0..15, as was done for
R-Car E3.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: 2660a6af690ebbb4 ("arm64: dts: renesas: r8a774c0: Add SCIF and HSCIF nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index f2e390f7f1d5..6590b63268b0 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -2,7 +2,7 @@
 /*
  * Device Tree Source for the RZ/G2E (R8A774C0) SoC
  *
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  */
 
 #include <dt-bindings/clock/r8a774c0-cpg-mssr.h>
@@ -990,9 +990,8 @@
 				 <&cpg CPG_CORE R8A774C0_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
-			       <&dmac2 0x5b>, <&dmac2 0x5a>;
-			dma-names = "tx", "rx", "tx", "rx";
+			dmas = <&dmac0 0x5b>, <&dmac0 0x5a>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 202>;
 			status = "disabled";
-- 
2.11.0

