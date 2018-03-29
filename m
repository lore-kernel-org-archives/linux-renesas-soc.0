Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13360 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751750AbeC2Hvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Mar 2018 03:51:33 -0400
From: Michel Pollet <michel.pollet@bp.renesas.com>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com,
        Michel Pollet <buserror+upstream@gmail.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v3 1/8] DT: mfd: renesas,rzn1-sysctrl: document RZ/N1 sysctrl node
Date: Thu, 29 Mar 2018 08:46:57 +0100
Message-Id: <1522309629-10152-2-git-send-email-michel.pollet@bp.renesas.com>
In-Reply-To: <1522309629-10152-1-git-send-email-michel.pollet@bp.renesas.com>
References: <1522309629-10152-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas RZ/N1 Family (Part #R9A06G0xx) has a multi-function
system controller. This documents the node used to encapsulate
it's sub drivers.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 .../devicetree/bindings/mfd/renesas,rzn1-sysctrl.txt  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,rzn1-sysctrl.txt

diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzn1-sysctrl.txt b/Documentation/devicetree/bindings/mfd/renesas,rzn1-sysctrl.txt
new file mode 100644
index 0000000..1dbfdaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,rzn1-sysctrl.txt
@@ -0,0 +1,19 @@
+DT bindings for the Renesas RZ/N1 System Controller
+
+== System Controller Node ==
+
+The system controller node currently only hosts a single sub-node to handle
+the rebooting of the CPU. Eventually it will host the clock driver, SMP
+start handler, watchdog etc.
+
+See renesas,rzn1-reboot.txt for further details.
+
+Bindings:
++ Required:
+	compatible = "renesas,rzn1-sysctrl", "syscon", "simple-mfd";
+
+Example:
+	sysctrl: sysctrl@4000c000 {
+		compatible = "renesas,rzn1-sysctrl", "syscon", "simple-mfd";
+		reg = <0x4000c000 0x1000>;
+	};
-- 
2.7.4
