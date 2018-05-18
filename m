Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:30 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 018/102] arm64: dts: renesas: r8a7796: decrease temperature hysteresis
Date: Fri, 18 May 2018 13:14:40 +0200
Message-Id: <1f153093b0bb6a9b46cb410ee3535d990348a2b3.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

To incorporate more tests by the hardware team decrease the hysteresis
value to 1C.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 55a64169d3d4..e6254711556c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2072,12 +2072,12 @@
 			trips {
 				sensor1_passive: sensor1-passive {
 					temperature = <95000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -2098,12 +2098,12 @@
 			trips {
 				sensor2_passive: sensor2-passive {
 					temperature = <95000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 				sensor2_crit: sensor2-crit {
 					temperature = <120000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -2124,12 +2124,12 @@
 			trips {
 				sensor3_passive: sensor3-passive {
 					temperature = <95000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-- 
2.11.0
