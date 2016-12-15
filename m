Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:56306 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755813AbcLOPbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 10:31:35 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] arm64: dts: r8a7796: salvator-x: Update memory node to 4 GiB map
Date: Thu, 15 Dec 2016 16:31:29 +0100
Message-Id: <1481815889-15583-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch updates memory region:

  - After changes, the new map of the Salvator-X board on R8A7796 SoC
    Bank0: 2GiB RAM : 0x000048000000 -> 0x000bfffffff
    Bank1: 2GiB RAM : 0x000600000000 -> 0x0067fffffff

  - Before changes, the old map looked like this:
    Bank0: 2GiB RAM : 0x000048000000 -> 0x000bfffffff

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Correct size of old map]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Simon, please apply!

U-Boot already adds the second memory region to the "reg" property of
the first memory node in DT, so this patch is actually a no-op.
IMHO it doesn't make much sense to keep on pretending we don't have
enabled memory outside the 32-bit address space.
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index f35e96ca7d6050b7..38bde9de3250ecbb 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -31,6 +31,11 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
1.9.1
