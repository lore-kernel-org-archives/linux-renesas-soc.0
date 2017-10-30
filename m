Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:58594 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932384AbdJ3P4e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 11:56:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] arm64: dts: renesas: eagle: Move avb node to preserve sort order
Date: Mon, 30 Oct 2017 16:56:28 +0100
Message-Id: <1509378989-25069-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
References: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index a711e77cc6a5db68..9e37f6e7b265c035 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -33,6 +33,17 @@
 	};
 };
 
+&avb {
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -44,14 +55,3 @@
 &scif0 {
 	status = "okay";
 };
-
-&avb {
-	renesas,no-ether-link;
-	phy-handle = <&phy0>;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-	};
-};
-- 
2.7.4
