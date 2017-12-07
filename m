Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbdLGJzS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:55:18 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 37/54] arm64: dts: renesas: r8a7796-salvator-x: Add SoC name to file header
Date: Thu,  7 Dec 2017 10:53:40 +0100
Message-Id: <8af1da9e8a804ef81a034f96f0e9a778e5f3cc6e.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Document clearly which SoC this DTS applies to, to distinguish from
Salvator-X boards equipped with other SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index b317be03306e..498c9e807dc4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for the Salvator-X board
+ * Device Tree Source for the Salvator-X board with R-Car M3-W
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  *
-- 
2.11.0
