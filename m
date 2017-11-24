Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:46080 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753767AbdKXVDV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 16:03:21 -0500
Received: by mail-lf0-f66.google.com with SMTP id g35so26643190lfi.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Nov 2017 13:03:21 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171124210317.285946395@cogentembedded.com>
Date: Fri, 24 Nov 2017 23:59:45 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] arm64: dts: renesas: v3msk: add EtherAVB support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-renesas-v3msk-add-EtherAVB-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the V3M Starter Kit board dependent part of the EtherAVB
device node.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -31,6 +31,17 @@
 	};
 };
 
+&avb {
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
