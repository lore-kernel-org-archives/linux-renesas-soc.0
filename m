Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:53769 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933325AbcJUNRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 09:17:44 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 09/23] ARM: dts: r8a7794: Add device node for RST module
Date: Fri, 21 Oct 2016 15:17:23 +0200
Message-Id: <1477055857-17936-10-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the RST module, which provides a.o. reset control
and mode pin monitoring.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,

v3:
  - Use "renesas,<soctype>-rst" instead of "renesas,rst-<soctype>",
  - Drop "syscon" compatible value,

v2:
  - Correct unit address,
  - Drop RFC status and TODO,
  - Change one-line summary prefix to match current arm-soc practices.
---
 arch/arm/boot/dts/r8a7794.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 9365580a194facc7..69e4f4fad89b2323 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1375,6 +1375,11 @@
 		};
 	};
 
+	rst: reset-controller@e6160000 {
+		compatible = "renesas,r8a7794-rst";
+		reg = <0 0xe6160000 0 0x0100>;
+	};
+
 	sysc: system-controller@e6180000 {
 		compatible = "renesas,r8a7794-sysc";
 		reg = <0 0xe6180000 0 0x0200>;
-- 
1.9.1
