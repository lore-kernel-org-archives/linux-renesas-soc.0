Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:60728 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932415AbdJ3P4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 11:56:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: eagle: Enable watchdog timer
Date: Mon, 30 Oct 2017 16:56:29 +0100
Message-Id: <1509378989-25069-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
References: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Watchdog Timer (WDT) controller on the Renesas Eagle
board equipped with an R-Car V3M (r8a77970) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 9e37f6e7b265c035..8fe5c193e0496520 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -52,6 +52,11 @@
 	clock-frequency = <32768>;
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.7.4
