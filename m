Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:59396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbeINOYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 10:24:13 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 01/16] dt-bindings: display: renesas: du: Document r8a77990 bindings
Date: Fri, 14 Sep 2018 12:10:31 +0300
Message-Id: <20180914091046.483-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the E3 (r8a77990) SoC in the R-Car DU bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index caae2348a292..9de67be632d1 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -16,6 +16,7 @@ Required Properties:
     - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
     - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
     - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
+    - "renesas,du-r8a77990" for R8A77990 (R-Car E3) compatible DU
     - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
 
   - reg: the memory-mapped I/O registers base address and length
@@ -63,6 +64,7 @@ corresponding to each DU output.
  R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
  R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
  R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
+ R8A77990 (R-Car E3)    DPAD 0         LVDS 0         LVDS 1         -
  R8A77995 (R-Car D3)    DPAD 0         LVDS 0         LVDS 1         -
 
 
-- 
Regards,

Laurent Pinchart
