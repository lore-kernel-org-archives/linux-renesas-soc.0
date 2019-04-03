Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A78FC10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BB6D20700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="sD91Cbhh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfDCKyo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2E6B125BEE5;
        Wed,  3 Apr 2019 21:54:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288855; bh=j0AUsO8bCYltIGB3bOHsmxBx5jGQNG3JdUO833Kmdhg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sD91CbhhpO/JB+4oA5pdP6OmElyF99ZVRT/rYOooDSFHHdW0PzWQB7uuu6CvFELLw
         ZtCFC47Dv7TG5WfJlcPtMAqAGtYcMF7zupMv6Njo6dU3PS9BvAqXLo65Iwr2SVYaSO
         Cl2SBzyK3qpG/5agJ0PQic1jqdLc3ZKkcX1BXYHk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C41B79408C4; Wed,  3 Apr 2019 12:54:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 21/26] arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN nodes
Date:   Wed,  3 Apr 2019 12:54:04 +0200
Message-Id: <036bc85c1d06ef0a0924aed3fbbef8dccb86b9a1.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

According to the latest information, clkp2 is available on RZ/G2.
Modify CAN0 and CAN1 nodes accordingly.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 5b7fca953964..638eb015d6ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -969,8 +969,10 @@
 				     "renesas,rcar-gen3-can";
 			reg = <0 0xe6c30000 0 0x1000>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 916>, <&can_clk>;
-			clock-names = "clkp1", "can_clk";
+			clocks = <&cpg CPG_MOD 916>,
+				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
+				 <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 916>;
 			status = "disabled";
@@ -981,8 +983,10 @@
 				     "renesas,rcar-gen3-can";
 			reg = <0 0xe6c38000 0 0x1000>;
 			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 915>, <&can_clk>;
-			clock-names = "clkp1", "can_clk";
+			clocks = <&cpg CPG_MOD 915>,
+				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
+				 <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 915>;
 			status = "disabled";
-- 
2.11.0

