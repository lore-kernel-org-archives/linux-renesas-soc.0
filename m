Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752488AbeERLTG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:19:06 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 44/69] ARM: dts: iwg23s-sbc: Add EtherAVB support
Date: Fri, 18 May 2018 13:17:17 +0200
Message-Id: <b6ef074bcadf9f89295bc7ee19424714b6ffc4c8.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Define the iW-RainboW-G23S board dependent part of the
EtherAVB device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index d21baad9f0ad..e3585daafdd6 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -12,11 +12,12 @@
 	compatible = "iwave,g23s", "renesas,r8a77470";
 
 	aliases {
+		ethernet0 = &avb;
 		serial1 = &scif1;
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial1:115200n8";
 	};
 
@@ -26,6 +27,18 @@
 	};
 };
 
+&avb {
+	phy-handle = <&phy3>;
+	phy-mode = "gmii";
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy3: ethernet-phy@3 {
+		reg = <3>;
+		micrel,led-mode = <1>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
-- 
2.11.0
