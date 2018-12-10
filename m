Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:55540 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbeLJJnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 04:43:19 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Jacopo Mondi <jacopo@jmondi.org>, Simon Horman <horms@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: draak: Fix CVBS input
Date: Mon, 10 Dec 2018 11:43:55 +0200
Message-Id: <20181210094355.15108-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A typo in the adv7180 DT node prevents successful probing of the VIN.
Fix it.

Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 2405eaad0296..0f2523296b8a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -195,7 +195,7 @@
 		compatible = "adi,adv7180cp";
 		reg = <0x20>;
 
-		port {
+		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
Regards,

Laurent Pinchart
