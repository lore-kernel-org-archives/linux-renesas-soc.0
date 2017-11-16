Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:53734 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935056AbdKPNoZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 08:44:25 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a7795-salvator-xs: Add SoC name to file header
Date: Thu, 16 Nov 2017 14:44:21 +0100
Message-Id: <1510839861-12303-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1510839861-12303-1-git-send-email-geert+renesas@glider.be>
References: <1510839861-12303-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document clearly which SoC this DTS applies to, to distinguish from
Salvator-XS boards equipped with other SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 7675de5d4f2cb139..8b50ceb746e814f7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for the Salvator-X 2nd version board
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car H3 ES2.0
  *
  * Copyright (C) 2015-2017 Renesas Electronics Corp.
  *
-- 
2.7.4
