Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:60243 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752371AbcFNOP3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 10:15:29 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] ARM: dts: marzen: Add serial port config to chosen/stdout-path
Date: Tue, 14 Jun 2016 16:15:22 +0200
Message-Id: <1465913724-26172-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
References: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the serial port config to "chosen/stdout-path", which requires
referring to the port by alias.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Change one-line summary prefix to match current arm-soc practices,
  - Reword patch description.
---
 arch/arm/boot/dts/r8a7779-marzen.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index 013e6f510b0faae4..541678df90a9829e 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -25,7 +25,7 @@
 
 	chosen {
 		bootargs = "ignore_loglevel root=/dev/nfs ip=on";
-		stdout-path = &scif2;
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@60000000 {
-- 
1.9.1
