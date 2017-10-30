Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:41018 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932502AbdJ3RaC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 13:30:02 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: shmobile: Document Renesas M3-W-based Salvator-XS board DT bindings
Date: Mon, 30 Oct 2017 18:29:57 +0100
Message-Id: <1509384599-28953-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas Salvator-XS (Salvator-X 2nd version) development board can
be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
pin-compatible.

Document board part number and compatible values for the version with
R-Car M3-W.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 9d277e3b0e8d34d0..c69f93af2d143278 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -126,6 +126,8 @@ Boards:
     compatible = "renesas,salvator-x", "renesas,r8a7796"
   - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
     compatible = "renesas,salvator-xs", "renesas,r8a7795"
+  - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
+    compatible = "renesas,salvator-xs", "renesas,r8a7796"
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
   - SK-RZG1E (YR8A77450S000BE)
-- 
2.7.4
