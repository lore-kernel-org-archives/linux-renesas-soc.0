Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37547 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbdGMLKA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 07:10:00 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 2/2] arm64: dts: r8a7795: salvator-xs: Connect DU dot clocks 0 and 3
Date: Thu, 13 Jul 2017 14:09:53 +0300
Message-Id: <20170713110953.8511-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU dot clocks 0 and 3 are provided by the programmable VC6 clock
generator. Connect them to the clock source node.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 6a7d1b22d0fe..7675de5d4f2c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -44,10 +44,12 @@
 		 <&cpg CPG_MOD 722>,
 		 <&cpg CPG_MOD 721>,
 		 <&cpg CPG_MOD 727>,
+		 <&versaclock6 1>,
 		 <&x21_clk>,
-		 <&x22_clk>;
+		 <&x22_clk>,
+		 <&versaclock6 2>;
 	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
-		      "dclkin.1", "dclkin.2";
+		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
 
 &ehci2 {
-- 
Regards,

Laurent Pinchart
