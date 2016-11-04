Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760391AbcKDJoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/29] ARM: dts: r8a7794: set maximum frequency for SDHI clocks
Date: Fri,  4 Nov 2016 10:44:03 +0100
Message-Id: <5babb5d46413ac8af5ae4f3b9cc93616b3ee2bd1.1478252309.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478252308.git.horms+renesas@verge.net.au>
References: <cover.1478252308.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the upper limit otherwise the driver cannot utilize max speeds.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/r8a7794.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 9365580a194f..57e0d27cb82e 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -731,6 +731,7 @@
 		dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
 		       <&dmac1 0xcd>, <&dmac1 0xce>;
 		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <195000000>;
 		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
@@ -743,6 +744,7 @@
 		dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
 		       <&dmac1 0xc1>, <&dmac1 0xc2>;
 		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <97500000>;
 		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
@@ -755,6 +757,7 @@
 		dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
 		       <&dmac1 0xd3>, <&dmac1 0xd4>;
 		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <97500000>;
 		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
-- 
2.7.0.rc3.207.g0ac5344
