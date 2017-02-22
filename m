Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        Matthew Giassa <matthew@giassa.net>
Subject: [PATCHv2] Checkpatch fixes for staging/drivers/ks7010.
Date: Wed, 22 Feb 2017 13:52:58 -0800
Message-Id: <1487800378-22557-1-git-send-email-matthew@giassa.net>
In-Reply-To: <1487650805-30520-1-git-send-email-matthew@giassa.net>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Wrapping complex macros with parentheses.
Adding extra spaces between macros and integer literals.
Indentation changes to remove checkpatch warnings.
Swapping out C++-style comments with C-style comments.

Signed-off-by: Matthew Giassa <matthew@giassa.net>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 74 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 84554b6..b0166c2 100644
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
@@ -8,50 +8,49 @@
  *   it under the terms of the GNU General Public License version 2 as
  *   published by the Free Software Foundation.
  */
-
 #ifndef _KS_WLAN_IOCTL_H
 #define _KS_WLAN_IOCTL_H

 #include <linux/wireless.h>
-/* The low order bit identify a SET (0) or a GET (1) ioctl.  */
+/* The low order bit identify a SET (0) or a GET (1) ioctl. */

-/*					SIOCIWFIRSTPRIV+0 */
-/* former KS_WLAN_GET_DRIVER_VERSION	SIOCIWFIRSTPRIV+1 */
-/*					SIOCIWFIRSTPRIV+2 */
-#define KS_WLAN_GET_FIRM_VERSION	SIOCIWFIRSTPRIV+3
+/*					(SIOCIWFIRSTPRIV + 0) */
+/* Former KS_WLAN_GET_DRIVER_VERSION	(SIOCIWFIRSTPRIV + 1) */
+/*					(SIOCIWFIRSTPRIV + 2) */
+#define KS_WLAN_GET_FIRM_VERSION	(SIOCIWFIRSTPRIV + 3)
 #ifdef WPS
-#define KS_WLAN_SET_WPS_ENABLE 		SIOCIWFIRSTPRIV+4
-#define KS_WLAN_GET_WPS_ENABLE 		SIOCIWFIRSTPRIV+5
-#define KS_WLAN_SET_WPS_PROBE_REQ	SIOCIWFIRSTPRIV+6
+#define KS_WLAN_SET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 4)
+#define KS_WLAN_GET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 5)
+#define KS_WLAN_SET_WPS_PROBE_REQ	(SIOCIWFIRSTPRIV + 6)
 #endif
-#define KS_WLAN_GET_EEPROM_CKSUM	SIOCIWFIRSTPRIV+7
-#define KS_WLAN_SET_PREAMBLE		SIOCIWFIRSTPRIV+8
-#define KS_WLAN_GET_PREAMBLE		SIOCIWFIRSTPRIV+9
-#define KS_WLAN_SET_POWER_SAVE		SIOCIWFIRSTPRIV+10
-#define KS_WLAN_GET_POWER_SAVE		SIOCIWFIRSTPRIV+11
-#define KS_WLAN_SET_SCAN_TYPE		SIOCIWFIRSTPRIV+12
-#define KS_WLAN_GET_SCAN_TYPE		SIOCIWFIRSTPRIV+13
-#define KS_WLAN_SET_RX_GAIN		SIOCIWFIRSTPRIV+14
-#define KS_WLAN_GET_RX_GAIN		SIOCIWFIRSTPRIV+15
-#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV+16	/* unused */
-//#define KS_WLAN_SET_REGION            SIOCIWFIRSTPRIV+17
-#define KS_WLAN_SET_BEACON_LOST		SIOCIWFIRSTPRIV+18
-#define KS_WLAN_GET_BEACON_LOST		SIOCIWFIRSTPRIV+19
+#define KS_WLAN_GET_EEPROM_CKSUM	(SIOCIWFIRSTPRIV + 7)
+#define KS_WLAN_SET_PREAMBLE		(SIOCIWFIRSTPRIV + 8)
+#define KS_WLAN_GET_PREAMBLE		(SIOCIWFIRSTPRIV + 9)
+#define KS_WLAN_SET_POWER_SAVE		(SIOCIWFIRSTPRIV + 10)
+#define KS_WLAN_GET_POWER_SAVE		(SIOCIWFIRSTPRIV + 11)
+#define KS_WLAN_SET_SCAN_TYPE		(SIOCIWFIRSTPRIV + 12)
+#define KS_WLAN_GET_SCAN_TYPE		(SIOCIWFIRSTPRIV + 13)
+#define KS_WLAN_SET_RX_GAIN		(SIOCIWFIRSTPRIV + 14)
+#define KS_WLAN_GET_RX_GAIN		(SIOCIWFIRSTPRIV + 15)
+#define KS_WLAN_HOSTT			(SIOCIWFIRSTPRIV + 16) /* unused */
+/*#define KS_WLAN_SET_REGION            (SIOCIWFIRSTPRIV + 17) */
+#define KS_WLAN_SET_BEACON_LOST		(SIOCIWFIRSTPRIV + 18)
+#define KS_WLAN_GET_BEACON_LOST		(SIOCIWFIRSTPRIV + 19)

-#define KS_WLAN_SET_TX_GAIN		SIOCIWFIRSTPRIV+20
-#define KS_WLAN_GET_TX_GAIN		SIOCIWFIRSTPRIV+21
+#define KS_WLAN_SET_TX_GAIN		(SIOCIWFIRSTPRIV + 20)
+#define KS_WLAN_GET_TX_GAIN		(SIOCIWFIRSTPRIV + 21)

-/* for KS7010 */
-#define KS_WLAN_SET_PHY_TYPE		SIOCIWFIRSTPRIV+22
-#define KS_WLAN_GET_PHY_TYPE		SIOCIWFIRSTPRIV+23
-#define KS_WLAN_SET_CTS_MODE		SIOCIWFIRSTPRIV+24
-#define KS_WLAN_GET_CTS_MODE		SIOCIWFIRSTPRIV+25
-/*					SIOCIWFIRSTPRIV+26 */
-/*					SIOCIWFIRSTPRIV+27 */
-#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV+28	/* sleep mode */
-#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV+29	/* sleep mode */
-/*					SIOCIWFIRSTPRIV+30 */
-/*					SIOCIWFIRSTPRIV+31 */
+/* For KS7010. */
+#define KS_WLAN_SET_PHY_TYPE		(SIOCIWFIRSTPRIV + 22)
+#define KS_WLAN_GET_PHY_TYPE		(SIOCIWFIRSTPRIV + 23)
+#define KS_WLAN_SET_CTS_MODE		(SIOCIWFIRSTPRIV + 24)
+#define KS_WLAN_GET_CTS_MODE		(SIOCIWFIRSTPRIV + 25)
+/*					(SIOCIWFIRSTPRIV + 26) */
+/*					(SIOCIWFIRSTPRIV + 27) */
+#define KS_WLAN_SET_SLEEP_MODE		(SIOCIWFIRSTPRIV + 28) /* sleep mode */
+#define KS_WLAN_GET_SLEEP_MODE		(SIOCIWFIRSTPRIV + 29) /* sleep mode */
+/*					(SIOCIWFIRSTPRIV + 30) */
+/*					(SIOCIWFIRSTPRIV + 31) */

 #ifdef __KERNEL__

@@ -60,8 +59,9 @@

 int ks_wlan_read_config_file(struct ks_wlan_private *priv);
 int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
-		             unsigned int commit_flag);
+			    unsigned int commit_flag);

 #endif /* __KERNEL__ */

 #endif /* _KS_WLAN_IOCTL_H */
+
--
2.7.4
