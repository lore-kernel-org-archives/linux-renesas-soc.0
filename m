Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41991 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751249AbcEaK5t (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:49 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 21/31] staging: ks7010: indent ks_wlan_ioctl.h
Date: Tue, 31 May 2016 12:56:33 +0200
Message-Id: <1464692203-4180-22-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index e7469f7338f7af..cc4669eddcc1f7 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -36,8 +36,8 @@
 #define KS_WLAN_GET_SCAN_TYPE		SIOCIWFIRSTPRIV+13
 #define KS_WLAN_SET_RX_GAIN		SIOCIWFIRSTPRIV+14
 #define KS_WLAN_GET_RX_GAIN		SIOCIWFIRSTPRIV+15
-#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV+16  /* unused */
-//#define KS_WLAN_SET_REGION		SIOCIWFIRSTPRIV+17
+#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV+16	/* unused */
+//#define KS_WLAN_SET_REGION            SIOCIWFIRSTPRIV+17
 #define KS_WLAN_SET_BEACON_LOST		SIOCIWFIRSTPRIV+18
 #define KS_WLAN_GET_BEACON_LOST		SIOCIWFIRSTPRIV+19
 
@@ -51,8 +51,8 @@
 #define KS_WLAN_GET_CTS_MODE		SIOCIWFIRSTPRIV+25
 /*					SIOCIWFIRSTPRIV+26 */
 /*					SIOCIWFIRSTPRIV+27 */
-#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV+28 /* sleep mode */
-#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV+29 /* sleep mode */
+#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV+28	/* sleep mode */
+#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV+29	/* sleep mode */
 /*					SIOCIWFIRSTPRIV+30 */
 /*					SIOCIWFIRSTPRIV+31 */
 
@@ -62,7 +62,8 @@
 #include <linux/netdevice.h>
 
 extern int ks_wlan_read_config_file(struct ks_wlan_private *priv);
-extern int ks_wlan_setup_parameter(struct ks_wlan_private *priv, unsigned int commit_flag);
+extern int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
+				   unsigned int commit_flag);
 
 #endif /* __KERNEL__ */
 
-- 
2.8.1
