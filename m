Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE45C282D8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C026920989
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="b4krw9o8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfA3KSq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:18:46 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39516 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfA3KSq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:18:46 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B1C6925B74E;
        Wed, 30 Jan 2019 21:18:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548843525; bh=JR0Zhm4yhP8i17GqLHdQ51FRm+I7Xdgag3WrEBRuKLM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b4krw9o8ooMkg8t/07+yto/dzn1/CJBpZoaUYYP9q3ZfTUyaAgcCxl0Zpk9OU5lgg
         /CoGM2ijBU9r1VEYJQDnX0wX9zxaheM/1PCMPFhyEIJXl5IPISRZDquVcA/Vz1XPjj
         OTIEhMxwxOfSr4YjJMI59LcUIyxNmEHUmjR1LEbo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E76F8940461; Wed, 30 Jan 2019 11:18:42 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] ARM: dts: r8a7743: Convert to new LVDS DT bindings
Date:   Wed, 30 Jan 2019 11:18:40 +0100
Message-Id: <6a6a797625b5fe855bf60c798561896e311d58ce.1548843393.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548843393.git.horms+renesas@verge.net.au>
References: <cover.1548843393.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 3cc33f7ff7fe..3adc158a40bb 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1681,15 +1681,12 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7743";
-			reg = <0 0xfeb00000 0 0x40000>,
-			      <0 0xfeb90000 0 0x1c>;
-			reg-names = "du", "lvds.0";
+			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>,
-				 <&cpg CPG_MOD 726>;
-			clock-names = "du.0", "du.1", "lvds.0";
+				 <&cpg CPG_MOD 723>;
+			clock-names = "du.0", "du.1";
 			status = "disabled";
 
 			ports {
@@ -1704,6 +1701,33 @@
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
+			compatible = "renesas,r8a7743-lvds";
+			reg = <0 0xfeb90000 0 0x1c>;
+			clocks = <&cpg CPG_MOD 726>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
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

