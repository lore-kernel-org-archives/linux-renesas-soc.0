Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:38991 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750985AbeEKUWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 16:22:00 -0400
Received: by mail-lf0-f66.google.com with SMTP id j193-v6so9639949lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 13:21:59 -0700 (PDT)
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77970: disable EtherAVB
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <5844eef7-0f5e-6366-4d3d-a3a658e7f988@cogentembedded.com>
Message-ID: <653a7410-20ba-2cc9-b223-09c00d5be280@cogentembedded.com>
Date: Fri, 11 May 2018 23:21:57 +0300
MIME-Version: 1.0
In-Reply-To: <5844eef7-0f5e-6366-4d3d-a3a658e7f988@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When adding the R8A77970 EtherAVB device I failed to notice that it does
not have the usual "status" property disabling the described devices in
anticipation that the board device trees enable the devices according to
their needs. This causes the EtherAVB driver to successfully probe despite
e.g. the needed pins not having been configured -- luckily, "eth<n>" device
can't be opened anyway...

Fixes: bea2ab136eaa ("arm64: dts: renesas: r8a77970: add EtherAVB support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -473,6 +473,7 @@
 			iommus = <&ipmmu_rt 3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		scif0: serial@e6e60000 {
