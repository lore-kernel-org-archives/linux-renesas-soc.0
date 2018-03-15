Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40966 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752413AbeCOOqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:07 -0400
Received: by mail-wr0-f196.google.com with SMTP id f14so8542646wre.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:07 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 2/8] tests/kms_panel_fitting: check for i915 before checking version
Date: Thu, 15 Mar 2018 15:45:38 +0100
Message-Id: <1521125144-28614-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fixes false negatives on non-i915 platforms.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 tests/kms_panel_fitting.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index b3cee22..6d0be50 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -243,6 +243,7 @@ static void test_atomic_fastset(igt_display_t *display)
 		igt_set_module_param_int("fastboot", 1);
 
 	igt_require(display->is_atomic);
+	igt_require(is_i915_device(display->drm_fd));
 	igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-- 
2.7.4
