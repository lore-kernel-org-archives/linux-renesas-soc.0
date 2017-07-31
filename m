Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42967 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752462AbdGaPEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:04:39 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/5] dt-bindings: display: renesas: Add R-Car M3-W HDMI TX DT bindings
Date: Mon, 31 Jul 2017 17:04:27 +0200
Message-Id: <b2e2df8e7143682ae0888215e6cdb99da1a585c5.1501512759.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501512759.git.horms+renesas@verge.net.au>
References: <cover.1501512759.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The M3-W HDMI TX controller seems to be compatible for the H3. No
extension to the DT bindings are needed, add an SoC-specific compatible
string in case differences between the IP versions are found later and
require model-specific handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index 81b68580e199..83382a422f30 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -13,6 +13,7 @@ Required properties:
 
 - compatible : Shall contain one or more of
   - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
+  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
   - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 compatible HDMI TX
 
     When compatible with generic versions, nodes must list the SoC-specific
-- 
2.1.4
