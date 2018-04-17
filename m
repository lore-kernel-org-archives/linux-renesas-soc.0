Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:23406 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752580AbeDQUuN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 16:50:13 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: update register size in example
Date: Tue, 17 Apr 2018 22:49:58 +0200
Message-Id: <20180417204958.14723-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The datasheet have been expanded with more registers and the DT files
have been updated with the new size. This change updates the example so
writing new DT files can use the enchanted driver which uses the new
registers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/thermal/rcar-gen3-thermal.txt       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
index fdf5caa6229b4fff..39e7d4e61a63c038 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
@@ -27,9 +27,9 @@ Example:
 
 	tsc: thermal@e6198000 {
 		compatible = "renesas,r8a7795-thermal";
-		reg = <0 0xe6198000 0 0x68>,
-		      <0 0xe61a0000 0 0x5c>,
-		      <0 0xe61a8000 0 0x5c>;
+		reg = <0 0xe6198000 0 0x100>,
+		      <0 0xe61a0000 0 0x100>,
+		      <0 0xe61a8000 0 0x100>;
 		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.0
