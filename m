Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        Matthew Giassa <matthew@giassa.net>
Subject: [PATCHv3 4/4] Changing alignment and indentation in function prototypes so parameters line up to make checkpatch happy (no more warnings/errors).
Date: Sun, 26 Feb 2017 18:00:22 -0800
Message-Id: <1488160822-18751-5-git-send-email-matthew@giassa.net>
In-Reply-To: <1488160822-18751-4-git-send-email-matthew@giassa.net>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <1488160822-18751-1-git-send-email-matthew@giassa.net>
 <1488160822-18751-2-git-send-email-matthew@giassa.net>
 <1488160822-18751-3-git-send-email-matthew@giassa.net>
 <1488160822-18751-4-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 9f71f01..adc935d 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -60,7 +60,7 @@
 
 int ks_wlan_read_config_file(struct ks_wlan_private *priv);
 int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
-		             unsigned int commit_flag);
+			    unsigned int commit_flag);
 
 #endif /* __KERNEL__ */
 
-- 
2.7.4
