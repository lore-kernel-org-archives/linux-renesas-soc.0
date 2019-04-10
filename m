Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDE1C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 14:56:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3868720693
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 14:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732957AbfDJO4C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 10:56:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21761 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732856AbfDJO4B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 10:56:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12864667"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Apr 2019 23:56:00 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 28B2A4220407;
        Wed, 10 Apr 2019 23:55:57 +0900 (JST)
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
Subject: [PATCH V5 12/13] ARM: dts: r8a77470: Add HSUSB device nodes
Date:   Wed, 10 Apr 2019 15:48:49 +0100
Message-Id: <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define the r8a77470 generic part of the HSUSB0/1 device nodes.

Currently the renesas_usbhs driver doesn't handle multiple phys and we
don't have a proper hardware to validate such driver changes.

So for hsusb1 it is assumed that usbphy0 will be enabled by either
channel0 host or device.

In future, if any boards support hsusb1, we will need to add multiple phy
support in the renesas_usbhs driver and override the board dts to enable
the same.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
V4-->V5
 * NO change
V3-->V4
 * NO change
V2-->V3
 * No Change
V1-->V2
 * New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index e7a2234..c930606 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -325,6 +325,23 @@
 			status = "disabled";
 		};
 
+		hsusb0: hsusb@e6590000 {
+			compatible = "renesas,usbhs-r8a77470",
+				     "renesas,rcar-gen2-usbhs";
+			reg = <0 0xe6590000 0 0x100>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>;
+			dmas = <&usb_dmac00 0>, <&usb_dmac00 1>,
+			       <&usb_dmac10 0>, <&usb_dmac10 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <4>;
+			phys = <&usb0 1>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			status = "disabled";
+		};
+
 		usbphy0: usb-phy@e6590100 {
 			compatible = "renesas,usb-phy-r8a77470",
 				     "renesas,rcar-gen2-usb-phy";
@@ -343,6 +360,24 @@
 			};
 		};
 
+		hsusb1: hsusb@e6598000 {
+			compatible = "renesas,usbhs-r8a77470",
+				     "renesas,rcar-gen2-usbhs";
+			reg = <0 0xe6598000 0 0x100>;
+			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 706>;
+			dmas = <&usb_dmac01 0>, <&usb_dmac01 1>,
+			       <&usb_dmac11 0>, <&usb_dmac11 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <4>;
+			/* We need to turn on usbphy0 to make usbphy1 to work */
+			phys = <&usb1 1>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			status = "disabled";
+		};
+
 		usbphy1: usb-phy@e6598100 {
 			compatible = "renesas,usb-phy-r8a77470",
 				     "renesas,rcar-gen2-usb-phy";
-- 
2.7.4

