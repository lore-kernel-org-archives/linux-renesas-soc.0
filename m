Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44308 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751336AbeFDTFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 15:05:04 -0400
Received: by mail-lf0-f66.google.com with SMTP id 36-v6so24982630lfr.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jun 2018 12:05:03 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] dt-bindings: display: renesas: du: document R8A77980 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
Message-ID: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
Date: Mon, 4 Jun 2018 22:04:59 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
hardware seems the same as in the R-Car V3M (R8A77970).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'drm-next' branch of David Airlie's 'linux.git' repo.

 Documentation/devicetree/bindings/display/renesas,du.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/Documentation/devicetree/bindings/display/renesas,du.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/display/renesas,du.txt
+++ linux/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -14,6 +14,7 @@ Required Properties:
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
     - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
     - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
+    - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
     - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
 
   - reg: the memory-mapped I/O registers base address and length
@@ -60,6 +61,7 @@ corresponding to each DU output.
  R8A7795 (R-Car H3)   DPAD 0         HDMI 0         HDMI 1         LVDS 0
  R8A7796 (R-Car M3-W) DPAD 0         HDMI 0         LVDS 0         -
  R8A77970 (R-Car V3M) DPAD 0         LVDS 0         -              -
+ R8A77980 (R-Car V3H) DPAD 0         LVDS 0         -              -
  R8A77995 (R-Car D3)  DPAD 0         LVDS 0         LVDS 1         -
 
 
