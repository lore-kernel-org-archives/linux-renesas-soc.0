Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:40931 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756747AbdLOPQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:25 -0500
Received: by mail-wm0-f65.google.com with SMTP id f206so18159370wmf.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:25 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/7] drm/img-rogue: #include <linux/sched/clock.h> in osfunc.c
Date: Fri, 15 Dec 2017 16:15:41 +0100
Message-Id: <1513350945-2642-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Required for sched_clock()

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 services/server/env/linux/osfunc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/services/server/env/linux/osfunc.c b/services/server/env/linux/osfunc.c
index 39d4f89..c222095 100644
--- a/services/server/env/linux/osfunc.c
+++ b/services/server/env/linux/osfunc.c
@@ -53,6 +53,7 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #include <linux/genalloc.h>
 #include <linux/string.h>
 #include <linux/sched.h>
+#include <linux/sched/clock.h>
 #include <asm/hardirq.h>
 #include <asm/tlbflush.h>
 #include <linux/timer.h>
-- 
2.7.4
