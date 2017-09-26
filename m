Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:18 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 1E9A621481
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 07/13] arm64: dts: r8a7795: Add dma-ranges property in the /soc node
Date: Tue, 26 Sep 2017 13:05:59 +0300
Message-Id: <20170926100605.2313-10-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DMA address translation requires a dma-ranges property in bus nodes.
While some operating systems work around the absence of such property in
an attempt to implement compatibility with incorrect DT, the property is
nonetheless required.

Add the dma-ranges property to the /soc node that contains all on-SoC
peripherals. The bus supports 40-bit DMA addressing without any address
translation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c55003563f61..e6a008d9d5f8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -222,6 +222,7 @@
 
 		#address-cells = <2>;
 		#size-cells = <2>;
+		dma-ranges = <0 0x00000000 0 0x00000000 0x100 0x00000000>;
 		ranges;
 
 		gic: interrupt-controller@f1010000 {
-- 
Regards,

Laurent Pinchart
