Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34793 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752162AbdI2Lyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:50 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 27/48] ARM: dts: iwg22d-sodimm: Add Ethernet AVB support
Date: Fri, 29 Sep 2017 13:53:19 +0200
Message-Id: <d6ee805325b1d082fa33be3024163e5f7931ed54.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Define the iWave RainboW-G22D board dependent part of the Ethernet
AVB device node.

On some older versions of the platform (before R4.0) the phy address
may be 1 or 3. The address is fixed to 3 for R4.0 onwards (which
will be the first mainstream release), hence using 3 in the dts.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 442a5cbb0838..aac84c67a31d 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -17,9 +17,11 @@
 
 	aliases {
 		serial0 = &scif4;
+		ethernet0 = &avb;
 	};
 
 	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 };
@@ -29,6 +31,11 @@
 		groups = "scif4_data_b";
 		function = "scif4";
 	};
+
+	avb_pins: avb {
+		groups = "avb_mdio", "avb_gmii";
+		function = "avb";
+	};
 };
 
 &scif4 {
@@ -37,3 +44,22 @@
 
 	status = "okay";
 };
+
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&phy3>;
+	phy-mode = "gmii";
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy3: ethernet-phy@3 {
+	/*
+	 * On some older versions of the platform (before R4.0) the phy address
+	 * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
+	 */
+		reg = <3>;
+		micrel,led-mode = <1>;
+	};
+};
-- 
2.1.4
