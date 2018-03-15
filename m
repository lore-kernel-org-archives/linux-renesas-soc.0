Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33559 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbeCOOqK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:10 -0400
Received: by mail-wm0-f65.google.com with SMTP id s206so23476884wme.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:10 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 4/8] lib/igt_gt: check for presence of GPU reset before using it
Date: Thu, 15 Mar 2018 15:45:40 +0100
Message-Id: <1521125144-28614-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fixes failed assertion on non-i915 devices.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 lib/igt_gt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 9cb07c2..825ea52 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -166,14 +166,15 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
 	struct drm_i915_gem_context_param param;
 	unsigned ban;
 
+	if (!igt_check_boolean_env_var("IGT_HANG_WITHOUT_RESET", false))
+		igt_require(has_gpu_reset(fd));
+
 	igt_assert(igt_sysfs_set_parameter
 		   (fd, "reset", "%d", INT_MAX /* any reset method */));
 
 	if (!igt_check_boolean_env_var("IGT_HANG", true))
 		igt_skip("hang injection disabled by user");
 	gem_context_require_bannable(fd);
-	if (!igt_check_boolean_env_var("IGT_HANG_WITHOUT_RESET", false))
-		igt_require(has_gpu_reset(fd));
 
 	param.ctx_id = ctx;
 	param.size = 0;
-- 
2.7.4
