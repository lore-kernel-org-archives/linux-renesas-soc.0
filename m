Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47156 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753272AbdBTROV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 12:14:21 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Mon, 20 Feb 2017 18:13:04 +0100
Message-Id: <1487610788-6939-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add dt-bindings for Renesas r7s72100 pin controller header file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
new file mode 100644
index 0000000..24759bf
--- /dev/null
+++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
@@ -0,0 +1,30 @@
+/*
+ * Defines macros and constants for Renesas RZ/A1 pin controller pin
+ * muxing functions.
+ */
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+
+#define RZA1_PINS_PER_PORT	16
+
+/* Create the pin index from it's bank and position numbers */
+#define PIN(b, p)		((b) * RZA1_PINS_PER_PORT + (p))
+
+/* Flags to apply to alternate function configuration */
+/*
+ * Pin needs input buffer enabled.
+ * This applies to pin which alternate function requires input capabilities.
+ * Eg: RX pin on a serial interface needs this flag to be set.
+ */
+#define INPUT_EN		(1 << 3)
+
+/*
+ * Let software drive the pin I/O direction overriding the alternate function
+ * configuration.
+ * Some alternate function requires software to force I/O direction of a pin,
+ * ovverriding the designated one.
+ * Reference to the HW manual to know when this flag shall be used.
+ */
+#define SWIO			(1 << 4)
+
+#endif
-- 
2.7.4
