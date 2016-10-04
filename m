Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:34490 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbcJDNU4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 09:20:56 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: shmobile: r8a7794/alt: Add board part number to DT bindings
Date: Tue,  4 Oct 2016 15:20:47 +0200
Message-Id: <1475587248-13670-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1475587248-13670-1-git-send-email-geert+renesas@glider.be>
References: <1475587248-13670-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 19f0a9e4302b508c..6c3ffc2ebeaa346a 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -35,7 +35,7 @@ SoCs:
 
 Boards:
 
-  - Alt
+  - Alt (RTP0RC7794SEB00010S)
     compatible = "renesas,alt", "renesas,r8a7794"
   - APE6-EVM
     compatible = "renesas,ape6evm", "renesas,r8a73a4"
-- 
1.9.1
