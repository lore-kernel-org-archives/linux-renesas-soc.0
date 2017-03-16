Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        matthew@giassa.net
Subject: [PATCHv5 4/4] Staging: ks7010: ks_wlan_ioctl.h: Wrap complex macros with parentheses
Date: Wed, 15 Mar 2017 20:18:11 -0700
Message-Id: <1489634291-30028-5-git-send-email-matthew@giassa.net>
In-Reply-To: <1489634291-30028-1-git-send-email-matthew@giassa.net>
References: <20170316024246.GA19641@kroah.com>
 <1489634291-30028-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Wrapping all complex macros with parentheses to resolve checkpatch
errors. This change, along with the preceding changes in this change
set, resolves all checkpatch warnings and errors for the file.

Signed-off-by: Matthew Giassa <matthew@giassa.net>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 64 +++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 1251d7e..adc935d 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -15,43 +15,43 @@
 #include <linux/wireless.h>
 /* The low order bit identify a SET (0) or a GET (1) ioctl.  */
 
-/*					SIOCIWFIRSTPRIV + 0 */
-/* former KS_WLAN_GET_DRIVER_VERSION	SIOCIWFIRSTPRIV + 1 */
-/*					SIOCIWFIRSTPRIV + 2 */
-#define KS_WLAN_GET_FIRM_VERSION	SIOCIWFIRSTPRIV + 3
+/*					(SIOCIWFIRSTPRIV + 0) */
+/* former KS_WLAN_GET_DRIVER_VERSION	(SIOCIWFIRSTPRIV + 1) */
+/*					(SIOCIWFIRSTPRIV + 2) */
+#define KS_WLAN_GET_FIRM_VERSION	(SIOCIWFIRSTPRIV + 3)
 #ifdef WPS
-#define KS_WLAN_SET_WPS_ENABLE		SIOCIWFIRSTPRIV + 4
-#define KS_WLAN_GET_WPS_ENABLE		SIOCIWFIRSTPRIV + 5
-#define KS_WLAN_SET_WPS_PROBE_REQ	SIOCIWFIRSTPRIV + 6
+#define KS_WLAN_SET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 4)
+#define KS_WLAN_GET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 5)
+#define KS_WLAN_SET_WPS_PROBE_REQ	(SIOCIWFIRSTPRIV + 6)
 #endif
-#define KS_WLAN_GET_EEPROM_CKSUM	SIOCIWFIRSTPRIV + 7
-#define KS_WLAN_SET_PREAMBLE		SIOCIWFIRSTPRIV + 8
-#define KS_WLAN_GET_PREAMBLE		SIOCIWFIRSTPRIV + 9
-#define KS_WLAN_SET_POWER_SAVE		SIOCIWFIRSTPRIV + 10
-#define KS_WLAN_GET_POWER_SAVE		SIOCIWFIRSTPRIV + 11
-#define KS_WLAN_SET_SCAN_TYPE		SIOCIWFIRSTPRIV + 12
-#define KS_WLAN_GET_SCAN_TYPE		SIOCIWFIRSTPRIV + 13
-#define KS_WLAN_SET_RX_GAIN		SIOCIWFIRSTPRIV + 14
-#define KS_WLAN_GET_RX_GAIN		SIOCIWFIRSTPRIV + 15
-#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV + 16	/* unused */
-//#define KS_WLAN_SET_REGION            SIOCIWFIRSTPRIV + 17
-#define KS_WLAN_SET_BEACON_LOST		SIOCIWFIRSTPRIV + 18
-#define KS_WLAN_GET_BEACON_LOST		SIOCIWFIRSTPRIV + 19
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
+//#define KS_WLAN_SET_REGION            (SIOCIWFIRSTPRIV + 17)
+#define KS_WLAN_SET_BEACON_LOST		(SIOCIWFIRSTPRIV + 18)
+#define KS_WLAN_GET_BEACON_LOST		(SIOCIWFIRSTPRIV + 19)
 
-#define KS_WLAN_SET_TX_GAIN		SIOCIWFIRSTPRIV + 20
-#define KS_WLAN_GET_TX_GAIN		SIOCIWFIRSTPRIV + 21
+#define KS_WLAN_SET_TX_GAIN		(SIOCIWFIRSTPRIV + 20)
+#define KS_WLAN_GET_TX_GAIN		(SIOCIWFIRSTPRIV + 21)
 
 /* for KS7010 */
-#define KS_WLAN_SET_PHY_TYPE		SIOCIWFIRSTPRIV + 22
-#define KS_WLAN_GET_PHY_TYPE		SIOCIWFIRSTPRIV + 23
-#define KS_WLAN_SET_CTS_MODE		SIOCIWFIRSTPRIV + 24
-#define KS_WLAN_GET_CTS_MODE		SIOCIWFIRSTPRIV + 25
-/*					SIOCIWFIRSTPRIV + 26 */
-/*					SIOCIWFIRSTPRIV + 27 */
-#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV + 28	/* sleep mode */
-#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV + 29	/* sleep mode */
-/*					SIOCIWFIRSTPRIV + 30 */
-/*					SIOCIWFIRSTPRIV + 31 */
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
 
-- 
2.7.4
