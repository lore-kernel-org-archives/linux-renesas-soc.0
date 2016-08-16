Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33198 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753387AbcHPOsC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 10:48:02 -0400
Received: by mail-wm0-f68.google.com with SMTP id o80so16912203wme.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2016 07:48:02 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com,
	ulrich.hecht+renesas@gmail.com,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: r8a7796: Add pinctrl device node
Date: Tue, 16 Aug 2016 16:47:12 +0200
Message-Id: <1471358833-18248-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds pinctrl device node for R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1edf824..faea5a9 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -107,6 +107,11 @@
 			status = "disabled";
 		};
 
+		pfc: pfc@e6060000 {
+			compatible = "renesas,pfc-r8a7796";
+			reg = <0 0xe6060000 0 0x50c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7796-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.7.4
