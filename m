Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:60242 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752166AbcFNOP3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 10:15:29 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/5] ARM: dts: kzm9g: Update console parameters
Date: Tue, 14 Jun 2016 16:15:24 +0200
Message-Id: <1465913724-26172-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
References: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Change the console alias to "serial0", for consistency with other
boards (the first unlabeled serial port is always called "serial0").
This does change the serial console from /dev/ttySC4 to /dev/ttySC0.
Add the serial port config to "chosen/stdout-path", which requires
referring to the port by alias.
Drop the "console=" parameters from the kernel command line, as they're
no longer needed for DT-based platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Change one-line summary prefix to match current arm-soc practices,
  - Drop name change of pfc subnode,
  - Reword patch description.
---
 arch/arm/boot/dts/sh73a0-kzm9g.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index 1df68b1670339491..3d65f1f6d78b62a4 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -22,7 +22,7 @@
 	compatible = "renesas,kzm9g", "renesas,sh73a0";
 
 	aliases {
-		serial4 = &scifa4;
+		serial0 = &scifa4;
 	};
 
 	cpus {
@@ -39,8 +39,8 @@
 	};
 
 	chosen {
-		bootargs = "console=tty0 console=ttySC4,115200 root=/dev/nfs ip=dhcp ignore_loglevel rw";
-		stdout-path = &scifa4;
+		bootargs = "root=/dev/nfs ip=dhcp ignore_loglevel rw";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@40000000 {
-- 
1.9.1
