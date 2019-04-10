Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0ACAC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B0742084B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfDJIPe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:15:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58693 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727042AbfDJIPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 04:15:33 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12628505"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2019 17:15:32 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 35CD6426FF96;
        Wed, 10 Apr 2019 17:15:30 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH V4 08/13] ARM: dts: r8a77470: Add USB PHY DT support
Date:   Wed, 10 Apr 2019 09:08:30 +0100
Message-Id: <1554883715-41725-9-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define the r8a77470 generic part of the USB PHY device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
V3-->V4
  * No change
V2-->V3
  * Added gen3 usb2 phy nodes
V1-->V2
 * New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 493cf2b..dcd2975 100644
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
@@ -588,6 +624,26 @@
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
2.7.4

