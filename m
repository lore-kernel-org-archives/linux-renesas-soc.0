Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33652 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751575AbdHRITv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 04:19:51 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/9] arm64: dts: salvator-common: Remove extra LVDS port label
Date: Fri, 18 Aug 2017 10:19:31 +0200
Message-Id: <111c074476cee28db42a6dedec0e3c695b045182.1502961153.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1502961153.git.horms+renesas@verge.net.au>
References: <cover.1502961153.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The DU LVDS output is on port 3 on R8A7795 but on port 2 on R8A7796. The
lvds_connector label thus can't be defined in salvator-common.dtsi,
common to the two SoCs.

The lvds_connector label is meant for convenience to be referenced from
panel device tree files, such as r8a77xx-aa104xd12-panel.dtsi or
r8a77xx-aa121td01-panel.dtsi.  As those files are not included in any
device tree source, and the label never used elsewhere, we can simply
remove it. Out-of-tree patches that include panel device tree files can
then add a

	#define lvds_connector du_out_lvds0

before including the panel device tree file.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index aef35e0b685a..7d46a6c0f74b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -268,10 +268,6 @@
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
-		port@3 {
-			lvds_connector: endpoint {
-			};
-		};
 	};
 };
 
-- 
2.1.4
