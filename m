Return-Path: <devicetree-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: r8a7796: update register size for thermal
Date: Thu,  4 Jan 2018 22:31:08 +0100
Message-Id: <20180104213108.24080-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To be able to read fused calibration values from hardware the size of
the register resource of TSC1 needs to be incremented to cover one more
register which holds the information if the calibration values have been
fused or not.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index ef10fb548681d36a..990ea798dbf6995d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1625,7 +1625,7 @@
 
 		tsc: thermal@e6198000 {
 			compatible = "renesas,r8a7796-thermal";
-			reg = <0 0xe6198000 0 0x68>,
+			reg = <0 0xe6198000 0 0x6c>,
 			      <0 0xe61a0000 0 0x5c>,
 			      <0 0xe61a8000 0 0x5c>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.15.1

