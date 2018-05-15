Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39181 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752421AbeEOMUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 08:20:54 -0400
Received: by mail-wm0-f65.google.com with SMTP id f8-v6so691705wmc.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 05:20:54 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a77995: Add LVDS support
Date: Tue, 15 May 2018 14:20:38 +0200
Message-Id: <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995 D3 platform has 2 LVDS channels connected to the DU.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
[uli: moved lvds* into the soc node, added PM domains, resets]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 +++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index ba98865..8e78110d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -757,12 +757,68 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					du_out_lvds1: endpoint {
+						remote-endpoint = <&lvds1_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds-encoder@feb90000 {
+			compatible = "renesas,r8a77995-lvds";
+			reg = <0 0xfeb90000 0 0x20>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
+					};
+				};
+			};
+		};
+
+		lvds1: lvds-encoder@feb90100 {
+			compatible = "renesas,r8a77995-lvds";
+			reg = <0 0xfeb90100 0 0x20>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds1_in: endpoint {
+						remote-endpoint = <&du_out_lvds1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds1_out: endpoint {
 					};
 				};
 			};
-- 
2.7.4
