Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34169 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754660AbeFNTUB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 15:20:01 -0400
Received: by mail-lf0-f67.google.com with SMTP id o9-v6so11135958lfk.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jun 2018 12:20:01 -0700 (PDT)
Subject: [PATCH v2 2/2] arm64: dts: renesas: condor: add PCIe support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
Message-ID: <eba72bac-60f8-2c09-e3e7-4b6a73e5fdfa@cogentembedded.com>
Date: Thu, 14 Jun 2018 22:19:58 +0300
MIME-Version: 1.0
In-Reply-To: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable PCIe PHY and PCIEC and specify the PCIe bus clock for the Condor
board.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- mentioned Vladimir's original work and added his signoff;
- refreshed the patch.

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -223,6 +223,18 @@
 	status = "okay";
 };
 
+&pciec {
+	status = "okay";
+};
+
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_rgmii";
