Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:34766 "EHLO
        20.mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750756AbcKCNsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 09:48:54 -0400
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo5.mail-out.ovh.net (Postfix) with ESMTP id A98BB4221D
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2016 14:43:32 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH] ARM: DTS: r8a7794: alt: Fix PCF names for DU
Date: Thu,  3 Nov 2016 14:42:54 +0100
Message-Id: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the PCF pin groups and function names of DU interface for
r8a7794 ALT board.

The currently specified pin groups and function names prevented PCF and
DU interfaces from being correctly configured:

sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
rcar-du: probe of feb00000.display failed with error -22

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

Patch applied against Simon Horman's renesas/master branch.
The PCF pin groups and function renaming was introduced by commit 56ed4bb9 and
DTS for ALT board has never been update accordingly.
Tested displaying frames on VGA interface: the rcar-du driver loads correctly.

 arch/arm/boot/dts/r8a7794-alt.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 8d1b35a..9d65fb3 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -165,8 +165,8 @@
 	pinctrl-names = "default";
 
 	du_pins: du {
-		groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_dotclkout0";
-		function = "du";
+		groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_clk0_out";
+		function = "du1";
 	};
 
 	scif2_pins: scif2 {
-- 
2.7.4
