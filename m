Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46092 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbdEVMaP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 08:30:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] ARM: dts: r8a7791: add GyroADC clock
Date: Mon, 22 May 2017 14:30:02 +0200
Message-Id: <a56a2fe7118a6b568679bb8d90a6772e10ad9098.1495454780.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495454780.git.horms+renesas@verge.net.au>
References: <cover.1495454780.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Marek Vasut <marek.vasut@gmail.com>

Add the GyroADC clock to the R8A7791 device tree.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/clock/r8a7791-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/r8a7791-clock.h b/include/dt-bindings/clock/r8a7791-clock.h
index adc50dc31ab3..ef692134146b 100644
--- a/include/dt-bindings/clock/r8a7791-clock.h
+++ b/include/dt-bindings/clock/r8a7791-clock.h
@@ -109,6 +109,7 @@
 #define R8A7791_CLK_SATA0		15
 
 /* MSTP9 */
+#define R8A7791_CLK_GYROADC		1
 #define R8A7791_CLK_GPIO7		4
 #define R8A7791_CLK_GPIO6		5
 #define R8A7791_CLK_GPIO5		7
-- 
2.1.4
