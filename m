Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56098 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752619AbdKJNZn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 08:25:43 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v5 02/15] arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes
Date: Fri, 10 Nov 2017 14:25:19 +0100
Message-Id: <20171110132532.1202-3-horms+renesas@verge.net.au>
In-Reply-To: <20171110132532.1202-1-horms+renesas@verge.net.au>
References: <20171110132532.1202-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add r8a7795 ES1.x IPMMU nodes and keep all disabled by default.

This is a follow-up to a patch that adds IPMMU device nodes that
are common to r8a7795 ES1.x and ES2.0

Power domains are omitted as they appear to be undocumented.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v5 [Simon Horman]
* Added reviewed-by tag from Geert Uytterhoeven
* Dropped somewhat redundant comments from nodes

v4 [Simon Horman]
* Broke out of larger patch

v1 - v3 [Magnus Damm]
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 246323eacb56..38b7cfb3b428 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -26,6 +26,22 @@
 	/delete-node/ mmu@fd960000;
 	/delete-node/ mmu@fd970000;
 
+	ipmmu_mp1: mmu@ec680000 {
+		compatible = "renesas,ipmmu-r8a7795";
+		reg = <0 0xec680000 0 0x1000>;
+		renesas,ipmmu-main = <&ipmmu_mm 5>;
+		#iommu-cells = <1>;
+		status = "disabled";
+	};
+
+	ipmmu_sy: mmu@e7730000 {
+		compatible = "renesas,ipmmu-r8a7795";
+		reg = <0 0xe7730000 0 0x1000>;
+		renesas,ipmmu-main = <&ipmmu_mm 8>;
+		#iommu-cells = <1>;
+		status = "disabled";
+	};
+
 	/delete-node/ usb-phy@ee0e0200;
 	/delete-node/ usb@ee0e0100;
 	/delete-node/ usb@ee0e0000;
-- 
2.11.0
