Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52283 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751443AbdHIMYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 08:24:02 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a77995: add pfc device node
Date: Wed,  9 Aug 2017 21:20:47 +0900
Message-Id: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---

 This patch set is based on the renesas-drivers.git /
topic/r8a77995-integration branch and depends on the following patch
 "pinctrl: sh-pfc: r8a77995: Initial R8A77995 PFC support"

 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 7419688..240b0f8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -123,6 +123,11 @@
 			reg = <0 0xe6160000 0 0x0200>;
 		};
 
+		pfc: pfc@e6060000 {
+			compatible = "renesas,pfc-r8a77995";
+			reg = <0 0xe6060000 0 0x508>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
1.9.1
