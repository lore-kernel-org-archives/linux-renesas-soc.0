Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34273 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753187AbdCTImD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:42:03 -0400
Received: by mail-pf0-f195.google.com with SMTP id o126so16081491pfb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:41:52 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:36:22 +0900
Message-Id: <148999898229.20118.1562448393902244892.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 07/09] arm64: dts: r8a7795: Connect Ethernet-AVB to IPMMU-DS0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add IPMMU-DS0 to the Ethernet-AVB device node.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - New patch

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- 0012/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 16:30:42.620607110 +0900
@@ -762,6 +762,7 @@
 					  "ch20", "ch21", "ch22", "ch23",
 					  "ch24";
 			clocks = <&cpg CPG_MOD 812>;
+			iommus = <&ipmmu_ds0 16>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			phy-mode = "rgmii-txid";
 			#address-cells = <1>;
