Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:40257 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750760AbdJBGdm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:33:42 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 Host channel 3
Date: Mon,  2 Oct 2017 15:29:48 +0900
Message-Id: <1506925789-19392-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables USB2.0 Host (EHCI/OHCI) channel 3. R-Car H3 ES2.0
has this channel and we can use it on the Salvator-XS.

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
