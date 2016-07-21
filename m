Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:55978 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752305AbcGUKro (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 06:47:44 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <horms@verge.net.au>, <magnus.damm@gmail.com>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 4/5] arm64: dts: salvator-x: enable HSUSB
Date: Thu, 21 Jul 2016 19:47:00 +0900
Message-ID: <1469098021-7692-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index c0e6e8f..4332ec7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -431,6 +431,10 @@
 	status = "okay";
 };
 
+&hsusb {
+	status = "okay";
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 	status = "okay";
-- 
1.9.1
