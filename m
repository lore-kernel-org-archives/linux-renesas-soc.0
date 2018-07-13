Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:57760 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726824AbeGMJr5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 05:47:57 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt: serial: Add Renesas RZ/N1 binding documentation
Date: Fri, 13 Jul 2018 10:33:48 +0100
Message-Id: <1531474429-17146-2-git-send-email-phil.edworthy@renesas.com>
In-Reply-To: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
References: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The RZ/N1 UART is a modified Synopsys DesignWare UART.
The modifications only relate to DMA so you could actually use the
controller with the Synopsys compatible string if you are not using
DMA, but you should not do so.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v2:
 - Change "renesas,<peripheral>-<family-or-device>" to
   "renesas,<family-or-device>-<peripheral>"
---
 Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt b/Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt
new file mode 100644
index 0000000..8b9e0d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt
@@ -0,0 +1,10 @@
+Renesas RZ/N1 UART
+
+This controller is based on the Synopsys DesignWare ABP UART and inherits all
+properties defined in snps-dw-apb-uart.txt except for the compatible property.
+
+Required properties:
+- compatible : The device specific string followed by the generic RZ/N1 string.
+   Therefore it must be one of:
+   "renesas,r9a06g032-uart", "renesas,rzn1-uart"
+   "renesas,r9a06g033-uart", "renesas,rzn1-uart"
-- 
2.7.4
