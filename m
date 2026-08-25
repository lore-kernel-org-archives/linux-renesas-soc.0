Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5D481675;
	Tue, 25 Aug 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669659; cv=none; b=hwpur1tl+SCo/V9kdkvfhC7iXT0YIkL2DQsM2RL52h1+fFVqm8fu1H30OTZoyqh6s9+kM7ZWDes8mEKFRwlGfM/XNMHkyCeESDYgSEEg30p0qn9y2Vqjdzzb6IEymq5TfHqkkEthrawF9nf9ne6+x+kbhnMU3g5/v/Ytc061zcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669659; c=relaxed/simple;
	bh=Vl1mCgXrENhDOYqSIE4D3UtRj/cHNcl4l6be4HKDV2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaM6gHz6fLXIvFxy5TaWF+shzGINumhDrB/8s1trBXyZjS+StOjDlZ+Hq6XGgz+/J03O5EPvLNh5UEQRBjX1juxRTdOZNMb57NwRecP5rxBXU0/1qhwnASm5hRWppkWsdxrjnHHJfPV4ZzIi37h7H1vKiZjcyJ6horpotdnHEq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E6F1F00A3A;
	Tue, 25 Aug 2026 14:54:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
Date: Tue, 25 Aug 2026 16:54:05 +0200
Message-ID: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK is
currently modelled as two TCAN1042 instances.  Improve hardware
description by describing the actual transceiver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only due to lack of hardware.

At least the TI AM68 SK DTS should be updated, too.
There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 469a6282b2a30c91..14f5834082fa500e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -112,7 +112,7 @@ &canfd {
 	channel1 {
 		status = "okay";
 #if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
-		phys = <&can_transceiver1>;
+		phys = <&can_transceiver 1>;
 #endif
 	};
 #endif
@@ -121,22 +121,25 @@ channel1 {
 	channel4 {
 		status = "okay";
 #if (SW_GPIO8_CAN0_STB)
-		phys = <&can_transceiver0>;
+		phys = <&can_transceiver 0>;
 #endif
 	};
 #endif
 };
 
-#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)
-&can_transceiver0 {
-	standby-gpios = <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
-	status = "okay";
-};
+#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB || SW_GPIO9_CAN1_STB)
+&can_transceiver {
+	standby-gpios =
+#if (SW_GPIO8_CAN0_STB)
+			<&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>,
+#else
+			<0>,
+#endif
+#if (SW_GPIO9_CAN1_STB)
+			<&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
+#else
+			<0>;
 #endif
-
-#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
-&can_transceiver1 {
-	standby-gpios = <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 #endif
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 696a933af808a8eb..826a11ab93c7a253 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -44,16 +44,9 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
-	can_transceiver0: can-phy0 {
-		compatible = "ti,tcan1042";
-		#phy-cells = <0>;
-		max-bitrate = <8000000>;
-		status = "disabled";
-	};
-
-	can_transceiver1: can-phy1 {
-		compatible = "ti,tcan1042";
-		#phy-cells = <0>;
+	can_transceiver: can-phy {
+		compatible = "ti,tcan1046", "nxp,tja1048";
+		#phy-cells = <1>;
 		max-bitrate = <8000000>;
 		status = "disabled";
 	};
-- 
2.43.0

