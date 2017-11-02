Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44820 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754859AbdKBJSK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 05:18:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: dts: koelsch: Move cec_clock to root node
Date: Thu,  2 Nov 2017 10:18:05 +0100
Message-Id: <20171102091805.24967-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

cec-clock is a fixed clock generator that is not controlled by i2c5 and
thus should not be a child of the i2c5 bus node. Rather, it should be
a child of the root node of the DT.

Fixes: 02a5ab18d366 ("ARM: dts: koelsch: Add CEC clock for HDMI transmitter")
Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index e164eda69baf..4126de417922 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -278,6 +278,12 @@
 		};
 	};
 
+	cec_clock: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	hdmi-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -640,12 +646,6 @@
 		};
 	};
 
-	cec_clock: cec-clock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <12000000>;
-	};
-
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-- 
2.11.0
