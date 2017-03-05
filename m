Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35411 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751863AbdCEVyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 16:54:32 -0500
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        Matthew Giassa <matthew@giassa.net>
Subject: [PATCH 1/2] Formatting updates to remove checkpatch warnings in ks_wlan_ioctl.h.
Date: Sun,  5 Mar 2017 13:52:19 -0800
Message-Id: <1488750740-2091-1-git-send-email-matthew@giassa.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Implementing some minor formatting changes to remove checkpatch warnings.
Removing space-hardtab instances. Removing C++-style line comments in favor of
C-style equivalent. Re-aligning function prototype arguments to remove related
checkpatch warning.

Signed-off-by: Matthew Giassa <matthew@giassa.net>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 8e62b10..0e92495 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -1,6 +1,6 @@
 /*
  *   Driver for KeyStream 11b/g wireless LAN
- *   
+ *
  *   Copyright (c) 2005-2008 KeyStream Corp.
  *   Copyright (C) 2009 Renesas Technology Corp.
  *
@@ -20,8 +20,8 @@
 /*					SIOCIWFIRSTPRIV + 2 */
 #define KS_WLAN_GET_FIRM_VERSION	SIOCIWFIRSTPRIV + 3
 #ifdef WPS
-#define KS_WLAN_SET_WPS_ENABLE 		SIOCIWFIRSTPRIV + 4
-#define KS_WLAN_GET_WPS_ENABLE 		SIOCIWFIRSTPRIV + 5
+#define KS_WLAN_SET_WPS_ENABLE		SIOCIWFIRSTPRIV + 4
+#define KS_WLAN_GET_WPS_ENABLE		SIOCIWFIRSTPRIV + 5
 #define KS_WLAN_SET_WPS_PROBE_REQ	SIOCIWFIRSTPRIV + 6
 #endif
 #define KS_WLAN_GET_EEPROM_CKSUM	SIOCIWFIRSTPRIV + 7
@@ -33,8 +33,8 @@
 #define KS_WLAN_GET_SCAN_TYPE		SIOCIWFIRSTPRIV + 13
 #define KS_WLAN_SET_RX_GAIN		SIOCIWFIRSTPRIV + 14
 #define KS_WLAN_GET_RX_GAIN		SIOCIWFIRSTPRIV + 15
-#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV + 16	/* unused */
-//#define KS_WLAN_SET_REGION            SIOCIWFIRSTPRIV + 17
+#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV + 16 /* unused */
+/* #define KS_WLAN_SET_REGION		SIOCIWFIRSTPRIV + 17 */
 #define KS_WLAN_SET_BEACON_LOST		SIOCIWFIRSTPRIV + 18
 #define KS_WLAN_GET_BEACON_LOST		SIOCIWFIRSTPRIV + 19
 
@@ -48,8 +48,8 @@
 #define KS_WLAN_GET_CTS_MODE		SIOCIWFIRSTPRIV + 25
 /*					SIOCIWFIRSTPRIV + 26 */
 /*					SIOCIWFIRSTPRIV + 27 */
-#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV + 28	/* sleep mode */
-#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV + 29	/* sleep mode */
+#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV + 28 /* sleep mode */
+#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV + 29 /* sleep mode */
 /*					SIOCIWFIRSTPRIV + 30 */
 /*					SIOCIWFIRSTPRIV + 31 */
 
@@ -60,7 +60,7 @@
 
 int ks_wlan_read_config_file(struct ks_wlan_private *priv);
 int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
-		             unsigned int commit_flag);
+			    unsigned int commit_flag);
 
 #endif /* __KERNEL__ */
 
-- 
2.7.4
