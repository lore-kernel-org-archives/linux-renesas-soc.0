Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42196 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727161AbeIRPle (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 11:41:34 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT] serial: sh-sci: Add r8a77990 support
Date: Tue, 18 Sep 2018 12:09:32 +0200
Message-Id: <20180918100932.16304-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds the R-Car E3 serial documentation.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I cannot test this. But we have other devices added for E3 meanwhile, so
people surely used a console to do that? Can somebody confirm this?
After that I'll send a proper patch to linux-serial list, too.

 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index eaca9da79d83..0873dc043d4d 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -50,6 +50,8 @@ Required properties:
     - "renesas,hscif-r8a77970" for R8A77970 (R-Car V3M) HSCIF compatible UART.
     - "renesas,scif-r8a77980" for R8A77980 (R-Car V3H) SCIF compatible UART.
     - "renesas,hscif-r8a77980" for R8A77980 (R-Car V3H) HSCIF compatible UART.
+    - "renesas,scif-r8a77990" for R8A77990 (R-Car E3) SCIF compatible UART.
+    - "renesas,hscif-r8a77990" for R8A77990 (R-Car E3) HSCIF compatible UART.
     - "renesas,scif-r8a77995" for R8A77995 (R-Car D3) SCIF compatible UART.
     - "renesas,hscif-r8a77995" for R8A77995 (R-Car D3) HSCIF compatible UART.
     - "renesas,scifa-sh73a0" for SH73A0 (SH-Mobile AG5) SCIFA compatible UART.
-- 
2.18.0
