Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12989 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbcEKFb0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:26 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 79D9A158020A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:24 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 226982E402BB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:24 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 02/10] boot-mode-reg: Add R-Car driver
Date: Wed, 11 May 2016 07:29:30 +0200
Message-ID: <1462944578-1220-3-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

Boot mode register driver for R-Car.

If running on a supported platform it reads the boot mode register and
records it using the boot mode register infrastructure established by an
earlier patch.

rcar_init_boot_mode() is exported allow it to be explicitly called in
cases where the boot mode register is needed before init calls are made.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/misc/boot-mode-reg/Kconfig  |  8 +++++
 drivers/misc/boot-mode-reg/Makefile |  1 +
 drivers/misc/boot-mode-reg/rcar.c   | 60 +++++++++++++++++++++++++++++++++++++
 include/misc/boot-mode-reg.h        |  3 ++
 4 files changed, 72 insertions(+)
 create mode 100644 drivers/misc/boot-mode-reg/rcar.c

diff --git a/drivers/misc/boot-mode-reg/Kconfig b/drivers/misc/boot-mode-reg/Kconfig
index 3c4ddde..3868c36 100644
--- a/drivers/misc/boot-mode-reg/Kconfig
+++ b/drivers/misc/boot-mode-reg/Kconfig
@@ -9,3 +9,11 @@ config BOOT_MODE_REG_CORE
 	help
 	  Say Y here to allow support for drivers to read boot mode
 	  registers and make the value available to other subsystems.
+
+config BOOT_MODE_REG_RCAR
+	tristate "Boot Mode Register Driver for Renesas R-Car SoCs"
+	default n
+	select BOOT_MODE_REG_CORE
+	help
+	  Say Y here to allow support for reading the boot mode register
+	  on Renesas R-Car SoCs.
diff --git a/drivers/misc/boot-mode-reg/Makefile b/drivers/misc/boot-mode-reg/Makefile
index 19134b2..5469a1d 100644
--- a/drivers/misc/boot-mode-reg/Makefile
+++ b/drivers/misc/boot-mode-reg/Makefile
@@ -4,3 +4,4 @@
 #
 
 obj-$(CONFIG_BOOT_MODE_REG_CORE)	+= core.o
+obj-$(CONFIG_BOOT_MODE_REG_RCAR)	+= rcar.o
diff --git a/drivers/misc/boot-mode-reg/rcar.c b/drivers/misc/boot-mode-reg/rcar.c
new file mode 100644
index 0000000..c3b778fe
--- /dev/null
+++ b/drivers/misc/boot-mode-reg/rcar.c
@@ -0,0 +1,60 @@
+/*
+ * R-Car Boot Mode Register Driver
+ *
+ * Copyright (C) 2015 Simon Horman
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <misc/boot-mode-reg.h>
+
+#define MODEMR 0xe6160060
+
+static int __init rcar_read_mode_pins(void)
+{
+	void __iomem *modemr;
+	int err = -ENOMEM;
+	static u32 mode;
+
+	modemr = ioremap_nocache(MODEMR, 4);
+	if (!modemr) {
+		pr_err("failed to map boot mode register");
+		goto err;
+	}
+	mode = ioread32(modemr);
+	iounmap(modemr);
+
+	err = boot_mode_reg_set(mode);
+err:
+	if (err)
+		pr_err("failed to initialise boot mode");
+	return err;
+}
+
+int __init rcar_init_boot_mode(void)
+{
+	if (of_machine_is_compatible("renesas,r8a7790") ||
+	    of_machine_is_compatible("renesas,r8a7791") ||
+	    of_machine_is_compatible("renesas,r8a7792") ||
+	    of_machine_is_compatible("renesas,r8a7793") ||
+	    of_machine_is_compatible("renesas,r8a7794"))
+		return rcar_read_mode_pins();
+
+	return 0;
+}
+early_initcall(rcar_init_boot_mode);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Simon Horman <horms@verge.net.au>");
+MODULE_DESCRIPTION("R-Car Boot Mode Register Driver");
diff --git a/include/misc/boot-mode-reg.h b/include/misc/boot-mode-reg.h
index 34ee653..35d7f57 100644
--- a/include/misc/boot-mode-reg.h
+++ b/include/misc/boot-mode-reg.h
@@ -21,4 +21,7 @@
 int boot_mode_reg_get(u32 *mode);
 int boot_mode_reg_set(u32 mode);
 
+/* Allow explicit initialisation before initcalls */
+int rcar_init_boot_mode(void);
+
 #endif
-- 
2.8.0
