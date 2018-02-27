Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42043 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751788AbeB0UIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 15:08:25 -0500
Received: by mail-lf0-f68.google.com with SMTP id t204so90563lff.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 12:08:24 -0800 (PST)
Subject: [PATCH v2 1/5] arm64: dts: renesas: r8a77970: add FCPVD support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
Message-ID: <b28f97f3-cd84-07df-2645-1ff3a97c990f@cogentembedded.com>
Date: Tue, 27 Feb 2018 23:08:22 +0300
MIME-Version: 1.0
In-Reply-To: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe FCPVD0 in the R8A77970 device tree; it will be used by VSPD0 in
the next patch...

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -612,6 +612,14 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		fcpvd0: fcp@fea27000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea27000 0 0x200>;
+			clocks = <&cpg CPG_MOD 603>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 603>;
+		};
 	};
 
 	timer {
