Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37491 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758699AbdEMXQ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2017 19:16:29 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id ECBCF20529
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 01:16:21 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 4/6] arm64: dts: renesas: r8a7795-salvator-x: Add DU external dot clocks
Date: Sun, 14 May 2017 02:16:16 +0300
Message-Id: <20170513231618.1715-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU1 and DU2 external dot clocks are provided by the fixed frequency
clock generators X21 and X22, while the DU0 and DU3 clocks are provided
by the programmable Versaclock5 clock generator.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v4:

- Merged all DU clocks in a single patch
- Moved DU clocks to r8a7795-salvator-x.dtsi as they differ between H3
  and M3-W
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 52fce67df341..2a5358b8f229 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -40,6 +40,20 @@
 	};
 };
 
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 721>,
+		 <&cpg CPG_MOD 727>,
+		 <&versaclock5 1>,
+		 <&x21_clk>,
+		 <&x22_clk>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
+};
+
 &ehci2 {
 	status = "okay";
 };
-- 
Regards,

Laurent Pinchart
