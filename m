Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:36736 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751186AbeBZSDs (ORCPT
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
Subject: [PATCH 4/4] dt-bindings: arm: Document Renesas R-Car M3-N-based Salvator-XS board
Date: Mon, 26 Feb 2018 19:03:45 +0100
Message-Id: <1519668225-12548-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas Salvator-XS development board can be equipped with an R-Car
H3, M3-W, or M3-N SiP, which are pin-compatible.

Document board part number and compatible values for the version with
R-Car M3-N.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 51e4428856be4557..303f04e639431837 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -114,6 +114,8 @@ Boards:
     compatible = "renesas,salvator-xs", "renesas,r8a7795"
   - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
     compatible = "renesas,salvator-xs", "renesas,r8a7796"
+  - Salvator-XS (Salvator-X 2nd version, RTP0RC77965SIPB012S)
+    compatible = "renesas,salvator-xs", "renesas,r8a77965"
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
   - SK-RZG1E (YR8A77450S000BE)
-- 
2.7.4
