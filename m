Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36475 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752551AbdIAWIr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2017 18:08:47 -0400
Received: by mail-lf0-f50.google.com with SMTP id z12so5100359lfd.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Sep 2017 15:08:46 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170901220842.577848904@cogentembedded.com>
Date: Sat, 02 Sep 2017 01:08:30 +0300
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] serial: sh-sci: document R8A77970 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=serial-sh-sci-document-R8A77970-bindings-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible SCIF and HSCIF
ports, so document the SoC specific bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: tty/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
===================================================================
--- tty.orig/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ tty/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -41,6 +41,8 @@ Required properties:
     - "renesas,hscif-r8a7795" for R8A7795 (R-Car H3) HSCIF compatible UART.
     - "renesas,scif-r8a7796" for R8A7796 (R-Car M3-W) SCIF compatible UART.
     - "renesas,hscif-r8a7796" for R8A7796 (R-Car M3-W) HSCIF compatible UART.
+    - "renesas,scif-r8a77970" for R8A77970 (R-Car V3M) SCIF compatible UART.
+    - "renesas,hscif-r8a77970" for R8A77970 (R-Car V3M) HSCIF compatible UART.
     - "renesas,scif-r8a77995" for R8A77995 (R-Car D3) SCIF compatible UART.
     - "renesas,hscif-r8a77995" for R8A77995 (R-Car D3) HSCIF compatible UART.
     - "renesas,scifa-sh73a0" for SH73A0 (SH-Mobile AG5) SCIFA compatible UART.
