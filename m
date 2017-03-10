Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:45910 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936059AbdCJNTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:19:34 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/13] ARM: dts: lager: Drop superfluous status update for frequency override
Date: Fri, 10 Mar 2017 14:19:07 +0100
Message-Id: <1489151956-19270-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
References: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The scif_clk device node is already enabled in r8a7790.dtsi, so there is
no need to update its status again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index bd512c86e8522233..ba100a6f67ca554c 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -581,7 +581,6 @@
 
 &scif_clk {
 	clock-frequency = <14745600>;
-	status = "okay";
 };
 
 &msiof1 {
-- 
2.7.4
