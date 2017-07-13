Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37631 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752354AbdGMMRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 08:17:17 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 61B50201F5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 14:16:45 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: salvator-common: Remove extra LVDS port label
Date: Thu, 13 Jul 2017 15:17:14 +0300
Message-Id: <20170713121714.30789-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU LVDS output is on port 3 on R8A7795 but on port 2 on R8A7796. The
lvds_connector label thus can't be defined in salvator-common.dtsi,
common to the two SoCs.

The lvds_connector label is meant for convience to be referenced from
panel device tree files, such as r8a77xx-aa104xd12-panel.dtsi or
r8a77xx-aa121td01-panel.dtsi.  As those files are not included in any
device tree source, and the label never used elsewhere, we can simply
remove it. Out-of-tree patches that include panel device tree files can
then add a

	#define lvds_connector du_out_lvds0

before including the panel device tree file.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Regards,

Laurent Pinchart
