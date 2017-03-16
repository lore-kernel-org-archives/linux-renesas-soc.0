Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        matthew@giassa.net
Subject: [PATCHv5 1/4] Staging: ks7010: ks_wlan_ioctl.h: Removed mixed spaces/tabs
Date: Wed, 15 Mar 2017 20:18:08 -0700
Message-Id: <1489634291-30028-2-git-send-email-matthew@giassa.net>
In-Reply-To: <1489634291-30028-1-git-send-email-matthew@giassa.net>
References: <20170316024246.GA19641@kroah.com>
 <1489634291-30028-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Removing mixed spaces/hard-tabs used to create a "column alignment" of
macro names and macro values.

Signed-off-by: Matthew Giassa <matthew@giassa.net>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 8e62b10..d811680 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
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
-- 
2.7.4
