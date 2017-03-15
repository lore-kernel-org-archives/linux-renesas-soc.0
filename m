Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33280 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750815AbdCOC0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 22:26:12 -0400
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        matthew@giassa.net
Subject: [PATCHv5 1/4] Staging: ks7010: ks_wlan_ioctl.h: Removed mixed spaces/tabs
Date: Tue, 14 Mar 2017 19:25:51 -0700
Message-Id: <1489544754-23840-1-git-send-email-matthew@giassa.net>
In-Reply-To: <1487650805-30520-1-git-send-email-matthew@giassa.net>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
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
