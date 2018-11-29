Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46832 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbeK2VzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 16:55:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/13] clk: renesas: r8a77995: Remove non-existent SSP clocks
Date: Thu, 29 Nov 2018 11:50:06 +0100
Message-Id: <20181129105008.10239-12-geert+renesas@glider.be>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Dec 22, 2017, and
Feb 28, 2018) removed the SSPSRC, SSP1, and SSP2 clocks on R-Car D3, as
this SoC does not have a Stream and Security Processor.

As these definitions were never used, they can just be removed.
The freed slots in the DT bindings header must not be reused, though.

Fixes: 714c53aa2e2d6d60 ("clk: renesas: Add r8a77995 CPG Core Clock Definitions")
Fixes: d71e851d82c6cfe5 ("clk: renesas: cpg-mssr: Add R8A77995 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c       | 1 -
 include/dt-bindings/clock/r8a77995-cpg-mssr.h | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 5cbdabc311f73de5..f2636a34c96c08ca 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -42,7 +42,6 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
-	CLK_SSPSRC,
 	CLK_RINT,
 	CLK_OCO,
 
diff --git a/include/dt-bindings/clock/r8a77995-cpg-mssr.h b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
index 1eb11acfa563dbd8..80b3c5ec9118b544 100644
--- a/include/dt-bindings/clock/r8a77995-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
@@ -35,8 +35,8 @@
 #define R8A77995_CLK_CRD2		24
 #define R8A77995_CLK_SD0H		25
 #define R8A77995_CLK_SD0		26
-#define R8A77995_CLK_SSP2		27
-#define R8A77995_CLK_SSP1		28
+/* CLK_SSP2 was removed */
+/* CLK_SSP1 was removed */
 #define R8A77995_CLK_RPC		29
 #define R8A77995_CLK_RPCD2		30
 #define R8A77995_CLK_ZA2		31
-- 
2.17.1
