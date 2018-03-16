Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752742AbeCPQi7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 12:38:59 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/47] ARM: dts: porter: Fix HDMI output routing
Date: Fri, 16 Mar 2018 17:38:04 +0100
Message-Id: <d4b78db6ac3e084e2bdc57d5518bd247c727f396.1521218085.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521218085.git.horms+renesas@verge.net.au>
References: <cover.1521218085.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The HDMI encoder is connected to the RGB output of the DU, which is
port@0, not port@1. Fix the incorrect DT description.

Fixes: c5af8a4248d3 ("ARM: dts: porter: add DU DT support")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-porter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index eb374956294f..9a02d03b23c2 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -425,7 +425,7 @@
 		      "dclkin.0", "dclkin.1";
 
 	ports {
-		port@1 {
+		port@0 {
 			endpoint {
 				remote-endpoint = <&adv7511_in>;
 			};
-- 
2.11.0
