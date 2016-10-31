Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:53537 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944929AbcJaRIX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 13:08:23 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/5] arm64: dts: r8a7796: salvator-x: Update memory node to 4 GiB map
Date: Mon, 31 Oct 2016 18:08:18 +0100
Message-Id: <1477933702-13423-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
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
Note: Depending on firmware version, this patch may not make a
difference at all!

Indeed, U-Boot may already add the second memory region to the "reg"
property of the first memory node in DT, regardless of the presence of a
second memory node. Fortunately Linux handles duplicate memory regions
just fine...
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index f7c0ec47af7660b1..2fe75b06288c608e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -32,6 +32,11 @@
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
