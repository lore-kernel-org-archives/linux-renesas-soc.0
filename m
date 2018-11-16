Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:34207 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbeKPRcc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 12:32:32 -0500
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        wsa@the-dreams.de
Cc: Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 1/4] pinctrl: sh-pfc: Add physical pin multiplexing helper macros
Date: Fri, 16 Nov 2018 15:20:48 +0800
Message-Id: <1542352851-25393-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
References: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Used by I2C controllers 0, 3 and 5 in R8A7795 and R8A7796 SoCs.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 1fc1336..6bb9c6b 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -386,6 +386,28 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PINMUX_DATA(fn##_MARK, FN_##msel, FN_##fn, FN_##ipsr)
 
 /*
+ * Describe a pinmux configuration similar to PINMUX_IPSR_MSEL, but with
+ * an additional select register that controls physical multiplexing
+ * with another pin.
+ *   - ipsr: IPSR field
+ *   - fn: Function name, also referring to the IPSR field
+ *   - msel1: Physical multiplexing selector
+ *   - msel2: Module selector
+ */
+#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \
+	PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
+
+/*
+ * Describe a pinmux configuration in which a pin is physically multiplexed
+ * with other pins.
+ *   - ipsr: IPSR field
+ *   - fn: Function name, also referring to the IPSR field
+ *   - msel: Phyiscal multiplexing selector
+ */
+#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
+	PINMUX_DATA(fn##_MARK, FN_##msel)
+
+/*
  * Describe a pinmux configuration for a single-function pin with GPIO
  * capability.
  *   - fn: Function name
-- 
2.7.4
