Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752205AbeERLSd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:33 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/69] ARM: dts: wheat: Fix ADV7513 address usage
Date: Fri, 18 May 2018 13:16:41 +0200
Message-Id: <1d26a5217187189fdbee15bc03d3713d8e8ae7e9.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a7792 Wheat board has two ADV7513 devices sharing a single I2C
bus, however in low power mode the ADV7513 will reset it's slave maps to
use the hardware defined default addresses.

The ADV7511 driver was adapted to allow the two devices to be registered
correctly - but it did not take into account the fault whereby the
devices reset the addresses.

This results in an address conflict between the device using the default
addresses, and the other device if it is in low-power-mode.

Repair this issue by moving both devices away from the default address
definitions.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: f6eea82a87db ("ARM: dts: wheat: add DU support")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-wheat.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index b9471b67b728..95aab56a56ab 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -240,9 +240,15 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	/*
+	 * The adv75xx resets its addresses to defaults during low power mode.
+	 * Because we have two ADV7513 devices on the same bus, we must change
+	 * both of them away from the defaults so that they do not conflict.
+	 */
 	hdmi@3d {
 		compatible = "adi,adv7513";
-		reg = <0x3d>;
+		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
+		reg-names = "main", "cec", "edid", "packet";
 
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
@@ -272,7 +278,8 @@
 
 	hdmi@39 {
 		compatible = "adi,adv7513";
-		reg = <0x39>;
+		reg = <0x39>, <0x29>, <0x49>, <0x59>;
+		reg-names = "main", "cec", "edid", "packet";
 
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
-- 
2.11.0
