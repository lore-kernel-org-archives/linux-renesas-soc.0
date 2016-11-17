Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965200AbcKQRnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:43:05 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/18] arm64: dts: m3ulcb: add M3ULCB board DT bindings
Date: Thu, 17 Nov 2016 15:04:45 +0100
Message-Id: <dced269484618df9619d9e2d169a441614bb7a5c.1479388193.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479388193.git.horms+renesas@verge.net.au>
References: <cover.1479388193.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Add M3ULCB Device tree bindings Documentation, listing it as a supported
board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 968ae9a05440..9a3c2631d0d4 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -61,6 +61,8 @@ Boards:
     compatible = "renesas,kzm9g", "renesas,sh73a0"
   - Lager (RTP0RC7790SEB00010S)
     compatible = "renesas,lager", "renesas,r8a7790"
+  - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
+    compatible = "renesas,m3ulcb", "renesas,r8a7796";
   - Marzen
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
-- 
2.7.0.rc3.207.g0ac5344
