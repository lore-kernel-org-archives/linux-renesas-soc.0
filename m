Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35941 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeHLQL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Aug 2018 12:11:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id h9-v6so12053518wro.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Aug 2018 06:33:24 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [PATCH v2 5/7] arm64: dts: renesas: r8a77965: Add CAN{0,1} placeholder nodes
Date: Sun, 12 Aug 2018 15:31:47 +0200
Message-Id: <20180812133149.7710-5-erosca@de.adit-jv.com>
In-Reply-To: <20180812133149.7710-1-erosca@de.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to R-Car Gen3 HW manual rev1.00, R-Car M3-N has two CAN
interfaces, similar to H3, M3-W and other SoCs from the same family.

Add CAN placeholder nodes to avoid below DTC errors:
Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:19.1-6 Label or path can0 not found
Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:25.1-6 Label or path can1 not found

These errors occur *after* the addition of r8a77965-m3nulcb-kf.dts.
Fix them beforehand.

CAN support is inspired from below commits:
 - v4.7 commit 308b7e4ba62e ("arm64: dts: r8a7795: Add CAN support")
 - v4.11 commit 909c16252415 ("arm64: dts: r8a7796: Add CAN support")
 - v4.12 commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
Changes in v2:
 - [Kieran Bingham] Improved commit description:
   - Referenced the newer HW manual rev1.00 instead of rev0.55E.
   - Kept the "true story" behind the patch. Just made it more clear.
 - [Geert Uytterhoeven] Replaced CAN0 and CAN1 nodes with placeholders
   (no CAN testing was done to validate the DTS configuration).
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 486aecacb22a..4da479d3c226 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -656,6 +656,22 @@
 			status = "disabled";
 		};
 
+		can0: can@e6c30000 {
+			compatible = "renesas,can-r8a77965",
+				     "renesas,rcar-gen3-can";
+			reg = <0 0xe6c30000 0 0x1000>;
+			/* placeholder */
+			status = "disabled";
+		};
+
+		can1: can@e6c38000 {
+			compatible = "renesas,can-r8a77965",
+				     "renesas,rcar-gen3-can";
+			reg = <0 0xe6c38000 0 0x1000>;
+			/* placeholder */
+			status = "disabled";
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 8>;
-- 
2.18.0
