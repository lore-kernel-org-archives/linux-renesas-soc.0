Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753576AbeCPOvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:51:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/69] arm64: dts: renesas: r8a7796: update register size for thermal
Date: Fri, 16 Mar 2018 15:50:40 +0100
Message-Id: <a052d934a4e03a81e1f6cf1c63ac693b04e9a441.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

To be able to read fused calibration values from hardware the size of
the register resource of TSC1 needs to be incremented to cover one more
register which holds the information if the calibration values have been
fused or not.

Instead of increasing TSC1 size to the value from the datasheet update
all TSC's size to the smallest granularity of the address decoder
circuitry.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index ef10fb548681..f8e9313f9405 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1625,9 +1625,9 @@
 
 		tsc: thermal@e6198000 {
 			compatible = "renesas,r8a7796-thermal";
-			reg = <0 0xe6198000 0 0x68>,
-			      <0 0xe61a0000 0 0x5c>,
-			      <0 0xe61a8000 0 0x5c>;
+			reg = <0 0xe6198000 0 0x100>,
+			      <0 0xe61a0000 0 0x100>,
+			      <0 0xe61a8000 0 0x100>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0
