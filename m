Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52856 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726547AbeJCSAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 14:00:34 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-serial@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Add r8a77990 support
Date: Wed,  3 Oct 2018 13:12:19 +0200
Message-Id: <20181003111219.2334-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds the R-Car E3 serial documentation.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
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
2.19.0
