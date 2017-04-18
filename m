Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37832 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754761AbdDRFz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 01:55:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFT 1/2] ARM: dts: r8a7793: set maximum frequency for SDHI clocks
Date: Tue, 18 Apr 2017 14:55:38 +0900
Message-Id: <1492494939-24568-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1492494939-24568-1-git-send-email-horms+renesas@verge.net.au>
References: <1492494939-24568-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the upper limit otherwise the driver cannot utilize max speeds.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 4de6041d61f9..08b7b0f97909 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -542,6 +542,7 @@
 		dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
 		       <&dmac1 0xcd>, <&dmac1 0xce>;
 		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <195000000>;
 		power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
@@ -554,6 +555,7 @@
 		dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
 		       <&dmac1 0xc1>, <&dmac1 0xc2>;
 		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <97500000>;
 		power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
@@ -566,6 +568,7 @@
 		dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
 		       <&dmac1 0xd3>, <&dmac1 0xd4>;
 		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <97500000>;
 		power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
-- 
2.7.0.rc3.207.g0ac5344
