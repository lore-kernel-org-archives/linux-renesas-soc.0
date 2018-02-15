Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39144 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755240AbeBOKCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:02:36 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2] ARM: shmobile: Document Renesas H2-based Stout DT bindings
Date: Thu, 15 Feb 2018 11:02:28 +0100
Message-Id: <20180215100228.24695-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the Renesas H2 Stout (ADAS Starterkit) device tree bindings,
listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to
the Stout board.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
V2: - Keep the list of boards alphabetically sorted
    - Rename the board from ADAS Starter Kit to ADAS Starterkit
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 41d3920aaa5e..98916b3864c2 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -116,6 +116,8 @@ Boards:
     compatible = "renesas,sk-rzg1e", "renesas,r8a7745"
   - SK-RZG1M (YR8A77430S000BE)
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
+  - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
+    compatible = "renesas,stout", "renesas,r8a7790"
   - V3MSK
     compatible = "renesas,v3msk", "renesas,r8a77970"
   - Wheat
-- 
2.15.1
