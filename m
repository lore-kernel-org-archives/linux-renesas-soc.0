Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34930 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727480AbeGUMHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jul 2018 08:07:17 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
Date: Sat, 21 Jul 2018 13:14:49 +0200
Message-Id: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds SDHI support for the R8A77990 SoC (R-Car E3). No driver changes
needed for anything except HS400 which we will enable separately later.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Note: we shouldn't enable HS400 in the DTS files yet, since we don't have the 8
tap support. But I think we can enable basic support.

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index 839f469f4525..c434200d19d5 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -28,6 +28,7 @@ Required properties:
 		"renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
 		"renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
 		"renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
+		"renesas,sdhi-r8a77990" - SDHI IP on R8A77990 SoC
 		"renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
 		"renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
 		"renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
-- 
2.11.0
