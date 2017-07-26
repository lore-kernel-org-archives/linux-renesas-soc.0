Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:53672 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751585AbdGZLeJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2017 07:34:09 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a7795: salvator-xs: enable USB 2.0 channel 3
Date: Wed, 26 Jul 2017 20:30:59 +0900
Message-Id: <1501068660-4032-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1501068660-4032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068660-4032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If we turn the SW31-[34] on, we can use USB2.0 channel 3 on the board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index e18bf4f..365c8df 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -56,6 +56,10 @@
 	status = "okay";
 };
 
+&ehci3 {
+	status = "okay";
+};
+
 &hdmi0 {
 	status = "okay";
 
@@ -94,6 +98,10 @@
 	status = "okay";
 };
 
+&ohci3 {
+	status = "okay";
+};
+
 &pfc {
 	usb2_pins: usb2 {
 		groups = "usb2";
-- 
1.9.1
