Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:36742 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750941AbeBZSDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 13:03:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] dt-bindings: arm: Document SoC compatible value for Armadillo-800 EVA
Date: Mon, 26 Feb 2018 19:03:42 +0100
Message-Id: <1519668225-12548-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The compatible property of the root node in a DTS for Atmark Techno
Armadillo-800 EVA should include the compatible value for the R-Mobile
A1 SoC, too.

Fixes: d2c2a0776899ba2d ("ARM: shmobile: Add platform device tree bindings documentation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 63edc11e83ef287f..ded2cd3b5f4df0c8 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -56,7 +56,7 @@ Boards:
   - APE6-EVM
     compatible = "renesas,ape6evm", "renesas,r8a73a4"
   - Atmark Techno Armadillo-800 EVA
-    compatible = "renesas,armadillo800eva"
+    compatible = "renesas,armadillo800eva", "renesas,r8a7740"
   - Blanche (RTP0RC7792SEB00010S)
     compatible = "renesas,blanche", "renesas,r8a7792"
   - BOCK-W
-- 
2.7.4
