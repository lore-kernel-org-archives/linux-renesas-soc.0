Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36636 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751735AbeDZTlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 15:41:20 -0400
Received: by mail-lf0-f66.google.com with SMTP id w8-v6so436232lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 12:41:19 -0700 (PDT)
To: Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] DT: net: can: rcar_canfd: document R8A77970 bindings
Message-ID: <7a3d170f-1d3a-a807-9256-15fe1a78ca4e@cogentembedded.com>
Date: Thu, 26 Apr 2018 22:41:14 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3M (R8A77970) SoC support in the R-Car CAN-FD bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'linux-can-next.git' repo but I wouldn't object if
it's merged to the 'linux-can.git' repo instead. :-)

 Documentation/devicetree/bindings/net/can/rcar_canfd.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux-can-next/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
===================================================================
--- linux-can-next.orig/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ linux-can-next/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -6,6 +6,7 @@ Required properties:
   - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
   - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
   - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3) compatible controller.
+  - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
 
   When compatible with the generic version, nodes must list the
   SoC-specific version corresponding to the platform first, followed by the
