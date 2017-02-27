Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35215 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751284AbdB0C1u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Feb 2017 21:27:50 -0500
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        Matthew Giassa <matthew@giassa.net>
Subject: [PATCHv3 3/4] Removing mixed spaces/hard-tabs in the alignment indentation to appease checkpatch.
Date: Sun, 26 Feb 2017 18:00:21 -0800
Message-Id: <1488160822-18751-4-git-send-email-matthew@giassa.net>
In-Reply-To: <1488160822-18751-3-git-send-email-matthew@giassa.net>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <1488160822-18751-1-git-send-email-matthew@giassa.net>
 <1488160822-18751-2-git-send-email-matthew@giassa.net>
 <1488160822-18751-3-git-send-email-matthew@giassa.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 0aa402d..9f71f01 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -20,8 +20,8 @@
 /*					(SIOCIWFIRSTPRIV + 2) */
 #define KS_WLAN_GET_FIRM_VERSION	(SIOCIWFIRSTPRIV + 3)
 #ifdef WPS
-#define KS_WLAN_SET_WPS_ENABLE 		(SIOCIWFIRSTPRIV + 4)
-#define KS_WLAN_GET_WPS_ENABLE 		(SIOCIWFIRSTPRIV + 5)
+#define KS_WLAN_SET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 4)
+#define KS_WLAN_GET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 5)
 #define KS_WLAN_SET_WPS_PROBE_REQ	(SIOCIWFIRSTPRIV + 6)
 #endif
 #define KS_WLAN_GET_EEPROM_CKSUM	(SIOCIWFIRSTPRIV + 7)
-- 
2.7.4
