Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33408 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751141AbdCPDSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Mar 2017 23:18:32 -0400
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        matthew@giassa.net
Subject: [PATCHv5 2/4] Staging: ks7010: ks_wlan_ioctl.h: Remove trailing white space
Date: Wed, 15 Mar 2017 20:18:09 -0700
Message-Id: <1489634291-30028-3-git-send-email-matthew@giassa.net>
In-Reply-To: <1489634291-30028-1-git-send-email-matthew@giassa.net>
References: <20170316024246.GA19641@kroah.com>
 <1489634291-30028-1-git-send-email-matthew@giassa.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Removing trailing white space characters in comments to resolve
a checkpatch warning.

Signed-off-by: Matthew Giassa <matthew@giassa.net>
---
 drivers/staging/ks7010/ks_wlan_ioctl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index d811680..1b68402 100644
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
-- 
2.7.4
