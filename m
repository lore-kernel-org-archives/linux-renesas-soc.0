Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:60244 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752575AbcFNOP3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 10:15:29 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/5] ARM: dts: genmai: Update console parameters
Date: Tue, 14 Jun 2016 16:15:21 +0200
Message-Id: <1465913724-26172-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
References: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Change the console alias to "serial0", for consistency with other
boards (the first unlabeled serial port is always called "serial0").
This does change the serial console from /dev/ttySC2 to /dev/ttySC0.
Add the serial port config to "chosen/stdout-path", which requires
referring to the port by alias.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Change one-line summary prefix to match current arm-soc practices,
  - Reword patch description.
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 05ba9953b4d8d9ec..118a8e2b86bdd672 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -17,12 +17,12 @@
 	compatible = "renesas,genmai", "renesas,r7s72100";
 
 	aliases {
-		serial2 = &scif2;
+		serial0 = &scif2;
 	};
 
 	chosen {
 		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
-		stdout-path = &scif2;
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@8000000 {
-- 
1.9.1
