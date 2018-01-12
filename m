Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39561 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965328AbeALXOj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 18:14:39 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 05/12] ARM: dts: porter: Fix HDMI output routing
Date: Sat, 13 Jan 2018 01:14:23 +0200
Message-Id: <20180112231430.26943-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The HDMI encoder is connected to the RGB output of the DU, which is
port@0, not port@1. Fix the incorrect DT description.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Regards,

Laurent Pinchart
