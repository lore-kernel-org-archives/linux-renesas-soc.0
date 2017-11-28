Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48764 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753062AbdK1Nrl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 08:47:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Magnus Damm <damm+renesas@opensource.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 09/12] ARM: dts: r8a7791: Remove CMT renesas,channels-mask
Date: Tue, 28 Nov 2017 14:47:33 +0100
Message-Id: <1511876856-9495-10-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1511876856-9495-1-git-send-email-geert+renesas@glider.be>
References: <1511876856-9495-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the DTS to remove the now deprecated "renesas,channels-mask"
property.

The channel information is now kept in the device driver and can easily
be determined based on the compat string.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Rebased against renesas-devel-20171127-v4.15-rc1,

v3:
  - Take over from Magnus,
  - Split in per-SoC patches,

v2:
  - Rebased on top of power-domain changes,
  - Added Acked-by and Tested-by from Geert.
---
 arch/arm/boot/dts/r8a7791.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index a69d6f883b34519f..dfc1c406179fbf3a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -266,8 +266,6 @@
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 		resets = <&cpg 124>;
 
-		renesas,channels-mask = <0x60>;
-
 		status = "disabled";
 	};
 
@@ -287,8 +285,6 @@
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 		resets = <&cpg 329>;
 
-		renesas,channels-mask = <0xff>;
-
 		status = "disabled";
 	};
 
-- 
2.7.4
