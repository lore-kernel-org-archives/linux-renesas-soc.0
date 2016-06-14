Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:34408 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752611AbcFNOPa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 10:15:30 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/5] ARM: dts: armadillo800eva: Update console parameters
Date: Tue, 14 Jun 2016 16:15:20 +0200
Message-Id: <1465913724-26172-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
References: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Change the console alias to "serial0", for consistency with other
boards (the first unlabeled serial port is always called "serial0").
This does change the serial console from /dev/ttySC1 to /dev/ttySC0.
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
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 6866f61a350c7cc3..7885075428bb03a2 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -20,12 +20,12 @@
 	compatible = "renesas,armadillo800eva", "renesas,r8a7740";
 
 	aliases {
-		serial1 = &scifa1;
+		serial0 = &scifa1;
 	};
 
 	chosen {
-		bootargs = "console=tty0 console=ttySC1,115200 earlyprintk=sh-sci.1,115200 ignore_loglevel root=/dev/nfs ip=dhcp rw";
-		stdout-path = &scifa1;
+		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=dhcp rw";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@40000000 {
-- 
1.9.1
