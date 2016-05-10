Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57058 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751700AbcEJNyq (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:46 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/27] staging: ks7010: delete seperate debug header
Date: Tue, 10 May 2016 15:52:22 +0200
Message-Id: <1462888360-21649-10-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Move the one debug macro to the generic wlan header.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_config.c |  1 -
 drivers/staging/ks7010/ks7010_sdio.c   |  1 -
 drivers/staging/ks7010/ks_debug.h      | 28 ----------------------------
 drivers/staging/ks7010/ks_hostif.c     |  1 -
 drivers/staging/ks7010/ks_wlan.h       |  7 +++++++
 drivers/staging/ks7010/ks_wlan_net.c   |  1 -
 6 files changed, 7 insertions(+), 32 deletions(-)
 delete mode 100644 drivers/staging/ks7010/ks_debug.h

diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index abe99a52ae1ad8..7f273dafaf3583 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -4,7 +4,6 @@
 #include "ks_wlan.h"
 #include "ks_hostif.h"
 #include "ks_wlan_ioctl.h"
-#include "ks_debug.h"
 
 static int wep_on_off;
 #define	WEP_OFF		0
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 1a1a43ff306aae..3fb432c9dd314d 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -19,7 +19,6 @@
 
 #include "ks_wlan.h"
 #include "ks_wlan_ioctl.h"
-#include "ks_debug.h"
 #include "ks_hostif.h"
 
 #include "ks7010_sdio.h"
diff --git a/drivers/staging/ks7010/ks_debug.h b/drivers/staging/ks7010/ks_debug.h
deleted file mode 100644
index adad5f927dfda9..00000000000000
--- a/drivers/staging/ks7010/ks_debug.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- *   Driver for KeyStream 11b/g wireless LAN cards.
- *   
- *   ks_debug.h
- *   $Id: ks_debug.h 991 2009-09-14 01:38:58Z sekine $
- *
- *   Copyright (C) 2005-2008 KeyStream Corp.
- *   Copyright (C) 2009 Renesas Technology Corp.
- *
- *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
- */
-
-#ifndef _KS_DEBUG_H
-#define _KS_DEBUG_H
-
-#include <linux/kernel.h>
-
-
-#ifdef KS_WLAN_DEBUG
-#define DPRINTK(n, fmt, args...) \
-                 if (KS_WLAN_DEBUG>(n)) printk(KERN_NOTICE "%s: "fmt, __FUNCTION__, ## args)
-#else
-#define DPRINTK(n, fmt, args...)
-#endif
-
-#endif /* _KS_DEBUG_H */
diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 146a1357909b39..367d487cef1ba8 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -13,7 +13,6 @@
  */
 
 #include "ks_wlan.h"
-#include "ks_debug.h"
 #include "ks_hostif.h"
 #include "eap_packet.h"
 #include "michael_mic.h"
diff --git a/drivers/staging/ks7010/ks_wlan.h b/drivers/staging/ks7010/ks_wlan.h
index 6bd016414a4f1d..c460741c6606ee 100644
--- a/drivers/staging/ks7010/ks_wlan.h
+++ b/drivers/staging/ks7010/ks_wlan.h
@@ -38,6 +38,13 @@
 
 #include "ks7010_sdio.h"
 
+#ifdef KS_WLAN_DEBUG
+#define DPRINTK(n, fmt, args...) \
+                 if (KS_WLAN_DEBUG>(n)) printk(KERN_NOTICE "%s: "fmt, __FUNCTION__, ## args)
+#else
+#define DPRINTK(n, fmt, args...)
+#endif
+
 struct ks_wlan_parameter {
 	uint8_t		operation_mode;	   /* Operation Mode */
 	uint8_t		channel;	   /*  Channel */
diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 776a544031495f..1da2768ea9f31b 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -40,7 +40,6 @@ static int wep_on_off;
 #include "ks_wlan.h"
 #include "ks_hostif.h"
 #include "ks_wlan_ioctl.h"
-#include "ks_debug.h"
 
 /* Include Wireless Extension definition and check version */
 #include <linux/wireless.h>
-- 
2.8.1
