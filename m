Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbeERLSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/6] dt-bindings: arm: Document Renesas Ebisu board DT bindings
Date: Fri, 18 May 2018 13:16:45 +0200
Message-Id: <d2ba004b0341e63dc49f640ddd8e79c764ff16c8.1526549153.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526549153.git.horms+renesas@verge.net.au>
References: <cover.1526549153.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch adds device tree bindings documentation for Renesas
Ebisu board (RTP0RC77990SEB0010S).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index e1a24708a284..804f1d7c1f2b 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -69,6 +69,8 @@ Boards:
     compatible = "renesas,draak", "renesas,r8a77995"
   - Eagle (RTP0RC77970SEB0010S)
     compatible = "renesas,eagle", "renesas,r8a77970"
+  - Ebisu (RTP0RC77990SEB0010S)
+    compatible = "renesas,ebisu", "renesas,r8a77990"
   - Genmai (RTK772100BC00000BR)
     compatible = "renesas,genmai", "renesas,r7s72100"
   - GR-Peach (X28A-M01-E/F)
-- 
2.11.0
