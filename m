Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:33500 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935104AbdCJNTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:19:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/13] arm64: dts: m3ulcb: Drop superfluous status update for frequency override
Date: Fri, 10 Mar 2017 14:19:15 +0100
Message-Id: <1489151956-19270-13-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
References: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The scif_clk device node is already enabled in r8a7796.dtsi, so there is
no need to update its status again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index c3f064ac2cb44971..372b2a9447163b24 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -180,7 +180,6 @@
 
 &scif_clk {
 	clock-frequency = <14745600>;
-	status = "okay";
 };
 
 &wdt0 {
-- 
2.7.4
