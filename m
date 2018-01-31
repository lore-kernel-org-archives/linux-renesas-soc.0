Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50428 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752500AbeAaVBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 16:01:00 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] gmsl-yavta: Save output frames to .ppm files
Date: Wed, 31 Jan 2018 23:01:16 +0200
Message-Id: <20180131210116.28098-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The script produces the PPM variant of PNM, the correct file extension
is .ppm.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 gmsl-yavta.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gmsl-yavta.sh b/gmsl-yavta.sh
index a123bf52a16d..0ec0560441d8 100755
--- a/gmsl-yavta.sh
+++ b/gmsl-yavta.sh
@@ -83,5 +83,5 @@ wait
 
 for f in $out/*bin; do
     name=$(basename $f .bin)
-    raw2rgbpnm -f YUYV -s 1280x800 $out/$name.bin $out/$name.pnm
+    raw2rgbpnm -f YUYV -s 1280x800 $out/$name.bin $out/$name.ppm
 done
-- 
Regards,

Laurent Pinchart
