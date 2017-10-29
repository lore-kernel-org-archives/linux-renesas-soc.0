Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42651 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751167AbdJ2PWC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Oct 2017 11:22:02 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: renesas: salvator: set driver type for eMMC
Date: Sun, 29 Oct 2017 16:21:53 +0100
Message-Id: <20171029152153.3673-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

These boards are known to have eMMC issues with the default driver type.
Specify a working one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The mmc-core parts for this are now in mmc/next for v4.15.

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 4786c67b5e6527..215e2d11a0490a 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -579,6 +579,7 @@
 	bus-width = <8>;
 	mmc-hs200-1_8v;
 	non-removable;
+	fixed-emmc-driver-type = <1>;
 	status = "okay";
 };
 
-- 
2.11.0
