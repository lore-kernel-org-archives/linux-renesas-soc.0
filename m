Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BEAC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5899821872
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="B/81wz7Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfAXPME (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:12:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39030 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:12:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7259F25BECA;
        Fri, 25 Jan 2019 02:11:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342718; bh=rEaeMIZIXAoUg6EBBTyLBlRuzU30ookQOF9Siip9nlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B/81wz7YRGNvpbcMEMPA/mrfQBTqxAjQjyaMp6WLKpq2BPjSU9JE6tc1HPDs4WwwU
         x/sekAdN54nCdL2Eb9DMU2UaBlccbL5OXICOpngMM+uFYyMwoTKomVXuE6OJzWooSp
         En97/fdZ7mx3XYcktC8yhl6SYa3rkc0epkzuf4js=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8DFD6940793; Thu, 24 Jan 2019 16:11:56 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a77965: Enable DMA for SCIF2
Date:   Thu, 24 Jan 2019 16:11:54 +0100
Message-Id: <05c8478abd485507c25aa565afab604af8d8fe46.1548165440.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548165440.git.horms+renesas@verge.net.au>
References: <cover.1548165440.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

SCIF2 on R-Car M3-N can be used with both DMAC1 and DMAC2.

Fixes: 0ea5b2fd38db56aa ("arm64: dts: renesas: r8a77965: Add SCIF device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6dc9b1fef830..4b3730f640ef 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1068,6 +1068,9 @@
 				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
+			       <&dmac2 0x13>, <&dmac2 0x12>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.11.0

