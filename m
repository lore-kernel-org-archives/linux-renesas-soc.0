Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:45445 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756747AbdLOPQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:23 -0500
Received: by mail-wm0-f66.google.com with SMTP id 9so18084209wme.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:22 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/7] drm/img-rogue: change #include <asm/uaccess.h> to <linux/uaccess.h>
Date: Fri, 15 Dec 2017 16:15:40 +0100
Message-Id: <1513350945-2642-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 services/server/env/linux/pvr_uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/services/server/env/linux/pvr_uaccess.h b/services/server/env/linux/pvr_uaccess.h
index 74ddc58..382cca4 100644
--- a/services/server/env/linux/pvr_uaccess.h
+++ b/services/server/env/linux/pvr_uaccess.h
@@ -42,7 +42,7 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #ifndef __PVR_UACCESS_H__
 #define __PVR_UACCESS_H__
 
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 
 static inline unsigned long pvr_copy_to_user(void __user *pvTo, const void *pvFrom, unsigned long ulBytes)
 {
-- 
2.7.4
