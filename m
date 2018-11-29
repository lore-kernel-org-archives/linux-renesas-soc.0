Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:54616 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728096AbeK2VzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 16:55:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/13] dt-bindings: clock: r8a7796: Remove CSIREF clock
Date: Thu, 29 Nov 2018 11:49:57 +0100
Message-Id: <20181129105008.10239-3-geert+renesas@glider.be>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.52 (Nov 30, 2016)
removed the CSI reference clock on R-Car M3-W.

As this definition was never used, it can just be removed.
The freed slot in the DT bindings header must not be reused, though.

Fixes: 972610fb23b08dd5 ("clk: renesas: Add r8a7796 CPG Core Clock Definitions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r8a7796-cpg-mssr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/r8a7796-cpg-mssr.h b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
index e6087f2f7e3aff4a..c0957cf458403bfb 100644
--- a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
@@ -56,7 +56,7 @@
 #define R8A7796_CLK_CANFD		45
 #define R8A7796_CLK_HDMI		46
 #define R8A7796_CLK_CSI0		47
-#define R8A7796_CLK_CSIREF		48
+/* CLK_CSIREF was removed */
 #define R8A7796_CLK_CP			49
 #define R8A7796_CLK_CPEX		50
 #define R8A7796_CLK_R			51
-- 
2.17.1
