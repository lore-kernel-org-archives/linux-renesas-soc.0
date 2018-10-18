Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45412 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbeJRIkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 04:40:03 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/3] dt-bindings: display: renesas: lvds: Document r8a77965 bindings
Date: Thu, 18 Oct 2018 03:41:47 +0300
Message-Id: <20181018004149.29448-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181018004149.29448-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20181018004149.29448-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The M3-N (r8a77965) includes one LVDS encoder. Extend the binding to
support it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index 3aeb0ec06fd0..ba5469dd09f3 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -13,6 +13,7 @@ Required properties:
   - "renesas,r8a7793-lvds" for R8A7793 (R-Car M2-N) compatible LVDS encoders
   - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
   - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
+  - "renesas,r8a77965-lvds" for R8A77965 (R-Car M3-N) compatible LVDS encoders
   - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
   - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS encoders
   - "renesas,r8a77990-lvds" for R8A77990 (R-Car E3) compatible LVDS encoders
-- 
Regards,

Laurent Pinchart
