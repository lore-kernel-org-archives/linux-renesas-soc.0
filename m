Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50880 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751098AbdE1KOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 May 2017 06:14:38 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] arm64: dts: r8a7796: add DMA for IIC_DVFS
Date: Sun, 28 May 2017 12:14:30 +0200
Message-Id: <20170528101430.19371-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170528101430.19371-1-wsa+renesas@sang-engineering.com>
References: <20170528101430.19371-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Tested with a Salvator-X.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 57f4c881c49ab3..909efa09b9c809 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -393,6 +393,8 @@
 			clocks = <&cpg CPG_MOD 926>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 926>;
+			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.11.0
