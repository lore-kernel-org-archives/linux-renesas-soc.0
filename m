Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbeKZXuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 18:50:09 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/40] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Date: Mon, 26 Nov 2018 13:54:52 +0100
Message-Id: <5e53dbf4edb4d0d1cc97318139f2c20338f207c8.1543229515.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1543229515.git.horms+renesas@verge.net.au>
References: <cover.1543229515.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

The VIN driver bindings dictates fixed numbering for VIN endpoints connected
to CSI-2 endpoints, even when a single endpoint exists.

Without proper endpoint numbering the VIN driver fails to probe.

Based on a patch in BSP from Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index e0092fb27ec0..a2524fc138a2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1011,9 +1011,13 @@
 				#size-cells = <0>;
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
 					reg = <1>;
 
-					vin4csi40: endpoint {
+					vin4csi40: endpoint@2 {
+						reg = <2>;
 						remote-endpoint= <&csi40vin4>;
 					};
 				};
@@ -1035,9 +1039,13 @@
 				#size-cells = <0>;
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
 					reg = <1>;
 
-					vin5csi40: endpoint {
+					vin5csi40: endpoint@2 {
+						reg = <2>;
 						remote-endpoint= <&csi40vin5>;
 					};
 				};
-- 
2.11.0
