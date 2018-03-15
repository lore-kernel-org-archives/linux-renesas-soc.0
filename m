Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:56002 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752571AbeCOOqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:16 -0400
Received: by mail-wm0-f67.google.com with SMTP id q83so11028259wme.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:15 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 7/8] tests/kms_addfb_basic: size_tests(): reduce test buffer size
Date: Thu, 15 Mar 2018 15:45:43 +0100
Message-Id: <1521125144-28614-8-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fixes fails on low-memory devices.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 tests/kms_addfb_basic.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index cf9ba37..d1da718 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -238,26 +238,26 @@ static void size_tests(int fd)
 	struct drm_mode_fb_cmd2 f_16 = {};
 	struct drm_mode_fb_cmd2 f_8 = {};
 
-	f.width = 1024;
-	f.height = 1024;
+	f.width = 512;
+	f.height = 512;
 	f.pixel_format = DRM_FORMAT_XRGB8888;
-	f.pitches[0] = 1024*4;
+	f.pitches[0] = 512*4;
 
-	f_16.width = 1024;
-	f_16.height = 1024*2;
+	f_16.width = 512;
+	f_16.height = 512*2;
 	f_16.pixel_format = DRM_FORMAT_RGB565;
-	f_16.pitches[0] = 1024*2;
+	f_16.pitches[0] = 512*2;
 
-	f_8.width = 1024*2;
-	f_8.height = 1024*2;
+	f_8.width = 512*2;
+	f_8.height = 512*2;
 	f_8.pixel_format = DRM_FORMAT_C8;
-	f_8.pitches[0] = 1024*2;
+	f_8.pitches[0] = 512*2;
 
 	igt_fixture {
-		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
+		gem_bo = igt_create_bo_with_dimensions(fd, 512, 512,
 			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
-		gem_bo_small = igt_create_bo_with_dimensions(fd, 1024, 1023,
+		gem_bo_small = igt_create_bo_with_dimensions(fd, 512, 511,
 			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo_small);
 	}
@@ -311,7 +311,7 @@ static void size_tests(int fd)
 	}
 
 	/* Just to check that the parameters would work. */
-	f.height = 1020;
+	f.height = 510;
 	igt_subtest("small-bo") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
@@ -320,7 +320,7 @@ static void size_tests(int fd)
 
 	igt_subtest("bo-too-small-due-to-tiling") {
 		igt_require(is_i915_device(fd));
-		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
+		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 512*4);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 	}
-- 
2.7.4
