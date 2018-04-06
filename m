Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36017 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbeDFUUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 16:20:02 -0400
Received: by mail-lf0-f68.google.com with SMTP id z143-v6so2183858lff.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Apr 2018 13:20:01 -0700 (PDT)
Subject: [PATCH 3/3] arm64: dts: renesas: condor: add PCIe support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
Message-ID: <62d9dbbe-9f11-303c-56dd-3dcdaf48bcc1@cogentembedded.com>
Date: Fri, 6 Apr 2018 23:19:59 +0300
MIME-Version: 1.0
In-Reply-To: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable PCIe PHY and PCIEC and specify the PCIe bus clock for the Condor
board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -49,6 +49,18 @@
 	clock-frequency = <32768>;
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
 &scif0 {
 	status = "okay";
 };
