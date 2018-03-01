Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34111 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033196AbeCASIo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 13:08:44 -0500
Received: by mail-lf0-f67.google.com with SMTP id l191so9639147lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Mar 2018 10:08:44 -0800 (PST)
Subject: [PATCH v2 1/2] DT: display: renesas,lvds: document R8A77970 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
References: <df9de4e7-cf72-cdb5-5111-9fd616f51509@cogentembedded.com>
Message-ID: <d79e6c1f-a3ee-68ca-8889-111571cb32a7@cogentembedded.com>
Date: Thu, 1 Mar 2018 21:08:41 +0300
MIME-Version: 1.0
In-Reply-To: <df9de4e7-cf72-cdb5-5111-9fd616f51509@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3M (R8A77970) SoC in the R-Car LVDS bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
Changes in version 2:
- added Rob's and Laurent's tags.

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
