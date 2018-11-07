Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:46888 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbeKGXUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 18:20:30 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jiri Kosina <trivial@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [trivial] mfd: tmio: Typo s/use use/use/
Date: Wed,  7 Nov 2018 14:50:01 +0100
Message-Id: <20181107135001.14543-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/mfd/tmio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index 1e70060c92ce0a11..aa696bcb1d12e750 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -83,7 +83,7 @@
 /* Some controllers have a CBSY bit */
 #define TMIO_MMC_HAVE_CBSY		BIT(11)
 
-/* Some controllers that support HS400 use use 4 taps while others use 8. */
+/* Some controllers that support HS400 use 4 taps while others use 8. */
 #define TMIO_MMC_HAVE_4TAP_HS400	BIT(13)
 
 int tmio_core_mmc_enable(void __iomem *cnf, int shift, unsigned long base);
-- 
2.17.1
