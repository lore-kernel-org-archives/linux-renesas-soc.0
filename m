Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069AbcF3ORd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:17:33 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 35/41] ARM: dts: kzm9d: Update console parameters
Date: Thu, 30 Jun 2016 16:15:55 +0200
Message-Id: <20fc3188ac35f4afe52d24d02a0750c5e9307c98.1467294011.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467294011.git.horms+renesas@verge.net.au>
References: <cover.1467294011.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add a "serial1" alias for the serial console (it is labeled "uart1").
Add the serial port config to "chosen/stdout-path", which requires
referring to the port by alias.
Drop the "console=" parameter from the kernel command line, as it's no
longer needed for DT-based platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index 9eb86f8f32c5..60d0a732833a 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -23,9 +23,13 @@
 		reg = <0x40000000 0x8000000>;
 	};
 
+	aliases {
+		serial1 = &uart1;
+	};
+
 	chosen {
-		bootargs = "console=ttyS1,115200n81 ignore_loglevel root=/dev/nfs ip=dhcp";
-		stdout-path = &uart1;
+		bootargs = "ignore_loglevel root=/dev/nfs ip=dhcp";
+		stdout-path = "serial1:115200n8";
 	};
 
 	gpio_keys {
-- 
2.7.0.rc3.207.g0ac5344
