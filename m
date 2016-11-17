Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964972AbcKQRmh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:42:37 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/18] arm64: dts: m3ulcb: enable EXTALR clk
Date: Thu, 17 Nov 2016 15:04:50 +0100
Message-Id: <caa22eef7db250b8ea4f53ac135df1f6aeb317e8.1479388193.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479388193.git.horms+renesas@verge.net.au>
References: <cover.1479388193.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This enables EXTALR clock that can be used for the watchdog.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 2f8f183ea0cd..5567c46f3753 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -60,6 +60,10 @@
 	clock-frequency = <16666666>;
 };
 
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.0.rc3.207.g0ac5344
