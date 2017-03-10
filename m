Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:52158 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937163AbdCJNTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:19:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/13] ARM: dts: koelsch: Drop superfluous status updates for frequency overrides
Date: Fri, 10 Mar 2017 14:19:08 +0100
Message-Id: <1489151956-19270-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
References: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The scif_clk and pcie_bus_clk device nodes are already enabled in
r8a7791.dtsi, so there is no need to update their statuses again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 5405d337d7448665..59beb8402a36007b 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -516,7 +516,6 @@
 
 &scif_clk {
 	clock-frequency = <14745600>;
-	status = "okay";
 };
 
 &sdhi0 {
@@ -767,7 +766,6 @@
 
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
-	status = "okay";
 };
 
 &pciec {
-- 
2.7.4
