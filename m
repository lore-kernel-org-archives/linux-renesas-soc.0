Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:37923 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932333AbeCOOqO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:14 -0400
Received: by mail-wr0-f195.google.com with SMTP id l8so8577983wrg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:13 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 6/8] lib/igt_pm: turn absence of autosuspend_delay_ms from fail to skip
Date: Thu, 15 Mar 2018 15:45:42 +0100
Message-Id: <1521125144-28614-7-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fixes false negatives on everything that doesn't happen to be at a
specific hard-coded sysfs path...

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 lib/igt_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 5bf5b2e..641157b 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -262,7 +262,7 @@ bool igt_setup_runtime_pm(void)
 	 * suite goes faster and we have a higher probability of triggering race
 	 * conditions. */
 	fd = open(POWER_DIR "/autosuspend_delay_ms", O_WRONLY);
-	igt_assert_f(fd >= 0,
+	igt_require_f(fd >= 0,
 		     "Can't open " POWER_DIR "/autosuspend_delay_ms\n");
 
 	/* If we fail to write to the file, it means this system doesn't support
-- 
2.7.4
