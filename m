Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:44254 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752144AbeFEU3B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 16:29:01 -0400
Received: by mail-lf0-f67.google.com with SMTP id 36-v6so5594344lfr.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 13:29:01 -0700 (PDT)
Subject: [PATCH 1/2] dt-bindings: display: renesas: lvds: document R8A77980
 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
References: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Message-ID: <bd7295cd-ac3c-a01a-683a-f2e324469bcb@cogentembedded.com>
Date: Tue, 5 Jun 2018 23:28:58 +0300
MIME-Version: 1.0
In-Reply-To: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC in the R-Car LVDS bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt |    1 +
 1 file changed, 1 insertion(+)

Index: drm/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
===================================================================
--- drm.orig/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ drm/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -14,6 +14,7 @@ Required properties:
   - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
   - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
   - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
+  - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS encoders
   - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
 
 - reg: Base address and length for the memory-mapped registers
