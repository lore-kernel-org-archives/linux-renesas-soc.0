Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 02/16] dt-bindings: display: renesas: lvds: Document r8a77990 bindings
Date: Tue,  4 Sep 2018 15:10:13 +0300
Message-Id: <20180904121027.24031-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The E3 (r8a77990) supports two LVDS channels. Extend the binding to
support them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index 5a4e379bb414..13af7e2ac7e8 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -15,6 +15,7 @@ Required properties:
   - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
   - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
   - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS encoders
+  - "renesas,r8a77990-lvds" for R8A77990 (R-Car E3) compatible LVDS encoders
   - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
 
 - reg: Base address and length for the memory-mapped registers
-- 
Regards,

Laurent Pinchart
