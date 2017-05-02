Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751197AbdEBIf5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 04:35:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing
Date: Tue,  2 May 2017 10:35:49 +0200
Message-Id: <7b4ccb3c466f62bbf2f4dd5d6a143d945a6f3051.1493713942.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1493713942.git.horms+renesas@verge.net.au>
References: <cover.1493713942.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

If the R-Car RST driver is not included, compile-testing R-Car clock
drivers fails with a link error:

    undefined reference to `rcar_rst_read_mode_pins'

To fix this, provide a dummy version.  Use the exact same test logic as
in drivers/soc/renesas/Makefile, as there is no Kconfig symbol (yet) to
control compilation of the R-Car RST driver.

Fixes: 527c02f66d263d2e ("soc: renesas: Add R-Car RST driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/linux/soc/renesas/rcar-rst.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
index a18e0783946b..787e7ad53d45 100644
--- a/include/linux/soc/renesas/rcar-rst.h
+++ b/include/linux/soc/renesas/rcar-rst.h
@@ -1,6 +1,11 @@
 #ifndef __LINUX_SOC_RENESAS_RCAR_RST_H__
 #define __LINUX_SOC_RENESAS_RCAR_RST_H__
 
+#if defined(CONFIG_ARCH_RCAR_GEN1) || defined(CONFIG_ARCH_RCAR_GEN2) || \
+    defined(CONFIG_ARCH_R8A7795) || defined(CONFIG_ARCH_R8A7796)
 int rcar_rst_read_mode_pins(u32 *mode);
+#else
+static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
+#endif
 
 #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */
-- 
2.1.4
