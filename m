Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:59216 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbeK2VzX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 16:55:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/13] dt-bindings: clock: r8a7795: Remove CSIREF clock
Date: Thu, 29 Nov 2018 11:49:56 +0100
Message-Id: <20181129105008.10239-2-geert+renesas@glider.be>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.52 (Nov 30, 2016)
removed the CSI reference clock on R-Car H3.

As this definition was never used, it can just be removed.
The freed slot in the DT bindings header must not be reused, though.

Fixes: 9d0c3c682033d3f1 ("clk: shmobile: Add r8a7795 CPG Core Clock Definitions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r8a7795-cpg-mssr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/r8a7795-cpg-mssr.h b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
index 9483896415654706..92b3e2a95179d25c 100644
--- a/include/dt-bindings/clock/r8a7795-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
@@ -50,7 +50,7 @@
 #define R8A7795_CLK_CANFD		39
 #define R8A7795_CLK_HDMI		40
 #define R8A7795_CLK_CSI0		41
-#define R8A7795_CLK_CSIREF		42
+/* CLK_CSIREF was removed */
 #define R8A7795_CLK_CP			43
 #define R8A7795_CLK_CPEX		44
 #define R8A7795_CLK_R			45
-- 
2.17.1
