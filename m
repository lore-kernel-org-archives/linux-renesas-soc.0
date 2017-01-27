Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60016 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932482AbdA0KHW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 05:07:22 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] arm64: dts: r8a7795: Enable I2C DVFS DMA
Date: Fri, 27 Jan 2017 11:06:23 +0100
Message-Id: <1485511583-21614-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1485511583-21614-1-git-send-email-horms+renesas@verge.net.au>
References: <1485511583-21614-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index fe266bb3d913..d1d404c29563 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -804,6 +804,9 @@
 			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 926>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			dmas = <&dmac1 0x11>, <&dmac1 0x10>,
+			       <&dmac2 0x11>, <&dmac2 0x10>;
+			dma-names = "tx", "rx", "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.7.0.rc3.207.g0ac5344
