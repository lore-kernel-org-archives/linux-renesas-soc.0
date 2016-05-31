Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41964 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752387AbcEaK5e (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:34 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 08/31] staging: ks7010: use kernel helper to print buffer
Date: Tue, 31 May 2016 12:56:20 +0200
Message-Id: <1464692203-4180-9-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

No need for an open coded one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/Makefile      |  2 +-
 drivers/staging/ks7010/ks7010_sdio.c |  9 +++++----
 drivers/staging/ks7010/ks_debug.c    | 30 ------------------------------
 drivers/staging/ks7010/ks_debug.h    |  2 --
 4 files changed, 6 insertions(+), 37 deletions(-)
 delete mode 100644 drivers/staging/ks7010/ks_debug.c

diff --git a/drivers/staging/ks7010/Makefile b/drivers/staging/ks7010/Makefile
index 32b0efc7bd00e8..f6a2cc8fd0276d 100644
--- a/drivers/staging/ks7010/Makefile
+++ b/drivers/staging/ks7010/Makefile
@@ -1,5 +1,5 @@
 obj-$(CONFIG_KS7010) += ks7010.o
 
 ccflags-y 	     += -DKS_WLAN_DEBUG=0
-ks7010-y	     := michael_mic.o ks_hostif.o ks_wlan_net.o ks_debug.o \
+ks7010-y	     := michael_mic.o ks_hostif.o ks_wlan_net.o \
 					ks7010_sdio.o ks7010_config.o
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 5b78522fad1ec1..1a1a43ff306aae 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -441,10 +441,11 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 
 	/* length check */
 	if(size > 2046 || size == 0){
-
-		DPRINTK(5,"-INVAILED DATA dump\n");
-		print_buffer(&rx_buffer->data[0],32);
-
+#ifdef KS_WLAN_DEBUG
+		if (KS_WLAN_DEBUG > 5)
+			print_hex_dump_bytes("INVALID DATA dump: ", DUMP_PREFIX_OFFSET,
+					     rx_buffer->data, 32);
+#endif
 		/* rx_status update */
 		read_status = READ_STATUS_IDLE;
 		retval = ks7010_sdio_write(priv, READ_STATUS, &read_status, sizeof(read_status));
diff --git a/drivers/staging/ks7010/ks_debug.c b/drivers/staging/ks7010/ks_debug.c
deleted file mode 100644
index 009f5f6df8f4e6..00000000000000
--- a/drivers/staging/ks7010/ks_debug.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- *   Driver for KeyStream 11b/g wireless LAN cards.
- *   
- *   ks_debug.c
- *   $Id: ks_debug.c 991 2009-09-14 01:38:58Z sekine $
- *
- *   Copyright (C) 2005-2008 KeyStream Corp.
- *   Copyright (C) 2009 Renesas Technology Corp.
- *
- *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
- */
-#include "ks_wlan.h"
-#include "ks_debug.h"
-
-void print_buffer(unsigned char *p, int length)
-{
-#ifdef KS_WLAN_DEBUG
-        int i;
-#define HEX_OFFSET "\
-           +0 +1 +2 +3 +4 +5 +6 +7 +8 +9 +A +B +C +D +E +F"
-        printk(HEX_OFFSET);
-        for (i=0; i<length; i++) {
-                if (i % 16 == 0) printk("\n%04X-%04X:", i, i+15);
-                printk(" %02X", *(p+i));
-        }
-        printk("\n");
-#endif
-}
diff --git a/drivers/staging/ks7010/ks_debug.h b/drivers/staging/ks7010/ks_debug.h
index 2fd5d8484b7f04..adad5f927dfda9 100644
--- a/drivers/staging/ks7010/ks_debug.h
+++ b/drivers/staging/ks7010/ks_debug.h
@@ -25,6 +25,4 @@
 #define DPRINTK(n, fmt, args...)
 #endif
 
-extern void print_buffer(unsigned char *p, int size);
-
 #endif /* _KS_DEBUG_H */
-- 
2.8.1
