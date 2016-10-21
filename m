Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40634 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932226AbcJUM1u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 08:27:50 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id AB12B2005E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2016 14:26:57 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: r8a7779: marzen: Configure pinmuxing for the DU0 input clock
Date: Fri, 21 Oct 2016 15:27:43 +0300
Message-Id: <1477052863-3773-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DU0 uses an externally provided clock, but the corresponding pin isn't
correctly muxed. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7779-marzen.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Along with the DU reg fix that has already been merged in Simon's tree, this
makes the VGA output on Marzen working again.

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index 541678df90a9..676151b70185 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -170,7 +170,7 @@
 
 	du_pins: du {
 		du0 {
-			groups = "du0_rgb888", "du0_sync_1", "du0_clk_out_0";
+			groups = "du0_rgb888", "du0_sync_1", "du0_clk_out_0", "du0_clk_in";
 			function = "du0";
 		};
 		du1 {
-- 
Regards,

Laurent Pinchart
