Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35527 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936138AbcJ0OpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:45:08 -0400
Received: by mail-pf0-f196.google.com with SMTP id s8so2846063pfj.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 07:45:08 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Thu, 27 Oct 2016 19:29:34 +0900
Message-Id: <20161027102934.26426.94225.sendpatchset@little-apple>
In-Reply-To: <20161027102856.26426.48132.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple>
Subject: [PATCH 04/04] arm64: dts: r8a7795: Connect Ethernet AVB to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add IPMMU-DS0 to the Ethernet-AVB device node.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- 0006/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-10-27 18:08:09.590607110 +0900
@@ -706,6 +706,7 @@
 			phy-mode = "rgmii-id";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			iommus = <&ipmmu_ds0 16>;
 		};
 
 		can0: can@e6c30000 {
