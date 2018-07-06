Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:40967 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932575AbeGFPQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 11:16:25 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: r9a06g032: don't build SMP fiiles for non-SMP config
Date: Fri,  6 Jul 2018 17:16:01 +0200
Message-Id: <20180706151610.3783638-1-arnd@arndb.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Without CONFIG_SMP, we get a build failure:

In file included from include/linux/byteorder/little_endian.h:5,
                 from arch/arm/include/uapi/asm/byteorder.h:22,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/arm/include/asm/bitops.h:342,
                 from include/linux/bitops.h:18,
                 from include/linux/kernel.h:11,
                 from include/asm-generic/bug.h:18,
                 from arch/arm/include/asm/bug.h:60,
                 from include/linux/bug.h:5,
                 from include/linux/io.h:23,
                 from drivers/soc/renesas/r9a06g032-smp.c:11:
drivers/soc/renesas/r9a06g032-smp.c: In function 'r9a06g032_smp_boot_secondary':
drivers/soc/renesas/r9a06g032-smp.c:43:21: error: 'secondary_startup' undeclared (first use in this function)
  writel(__pa_symbol(secondary_startup), cpu_bootaddr);
                     ^~~~~~~~~~~~~~~~~

This makes the compilation of that file conditional on SMP support.
It would probably be better for consistency to leave that file
in arch/arm/mach-shmobile/, matching what we do for all other smp
operations.

Fixes: cde4f86f9249 ("arm: shmobile: Add the R9A06G032 SMP enabler driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/renesas/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 44a0d6b10192..c37b0803c1b6 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -18,7 +18,9 @@ obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
 obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
 obj-$(CONFIG_SYSC_R8A77990)	+= r8a77990-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
+ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
+endif
 
 # Family
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
-- 
2.9.0
