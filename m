Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:53942 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751648AbcJDJZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 05:25:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/4] clk: renesas: Add r8a7795 ES2.0 CPG Core Clock Definitions
Date: Tue,  4 Oct 2016 11:25:25 +0200
Message-Id: <1475573127-30054-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
References: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add all R-Car H3 ES2.0 Clock Pulse Generator Core Clock Outputs, as
listed in Table 8.2a ("List of Clocks [R-Car H3]") of the R-Car Gen3
datasheet (rev. 0.52 + Errata for Rev052 Aug 31 2016).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r8a7795-cpg-mssr.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/r8a7795-cpg-mssr.h b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
index e864aae0a2561c4b..f047eaf261f34ac7 100644
--- a/include/dt-bindings/clock/r8a7795-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
@@ -60,4 +60,11 @@
 #define R8A7795_CLK_R			45
 #define R8A7795_CLK_OSC			46
 
+/* r8a7795 ES2.0 CPG Core Clocks */
+#define R8A7795_CLK_S0D2		47
+#define R8A7795_CLK_S0D3		48
+#define R8A7795_CLK_S0D6		49
+#define R8A7795_CLK_S0D8		50
+#define R8A7795_CLK_S0D12		51
+
 #endif /* __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__ */
-- 
1.9.1
