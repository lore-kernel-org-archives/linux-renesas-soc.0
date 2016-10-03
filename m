Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46294 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbcJCRMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2016 13:12:40 -0400
Received: from avalon.ideasonboard.com (unknown [90.63.244.31])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 229A92006D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2016 19:11:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint
Date: Mon,  3 Oct 2016 20:12:31 +0300
Message-Id: <1475514751-3602-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Declaring the endpoint makes LVDS enablement easier by just including
the corresponding panel's dtsi file.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index ff4e4fe843ed..c8f6023c4667 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -191,6 +191,10 @@
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
+		port@3 {
+			lvds_connector: endpoint {
+			};
+		};
 	};
 };
 
-- 
Regards,

Laurent Pinchart
