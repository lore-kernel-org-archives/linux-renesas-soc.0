Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC45C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EAC42084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfDANA1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 09:00:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:37844 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726752AbfDANA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 09:00:27 -0400
X-IronPort-AV: E=Sophos;i="5.60,296,1549897200"; 
   d="scan'208";a="11929195"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Apr 2019 22:00:25 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8035B401070B;
        Mon,  1 Apr 2019 22:00:22 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding document
Date:   Mon,  1 Apr 2019 13:53:43 +0100
Message-Id: <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding document for Renesas r8a77470(a.k.a RZ/G1C)
on-chip EHCI controller driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * New patch
---
 .../devicetree/bindings/usb/ehci-r8a77470.txt      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-r8a77470.txt

diff --git a/Documentation/devicetree/bindings/usb/ehci-r8a77470.txt b/Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
new file mode 100644
index 0000000..4646adcf
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
@@ -0,0 +1,35 @@
+Renesas R8A77470(RZ/G1C) USB EHCI controller
+
+Required properties:
+ - compatible		: must be "renesas,r8a77470"
+ - reg			: physical base addresses of the controller and length
+			  of memory mapped region
+ - interrupts		: one EHCI interrupt should be described here
+ - clocks		: a list of phandle + clock specifier pairs.
+ - phys			: see usb-hcd.txt in the current directory
+ - resets		: phandle + reset specifier pair
+
+Additionally the properties from usb-hcd.txt (in the current directory) are
+supported.
+
+Example:
+
+	ehci0: usb@ee080100 {
+		compatible = "renesas,ehci-r8a77470";
+		reg = <0 0xee080100 0 0x800>;
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 703>;
+		phys = <&usb0 0>;
+		phy-names = "usb";
+		resets = <&cpg 703>;
+	};
+
+	ehci1: usb@ee0c0100 {
+		compatible = "renesas,ehci-r8a77470";
+		reg = <0 0xee0c0100 0 0x800>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 705>;
+		phys = <&usb0 1>, <&usb1 0>;
+		phy-names = "usb";
+		resets = <&cpg 705>;
+	};
-- 
2.7.4

