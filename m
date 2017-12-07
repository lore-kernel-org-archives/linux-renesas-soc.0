Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:65289 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750950AbdLGKAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 05:00:02 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: salvator-common: enable usb3_peri0
Date: Thu,  7 Dec 2017 18:55:42 +0900
Message-Id: <1512640542-10380-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables usb3_peri0 that uses usb3_phy0 to enable VBUS
detection for the USB3.0 peripheral.

The Salvator-X[S] has USB3.0 type-A connector and supplies VBUS
if USB3.0 host runs. So, you need a special cable for it, and
to stop the VBUS supplies from the board, after you installs
a gadget driver, you should run the following command to avoid
conflict VBUS supply:

	# echo 1 > /sys/kernel/debug/ee020000.usb/b_device

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index f7c8ced..8e01fb9 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -666,6 +666,13 @@
 	status = "okay";
 };
 
+&usb3_peri0 {
+	phys = <&usb3_phy0>;
+	phy-names = "usb";
+
+	status = "okay";
+};
+
 &usb3_phy0 {
 	status = "okay";
 };
-- 
1.9.1
