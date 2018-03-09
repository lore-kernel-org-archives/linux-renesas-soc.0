Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42811 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750948AbeCIMGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 07:06:36 -0500
Received: by mail-lf0-f68.google.com with SMTP id t204-v6so12863640lff.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Mar 2018 04:06:36 -0800 (PST)
Subject: [PATCH 1/3] arm64: dts: renesas: r8a77980: add PFC support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
Message-ID: <e1130d4e-7c70-fe3d-1a09-349e95ad1b33@cogentembedded.com>
Date: Fri, 9 Mar 2018 15:06:32 +0300
MIME-Version: 1.0
In-Reply-To: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A77980 part of the PFC device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -71,6 +71,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a77980";
+			reg = <0 0xe6060000 0 0x50c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77980-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
