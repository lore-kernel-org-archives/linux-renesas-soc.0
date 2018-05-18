Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34676 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbeERTpk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 15:45:40 -0400
Received: by mail-lf0-f68.google.com with SMTP id x145-v6so3576649lff.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 12:45:39 -0700 (PDT)
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77980: add GEther support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Message-ID: <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
Date: Fri, 18 May 2018 22:45:36 +0300
MIME-Version: 1.0
In-Reply-To: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A77980 part of the GEther device node.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -417,6 +417,17 @@
 			dma-channels = <16>;
 		};
 
+		gether: ethernet@e7400000 {
+			compatible = "renesas,gether-r8a77980";
+			reg = <0 0xe7400000 0 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77980",
 				     "renesas,rcar-gen3-sdhi";
