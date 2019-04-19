Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A181C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1911222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfDSSW3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfDSSW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:29 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7597C25BECE;
        Sat, 20 Apr 2019 00:34:54 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id ECD63E21F04; Fri, 19 Apr 2019 16:34:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 12/21] ARM: dts: r8a77470: Add USB PHY DT support
Date:   Fri, 19 Apr 2019 16:34:39 +0200
Message-Id: <1a675db44002ed9674d6e534b1400a9d756ef34b.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Define the r8a77470 generic part of the USB PHY device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470.dtsi | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 2e02ff4bd4f7..eb7c53ed077a 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -325,6 +325,42 @@
 			status = "disabled";
 		};
 
+		usbphy0: usb-phy@e6590100 {
+			compatible = "renesas,usb-phy-r8a77470",
+				     "renesas,rcar-gen2-usb-phy";
+			reg = <0 0xe6590100 0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cpg CPG_MOD 704>;
+			clock-names = "usbhs";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			status = "disabled";
+
+			usb0: usb-channel@0 {
+				reg = <0>;
+				#phy-cells = <1>;
+			};
+		};
+
+		usbphy1: usb-phy@e6598100 {
+			compatible = "renesas,usb-phy-r8a77470",
+				     "renesas,rcar-gen2-usb-phy";
+			reg = <0 0xe6598100 0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cpg CPG_MOD 706>;
+			clock-names = "usbhs";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			status = "disabled";
+
+			usb1: usb-channel@0 {
+				reg = <0>;
+				#phy-cells = <1>;
+			};
+		};
+
 		usb_dmac00: dma-controller@e65a0000 {
 			compatible = "renesas,r8a77470-usb-dmac",
 				     "renesas,usb-dmac";
@@ -728,6 +764,26 @@
 			status = "disabled";
 		};
 
+		usb2_phy0: usb-phy@ee080200 {
+			compatible = "renesas,usb2-phy-r8a77470";
+			reg = <0 0xee080200 0 0x700>;
+			clocks = <&cpg CPG_MOD 703>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@ee0c0200 {
+			compatible = "renesas,usb2-phy-r8a77470";
+			reg = <0 0xee0c0200 0 0x700>;
+			clocks = <&cpg CPG_MOD 705>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.11.0

