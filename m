Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42014 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751708AbcEaK6D (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:58:03 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 31/31] staging: ks7010: cleanup file headers
Date: Tue, 31 May 2016 12:56:43 +0200
Message-Id: <1464692203-4180-32-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Remove svn-ids and fix typos in the licence declaration. Add my
copyright to the sdio code which I worked on mainly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/eap_packet.h    | 6 ------
 drivers/staging/ks7010/ks7010_sdio.c   | 8 +++-----
 drivers/staging/ks7010/ks7010_sdio.h   | 8 ++------
 drivers/staging/ks7010/ks_hostif.c     | 7 ++-----
 drivers/staging/ks7010/ks_hostif.h     | 7 ++-----
 drivers/staging/ks7010/ks_wlan.h       | 7 ++-----
 drivers/staging/ks7010/ks_wlan_ioctl.h | 7 ++-----
 drivers/staging/ks7010/ks_wlan_net.c   | 7 ++-----
 drivers/staging/ks7010/michael_mic.c   | 7 ++-----
 drivers/staging/ks7010/michael_mic.h   | 7 ++-----
 10 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/ks7010/eap_packet.h b/drivers/staging/ks7010/eap_packet.h
index 88384fb19d9580..16a392abdaec3b 100644
--- a/drivers/staging/ks7010/eap_packet.h
+++ b/drivers/staging/ks7010/eap_packet.h
@@ -1,9 +1,3 @@
-/*
- *
- *   eap_packet.h 
- *   $Id: eap_packet.h 991 2009-09-14 01:38:58Z sekine $
- *
- */
 #ifndef EAP_PACKET_H
 #define EAP_PACKET_H
 
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index c166022b652e3a..c340254cc895a0 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1,15 +1,13 @@
 /*
  *   Driver for KeyStream, KS7010 based SDIO cards.
  *
- *   ks7010_sdio.c
- *   $Id: ks7010_sdio.c 996 2009-09-14 02:54:21Z sekine $
- *
  *   Copyright (C) 2006-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
+ *   Copyright (C) 2016 Sang Engineering, Wolfram Sang
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #include <linux/workqueue.h>
diff --git a/drivers/staging/ks7010/ks7010_sdio.h b/drivers/staging/ks7010/ks7010_sdio.h
index 2d7be5dae157c7..987cfa724b9757 100644
--- a/drivers/staging/ks7010/ks7010_sdio.h
+++ b/drivers/staging/ks7010/ks7010_sdio.h
@@ -1,16 +1,12 @@
 /*
- *
  *   Driver for KeyStream, KS7010 based SDIO cards. 
- *   
- *   ks7010_sdio.h
- *   $Id: ks7010_sdio.h 1019 2009-09-28 05:41:07Z sekine $
  *
  *   Copyright (C) 2006-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 #ifndef _KS7010_SDIO_H
 #define _KS7010_SDIO_H
diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index f2a65c0ae630a2..a8822fe2bd6029 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream wireless LAN cards.
  *
- *   ks_hostif.c
- *   $Id: ks_hostif.c 996 2009-09-14 02:54:21Z sekine $
- *
  *   Copyright (C) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #include "ks_wlan.h"
diff --git a/drivers/staging/ks7010/ks_hostif.h b/drivers/staging/ks7010/ks_hostif.h
index 01de478d45ea60..dc806b5b47be8b 100644
--- a/drivers/staging/ks7010/ks_hostif.h
+++ b/drivers/staging/ks7010/ks_hostif.h
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream wireless LAN
  *   
- *   ks_hostif.h
- *   $Id: ks_hostif.h 994 2009-09-14 01:51:16Z sekine $
- *
  *   Copyright (c) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #ifndef _KS_HOSTIF_H_
diff --git a/drivers/staging/ks7010/ks_wlan.h b/drivers/staging/ks7010/ks_wlan.h
index a2126c2e728d2d..c42d99c6bc1fb2 100644
--- a/drivers/staging/ks7010/ks_wlan.h
+++ b/drivers/staging/ks7010/ks_wlan.h
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream IEEE802.11 b/g wireless LAN cards.
- *   
- *   ks_wlan.h
- *   $Id: ks_wlan.h 994 2009-09-14 01:51:16Z sekine $
  *
  *   Copyright (C) 2006-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #ifndef _KS_WLAN_H
diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index cc4669eddcc1f7..f1fb2dd9a1bd3b 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream 11b/g wireless LAN
  *   
- *   ks_wlan_ioctl.h
- *   $Id: ks_wlan_ioctl.h 996 2009-09-14 02:54:21Z sekine $
- *
  *   Copyright (c) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #ifndef _KS_WLAN_IOCTL_H
diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index ac3354bf6f8c8a..8ef0f111cf39b1 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream 11b/g wireless LAN
  *
- *   ks_wlan_net.c
- *   $Id: ks_wlan_net.c 1020 2009-09-28 05:48:31Z sekine $
- *
  *   Copyright (C) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #include <linux/version.h>
diff --git a/drivers/staging/ks7010/michael_mic.c b/drivers/staging/ks7010/michael_mic.c
index adb17df46f939b..e14c109b3cabd0 100644
--- a/drivers/staging/ks7010/michael_mic.c
+++ b/drivers/staging/ks7010/michael_mic.c
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream wireless LAN
  *
- *   michael_mic.c
- *   $Id: michael_mic.c 991 2009-09-14 01:38:58Z sekine $
- *
  *   Copyright (C) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 #include <linux/types.h>
diff --git a/drivers/staging/ks7010/michael_mic.h b/drivers/staging/ks7010/michael_mic.h
index 57ecbe34153202..c7e4eb28096107 100644
--- a/drivers/staging/ks7010/michael_mic.h
+++ b/drivers/staging/ks7010/michael_mic.h
@@ -1,15 +1,12 @@
 /*
  *   Driver for KeyStream wireless LAN
- *   
- *   michael_mic.h
- *   $Id: michael_mic.h 991 2009-09-14 01:38:58Z sekine $
  *
  *   Copyright (C) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
  *   This program is free software; you can redistribute it and/or modify
- *   it undr the terms of the GNU General Public License version 2 as
- *   published by the Free Sotware Foundation.
+ *   it under the terms of the GNU General Public License version 2 as
+ *   published by the Free Software Foundation.
  */
 
 /* MichelMIC routine define */
-- 
2.8.1
