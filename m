Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:37909 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752271AbeCOOqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:06 -0400
Received: by mail-wr0-f196.google.com with SMTP id l8so8577487wrg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:05 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 1/8] tests/kms_addfb_basic: skip i915-specific tests on other platforms
Date: Thu, 15 Mar 2018 15:45:37 +0100
Message-Id: <1521125144-28614-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add is_i915_device() requirement to tests using Intel-specific APIs.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 tests/kms_addfb_basic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 7d8852f..cf9ba37 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -104,6 +104,7 @@ static void invalid_tests(int fd)
 	}
 
 	igt_subtest("clobberred-modifier") {
+		igt_require(is_i915_device(fd));
 		f.flags = 0;
 		f.modifier[0] = 0;
 		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
@@ -318,6 +319,7 @@ static void size_tests(int fd)
 	}
 
 	igt_subtest("bo-too-small-due-to-tiling") {
+		igt_require(is_i915_device(fd));
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
@@ -369,6 +371,7 @@ static void addfb25_tests(int fd)
 
 	igt_subtest_group {
 		igt_fixture {
+			igt_require(is_i915_device(fd));
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
 			igt_require_fb_modifiers(fd);
 		}
-- 
2.7.4
