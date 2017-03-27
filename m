Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52653 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752815AbdC0J5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2017 05:57:34 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Document the vsps property in the DT bindings
Date: Mon, 27 Mar 2017 12:56:52 +0300
Message-Id: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The property is used by the driver but is missing from the DT bindings.
Document it.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index 1a02f099a0ff..cf34893a1b53 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -36,6 +36,11 @@ Required Properties:
       When supplied they must be named "dclkin.x" with "x" being the input
       clock numerical index.
 
+Optional Properties:
+
+  - vsps: A list of phandles to the VSP nodes that handle the memory
+    interfaces for the DU channels (Gen3 only).
+
 Required nodes:
 
 The connections to the DU output video ports are modeled using the OF graph
-- 
Regards,

Laurent Pinchart
