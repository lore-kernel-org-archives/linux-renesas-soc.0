Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40695 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755136AbeDZKaJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 06:30:09 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/10] ARM: dts: silk: Drop unnecessary address properties from vin port node
Date: Thu, 26 Apr 2018 12:29:47 +0200
Message-Id: <20180426102951.8683-7-horms+renesas@verge.net.au>
In-Reply-To: <20180426102951.8683-1-horms+renesas@verge.net.au>
References: <20180426102951.8683-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The vin port node does not have an address and thus does not need
address-cells or address size-properties.

This is flagged by dtc as follows:
 # make dtbs W=1
 arch/arm/boot/dts/r8a7794-silk.dtb: Warning (avoid_unnecessary_addr_size): /soc/video@e6ef0000/port: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-silk.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index e2642d2c2eed..7808aaee6644 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -475,9 +475,6 @@
 	pinctrl-names = "default";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		vin0ep: endpoint {
 			remote-endpoint = <&adv7180>;
 			bus-width = <8>;
-- 
2.11.0
