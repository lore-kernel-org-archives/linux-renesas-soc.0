Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38271 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbeKUVFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 16:05:03 -0500
Received: by mail-pl1-f195.google.com with SMTP id e5so4928895plb.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Nov 2018 02:31:12 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 21 Nov 2018 19:31:30 +0900
Message-Id: <154279629062.29528.16838446106465412292.sendpatchset@octo>
In-Reply-To: <154279624819.29528.954090919447072739.sendpatchset@octo>
References: <154279624819.29528.954090919447072739.sendpatchset@octo>
Subject: [PATCH 05/05] arm64: dts: renesas: r8a77990: Add FCPCS+VDPB node for R-Car E3
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add a temporary FCPCS device that also includes VDPB for testing
purpose. This prototype level code is not intended for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-11-21 18:48:07.085224248 +0900
@@ -1419,6 +1419,15 @@
 			resets = <&cpg 408>;
 		};
 
+		fcpcs: fcp@fe90f000 {
+			compatible = "renesas,fcpc";
+			reg = <0 0xfe90f000 0 0x200>,
+			      <0 0xfe900000 0 0x400>; /* Hack to test VDPB */
+			clocks = <&cpg CPG_MOD 619>;
+			power-domains = <&sysc R8A77990_PD_A2VC1>;
+			resets = <&cpg 619>;
+		};
+
 		vspb0: vsp@fe960000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe960000 0 0x8000>;
