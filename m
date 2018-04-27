Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:34390 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1757466AbeD0Ge6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 02:34:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a7795: salvator-xs: enable hsusb channel 3 node
Date: Fri, 27 Apr 2018 15:34:31 +0900
Message-Id: <1524810872-8442-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables HS-USB channel3 node for r8a7795 with Salvator-XS.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 622b2a2..bbf5a88 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -56,6 +56,11 @@
 	status = "okay";
 };
 
+&hsusb3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &sound_card {
 	dais = <&rsnd_port0	/* ak4613 */
 		&rsnd_port1	/* HDMI0  */
-- 
1.9.1
