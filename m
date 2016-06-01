Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58553 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751642AbcFATV1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 15:21:27 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 03/22] ARM: dts: r8a7778: Add device node for RESET/WDT module
Date: Wed,  1 Jun 2016 21:21:01 +0200
Message-Id: <1464808880-343-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the RESET/WDT module, which provides a.o. reset
control, mode pin monitoring, and watchdog control.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 arch/arm/boot/dts/r8a7778.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index e571d66ea0fe1721..3d0a18abd408c76d 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -626,4 +626,9 @@
 				"sru-src6", "sru-src7", "sru-src8";
 		};
 	};
+
+	rst: reset-controller@ffcc0000 {
+		compatible = "renesas,r8a7778-reset-wdt";
+		reg = <0xffcc0000 0x40>;
+	};
 };
-- 
1.9.1
