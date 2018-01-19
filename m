Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35936 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755940AbeASSf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 13:35:58 -0500
Received: by mail-lf0-f68.google.com with SMTP id t79so3209871lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 10:35:57 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180119183553.649510876@cogentembedded.com>
Date: Fri, 19 Jan 2018 21:29:20 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/3] DT: display: renesas,lvds: document R8A77970 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=DT-display-renesas,lvds-document-R8A77970-bindings.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3M (R8A77970) SoC in the R-Car LVDS bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ linux/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -13,6 +13,7 @@ Required properties:
   - "renesas,r8a7793-lvds" for R8A7791 (R-Car M2-N) compatible LVDS encoders
   - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
   - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
+  - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
 
 - reg: Base address and length for the memory-mapped registers
 - clocks: A phandle + clock-specifier pair for the functional clock
