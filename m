Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69FDC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7791620863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="V+K8b+WA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfBHLO3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:29 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0DD7625BF11;
        Fri,  8 Feb 2019 22:14:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624458; bh=Jg2Kzt2lNoRSz+gz7BD4a/ornm9MxoUCm/pbcZ+aBQ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V+K8b+WAF0eDnIt3TiWrNoEbW8TFiM6XFDevRLk02+Q5kkAnLFcpcdSSrbKwvq6Fp
         qjjSFHIKz/wGXH5LpPn9C4m15Mr/WJr9KrCA7Degr0hA9kaRI5wH7hDYlv+YU537IN
         lqlKfuttnjwhQJPJD4tO2W+dzF/VIicstiy+ceh8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 23A08940ABA; Fri,  8 Feb 2019 12:14:16 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 12/12] ARM: dts: r8a7744: Add LVDS support
Date:   Fri,  8 Feb 2019 12:14:13 +0100
Message-Id: <1feef0ac19a8376d36909af677b531b21bc92bb7.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Add LVDS encoder node to r8a7744 SoC DT.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7744.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 83804aa042c6..fa74a262107b 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1666,6 +1666,33 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a7744-lvds";
+			reg = <0 0xfeb90000 0 0x1c>;
+			clocks = <&cpg CPG_MOD 726>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 726>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
 					};
 				};
 			};
-- 
2.11.0

