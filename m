Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B02C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4A6120863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TkpH89Bi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfBHLOY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:24 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:24 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3E49225BEF8;
        Fri,  8 Feb 2019 22:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624457; bh=fB+rt6U+PyfCm9Eb/YMBvg31hi+2Yo0jyyBbAZNd9Tc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TkpH89Bi4WD/ouC1Q5nBsKWrLs7CIMl/VLQ5dZGiPJrrDsRd/bg9D/sEFLrYdEHnu
         tN29Y+Lbmx7qzcRW8Z2QCXvevTh2dVOWrKe1BXtTixnc+K6708lPjh4rRSL//+DKM8
         l5giad59vUT9r+/zBebQ+iXcTUuNKF1cA+9LyOX0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 84FEB9401DB; Fri,  8 Feb 2019 12:14:15 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/12] ARM: dts: r8a7743: Remove generic compatible string from iic3
Date:   Fri,  8 Feb 2019 12:14:05 +0100
Message-Id: <072b817589b17660ef19c31d89f7b981dbed3fd2.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

The iic3 block on RZ/G1M does not support automatic transmission, unlike
other R-Car SoC's. So dropping the compatibility with the generic version.

Fixes: f523405f2a22cc0c307 ("ARM: dts: r8a7743: Add IIC cores to dtsi")
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 3cc33f7ff7fe..169fddc33229 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -564,9 +564,7 @@
 			/* doesn't need pinmux */
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,iic-r8a7743",
-				     "renesas,rcar-gen2-iic",
-				     "renesas,rmobile-iic";
+			compatible = "renesas,iic-r8a7743";
 			reg = <0 0xe60b0000 0 0x425>;
 			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 926>;
-- 
2.11.0

