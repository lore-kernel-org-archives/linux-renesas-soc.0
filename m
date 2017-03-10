Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:45908 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937005AbdCJNT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:19:29 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/13] ARM: dts: marzen: Drop superfluous status update for frequency override
Date: Fri, 10 Mar 2017 14:19:06 +0100
Message-Id: <1489151956-19270-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
References: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The scif_clk device node is already enabled in r8a7779.dtsi, so there is
no need to update its status again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779-marzen.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index 89c5b24a3d03f049..9412a86f9b300fa7 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -236,7 +236,6 @@
 
 &scif_clk {
 	clock-frequency = <14745600>;
-	status = "okay";
 };
 
 &sdhi0 {
-- 
2.7.4
