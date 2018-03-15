Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36659 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932354AbeCOOqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:46:17 -0400
Received: by mail-wr0-f195.google.com with SMTP id d10so8596386wrf.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:46:17 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 8/8] test/kms_addfb_basic: tolerate absence of 8-bit format
Date: Thu, 15 Mar 2018 15:45:44 +0100
Message-Id: <1521125144-28614-9-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Ignores failure to add DRM_FORMAT_C8 frame buffer; some devices do not
support any 8-bit format.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 tests/kms_addfb_basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index d1da718..db79827 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -273,8 +273,8 @@ static void size_tests(int fd)
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_16.fb_id) == 0);
 		f.fb_id = 0;
-		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0);
-		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
+		if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0)
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
 		f.fb_id = 0;
 	}
 
-- 
2.7.4
