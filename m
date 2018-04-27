Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40705 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751348AbeD0Ge6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 02:34:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 host channel 3
Date: Fri, 27 Apr 2018 15:34:32 +0900
Message-Id: <1524810872-8442-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables USB2.0 host channel 3 for r8a7795 with Salvator-XS.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index bbf5a88..e231b5a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -56,6 +56,11 @@
 	status = "okay";
 };
 
+&ehci3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &hsusb3 {
 	dr_mode = "otg";
 	status = "okay";
@@ -117,6 +122,11 @@
 	status = "okay";
 };
 
+&ohci3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &rcar_sound {
 	ports {
 		/* rsnd_port0 is on salvator-common */
-- 
1.9.1
