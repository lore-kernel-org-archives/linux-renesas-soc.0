Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:51856 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751079AbeBHKeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Feb 2018 05:34:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 08/11] ARM: dts: wheat: Enable watchdog support
Date: Thu,  8 Feb 2018 11:34:14 +0100
Message-Id: <1518086057-19448-9-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the watchdog, so the board can be restarted by a watchdog
timeout.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7792-wheat.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index b9471b67b72829de..293b9e3b3e70d7b8 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -168,6 +168,11 @@
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
