Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CADC282E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAA8D222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfDSSWZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfDSSWY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:24 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A866525BEE7;
        Sat, 20 Apr 2019 00:34:55 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0B3E1E21F2D; Fri, 19 Apr 2019 16:34:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 16/21] ARM: dts: r8a77470: Add HSUSB device nodes
Date:   Fri, 19 Apr 2019 16:34:43 +0200
Message-Id: <307ca5cf4778b6bf0d2a025b0e4f653742214de8.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Define the r8a77470 generic part of the HSUSB0/1 device nodes.

Currently the renesas_usbhs driver doesn't handle multiple phys and we
don't have a proper hardware to validate such driver changes.

So for hsusb1 it is assumed that usbphy0 will be enabled by either
channel0 host or device.

In future, if any boards support hsusb1, we will need to add multiple phy
support in the renesas_usbhs driver and override the board dts to enable
the same.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 0ad1ec092305..56cb10b42ed9 100644
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
2.11.0

