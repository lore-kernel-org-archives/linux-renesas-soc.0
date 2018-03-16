Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753751AbeCPOws (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:52:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 49/69] arm64: dts: renesas: r8a77965: Move usb2_phy1 up
Date: Fri, 16 Mar 2018 15:51:19 +0100
Message-Id: <fe6746059b165ab42e8aa0a2c7b7bf307baad660.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Move "usb2_ph1" place-holder device node next to "usb2_phy0" one.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0118956cc6e0..8c9648a24ee0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -604,6 +604,11 @@
 			/* placeholder */
 		};
 
+		usb2_phy1: usb-phy@ee0a0200 {
+			reg = <0 0xee0a0200 0 0x700>;
+			/* placeholder */
+		};
+
 		ohci1: usb@ee0a0000 {
 			reg = <0 0xee0a0000 0 0x100>;
 			/* placeholder */
@@ -771,11 +776,6 @@
 			};
 		};
 
-		usb2_phy1: usb-phy@ee0a0200 {
-			reg = <0 0xee0a0200 0 0x700>;
-			/* placeholder */
-		};
-
 		sdhi0: sd@ee100000 {
 			reg = <0 0xee100000 0 0x2000>;
 			/* placeholder */
-- 
2.11.0
