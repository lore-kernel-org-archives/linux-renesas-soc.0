Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        matthew@giassa.net
Subject: [PATCHv5 3/4] Staging: ks7010: ks_wlan_ioctl.h: Aligning parameters in function prototypes.
Date: Wed, 15 Mar 2017 20:18:10 -0700
Message-Id: <1489634291-30028-4-git-send-email-matthew@giassa.net>
In-Reply-To: <1489634291-30028-1-git-send-email-matthew@giassa.net>
References: <20170316024246.GA19641@kroah.com>
 <1489634291-30028-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Re-aligning function parameters in function prototypes by inserting
additional hard-tabs to resolve a checkpatch warning.

Signed-off-by: Matthew Giassa <matthew@giassa.net>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index 1b68402..1251d7e 100644
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
