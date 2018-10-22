Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ty1jpn01on0094.outbound.protection.outlook.com ([104.47.93.94]:50304
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727387AbeJVPGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 11:06:53 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: salvator-common: add companion property in usb3_peri0
Date: Mon, 22 Oct 2018 15:47:29 +0900
Message-Id: <1540190849-23573-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds a property "companion" with xhci0 phandle to
the usb3_peri0 node in salvator-common.dtsi.

About the detail of this property for renesas_usb3 udc driver, please
refer to the commit 39facfa01c9f ("usb: gadget: udc: renesas_usb3:
Add register of usb role switch").

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 054a7ee..a3e8950 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -817,6 +817,8 @@
 	phys = <&usb3_phy0>;
 	phy-names = "usb";
 
+	companion = <&xhci0>;
+
 	status = "okay";
 };
 
-- 
1.9.1
