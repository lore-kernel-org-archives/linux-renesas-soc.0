Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:37351 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752571AbeCOOqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:12 -0400
Received: by mail-wr0-f196.google.com with SMTP id z12so8595589wrg.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:11 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 5/8] tests/kms_plane_lowres: skip i915-specific tests on other platforms
Date: Thu, 15 Mar 2018 15:45:41 +0100
Message-Id: <1521125144-28614-6-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add is_i915_device() requirement to tests using Intel-specific APIs.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 tests/kms_plane_lowres.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index d1e4b3c..8fc7654 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -270,6 +270,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_skip_on(pipe >= data->display.n_pipes);
 
 		igt_display_require_output_on_pipe(&data->display, pipe);
+		igt_require(is_i915_device(data->drm_fd));
 	}
 
 	igt_subtest_f("pipe-%s-tiling-none",
-- 
2.7.4
