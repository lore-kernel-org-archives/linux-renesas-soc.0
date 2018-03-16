Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753959AbeCPOym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:54:42 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 48/52] ARM: dts: lager: Move cec_clock to root node
Date: Fri, 16 Mar 2018 15:53:07 +0100
Message-Id: <c449938ed383a964019e1d7106e8d47c5cec04f0.1521208546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521208546.git.horms+renesas@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

cec-clock is a fixed clock generator that is not controlled by i2c-12
and thus should not be a child of the i2c-12 bus node. Rather, it should
be a child of the root node of the DT.

Fixes: c5aa87977626e778 ("ARM: dts: lager: Add CEC clock for HDMI transmitter")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 20c1b4f224b8..063fdb65dc60 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -247,6 +247,12 @@
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
@@ -352,12 +358,6 @@
 			};
 		};
 
-		cec_clock: cec-clock {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <12000000>;
-		};
-
 		hdmi@39 {
 			compatible = "adi,adv7511w";
 			reg = <0x39>;
-- 
2.11.0
