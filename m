Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34061 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752413AbeCOOqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:09 -0400
Received: by mail-wr0-f193.google.com with SMTP id o8so8623555wra.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:08 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 3/8] lib/igt_gt: has_gpu_reset(): fix failed assertion on non-i915 platforms
Date: Thu, 15 Mar 2018 15:45:39 +0100
Message-Id: <1521125144-28614-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Checks if we have an i915 device before using intel_get_drm_devid().

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 lib/igt_gt.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index e630550..9cb07c2 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -59,14 +59,17 @@ static bool has_gpu_reset(int fd)
 		struct drm_i915_getparam gp;
 		int val = 0;
 
-		memset(&gp, 0, sizeof(gp));
-		gp.param = 35; /* HAS_GPU_RESET */
-		gp.value = &val;
-
-		if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
-			once = intel_gen(intel_get_drm_devid(fd)) >= 5;
-		else
-			once = val > 0;
+		if (is_i915_device(fd)) {
+			memset(&gp, 0, sizeof(gp));
+			gp.param = 35; /* HAS_GPU_RESET */
+			gp.value = &val;
+
+			if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
+				once = intel_gen(intel_get_drm_devid(fd)) >= 5;
+			else
+				once = val > 0;
+		} else
+			once = 0;
 	}
 	return once;
 }
-- 
2.7.4
