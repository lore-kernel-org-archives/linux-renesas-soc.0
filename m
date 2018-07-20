Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33214 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbeGTMvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:51:43 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/9] arm64: dts: renesas: r8a77965: Add second port to rcar_sound placeholder
Date: Fri, 20 Jul 2018 14:03:34 +0200
Message-Id: <485f8b2824ef10f2a7b12d45a3f2b5c943aa1e04.1532087303.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532087303.git.horms+renesas@verge.net.au>
References: <cover.1532087303.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This node is just a placeholder but fills that function better if it does
not trigger build warnings. This update satisfies the requirement that
nodes with #address-cells/#size-cells properties have more than one child
node.

This is flagged by dtc as follows:
 # make dtbs W=1
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
 arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index be8631dff1b4..a37749caf40e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1269,6 +1269,9 @@
 				port@0 {
 					reg = <0>;
 				};
+				port@1 {
+					reg = <1>;
+				};
 			};
 		};
 
-- 
2.11.0
