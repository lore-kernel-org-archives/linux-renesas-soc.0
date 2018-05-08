Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:32970 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755467AbeEHQjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 May 2018 12:39:44 -0400
Received: by mail-lf0-f67.google.com with SMTP id m18-v6so46826890lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 May 2018 09:39:43 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a77970: add SMP support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: mark.rutland@arm.com, magnus.damm@gmail.com,
        linux-arm-kernel@lists.infradead.org
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
Message-ID: <54dbd1d2-8279-5073-cffb-c647fba91e42@cogentembedded.com>
Date: Tue, 8 May 2018 19:39:40 +0300
MIME-Version: 1.0
In-Reply-To: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the device node for the second Cortex-A53 CPU core.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180508-v4.17-rc4' tag of Simon
Horman's 'renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -41,6 +41,16 @@
 			enable-method = "psci";
 		};
 
+		a53_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <1>;
+			clocks = <&cpg CPG_CORE R8A77970_CLK_Z2>;
+			power-domains = <&sysc R8A77970_PD_CA53_CPU1>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
 		L2_CA53: cache-controller {
 			compatible = "cache";
 			power-domains = <&sysc R8A77970_PD_CA53_SCU>;
