Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12982 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbcEKFbY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:24 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id ED92B158014F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 98CE8A40248
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2 01/10] boot-mode-reg: Add core
Date: Wed, 11 May 2016 07:29:29 +0200
Message-ID: <1462944578-1220-2-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

The motivation for this new module is to add a small frame work to allow
kernel subsystems to obtain boot mode information from a centralised
source using a new, and hopefully soon well-known, API.

The new API consists of two function calls and nothing more:

boot_mode_reg_set: Should be called by platform-specific drivers
                   to register the boot mode register value which
		   they obtain from hardware or otherwise.

boot_mode_reg_get: Should be called by consumers; subsystems that
                   wish to know he boot mode register.

The boot mode register is a 32bit unsigned entity,
the meaning of its values are implementation dependent.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 MAINTAINERS                         |  1 +
 drivers/misc/Kconfig                |  1 +
 drivers/misc/Makefile               |  1 +
 drivers/misc/boot-mode-reg/Kconfig  | 11 ++++++
 drivers/misc/boot-mode-reg/Makefile |  6 +++
 drivers/misc/boot-mode-reg/core.c   | 76 +++++++++++++++++++++++++++++++++++++
 include/misc/boot-mode-reg.h        | 24 ++++++++++++
 7 files changed, 120 insertions(+)
 create mode 100644 drivers/misc/boot-mode-reg/Kconfig
 create mode 100644 drivers/misc/boot-mode-reg/Makefile
 create mode 100644 drivers/misc/boot-mode-reg/core.c
 create mode 100644 include/misc/boot-mode-reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 23e68db..e2bf6ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10734,6 +10734,7 @@ S:	Maintained
 F:	Documentation/sh/
 F:	arch/sh/
 F:	drivers/sh/
+F:	drivers/misc/boot-mode-reg/
 
 SUSPEND TO RAM
 M:	"Rafael J. Wysocki" <rjw@rjwysocki.net>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index a216b46..deba6b6 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -816,4 +816,5 @@ source "drivers/misc/mic/Kconfig"
 source "drivers/misc/genwqe/Kconfig"
 source "drivers/misc/echo/Kconfig"
 source "drivers/misc/cxl/Kconfig"
+source "drivers/misc/boot-mode-reg/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b2fb6dbf..d2a8ae4 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_BOOT_MODE_REG_CORE)	+= boot-mode-reg/
diff --git a/drivers/misc/boot-mode-reg/Kconfig b/drivers/misc/boot-mode-reg/Kconfig
new file mode 100644
index 0000000..3c4ddde
--- /dev/null
+++ b/drivers/misc/boot-mode-reg/Kconfig
@@ -0,0 +1,11 @@
+#
+# Boot Mode Register Drivers
+#
+
+config BOOT_MODE_REG_CORE
+	tristate "Boot Mode Register Core Driver"
+	default n
+	depends on ARCH_SHMOBILE || ARCH_RENESAS || COMPILE_TEST
+	help
+	  Say Y here to allow support for drivers to read boot mode
+	  registers and make the value available to other subsystems.
diff --git a/drivers/misc/boot-mode-reg/Makefile b/drivers/misc/boot-mode-reg/Makefile
new file mode 100644
index 0000000..19134b2
--- /dev/null
+++ b/drivers/misc/boot-mode-reg/Makefile
@@ -0,0 +1,6 @@
+
+#
+# Makefile for misc devices that really don't fit anywhere else.
+#
+
+obj-$(CONFIG_BOOT_MODE_REG_CORE)	+= core.o
diff --git a/drivers/misc/boot-mode-reg/core.c b/drivers/misc/boot-mode-reg/core.c
new file mode 100644
index 0000000..983bf4c
--- /dev/null
+++ b/drivers/misc/boot-mode-reg/core.c
@@ -0,0 +1,76 @@
+/*
+ * Boot Mode Register
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
+#include <asm/errno.h>
+
+#include <linux/export.h>
+#include <linux/module.h>
+
+#include <misc/boot-mode-reg.h>
+
+static DEFINE_MUTEX(boot_mode_mutex);
+static bool boot_mode_is_set;
+static u32 boot_mode;
+
+/**
+ * boot_mode_reg_get() - retrieve boot mode register value
+ * @mode: implementation-dependent boot mode register value
+ *
+ * Retrieves the boot mode register value previously registered
+ * using boot_mode_reg_set().
+ *
+ * return: 0 on success
+ */
+int boot_mode_reg_get(u32 *mode)
+{
+	int err = -ENOENT;
+
+	mutex_lock(&boot_mode_mutex);
+	if (boot_mode_is_set) {
+		*mode = boot_mode;
+		err = 0;
+	}
+	mutex_unlock(&boot_mode_mutex);
+	return err;
+}
+EXPORT_SYMBOL_GPL(boot_mode_reg_get);
+
+/**
+ * boot_mode_reg_set() - record boot mode register value
+ * @mode: implementation-dependent boot mode register value
+ *
+ * Records the boot mode register value which may subsequently
+ * be retrieved using boot_mode_reg_get().
+ *
+ * return: 0 on success
+ */
+int boot_mode_reg_set(u32 mode)
+{
+	int err = -EBUSY;
+
+	mutex_lock(&boot_mode_mutex);
+	if (!boot_mode_is_set) {
+		boot_mode = mode;
+		boot_mode_is_set = true;
+		err = 0;
+	}
+	mutex_unlock(&boot_mode_mutex);
+	return err;
+}
+EXPORT_SYMBOL_GPL(boot_mode_reg_set);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Simon Horman <horms@verge.net.au>");
+MODULE_DESCRIPTION("Core Boot Mode Register Driver");
diff --git a/include/misc/boot-mode-reg.h b/include/misc/boot-mode-reg.h
new file mode 100644
index 0000000..34ee653
--- /dev/null
+++ b/include/misc/boot-mode-reg.h
@@ -0,0 +1,24 @@
+/*
+ * Boot Mode Register
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
+#ifndef _BOOT_MODE_REG_H
+#define _BOOT_MODE_REG_H
+
+#include <linux/types.h>
+
+int boot_mode_reg_get(u32 *mode);
+int boot_mode_reg_set(u32 mode);
+
+#endif
-- 
2.8.0
