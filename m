Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751996AbeCPQjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 12:39:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/47] ARM: dts: r8a7793: consistently use single space before =
Date: Fri, 16 Mar 2018 17:38:23 +0100
Message-Id: <77b1e3d230e5e42bbde3f11923b34382832a8415.1521218085.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521218085.git.horms+renesas@verge.net.au>
References: <cover.1521218085.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Consistently use a single space before a =.

This patch fixes instances where a tab is used instead.

This patch should not introduce any functional change.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index aa7d7792fb13..f9c5a557107d 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -1362,16 +1362,16 @@
 
 	thermal-zones {
 		cpu_thermal: cpu-thermal {
-			polling-delay-passive	= <0>;
-			polling-delay		= <0>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&thermal>;
 
 			trips {
 				cpu-crit {
-					temperature	= <95000>;
-					hysteresis	= <0>;
-					type		= "critical";
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "critical";
 				};
 			};
 			cooling-maps {
-- 
2.11.0
