Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:52661 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752987AbeEKKBU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 06:01:20 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] yavta-hdmi: Generalize capture parameters
Date: Fri, 11 May 2018 12:00:38 +0200
Message-Id: <1526032839-14536-5-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the newly defined ${capture_vin} and ${convert_format} to generalize
capture operations from HDMI sources.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 yavta-hdmi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/yavta-hdmi b/yavta-hdmi
index a0a09a3..5806a0d 100755
--- a/yavta-hdmi
+++ b/yavta-hdmi
@@ -11,10 +11,10 @@ out=/tmp/vin-tests
 rm -fr $out
 mkdir -p $out
 
-size=$(v4l2-ctl --all -d /dev/$vin0  | awk '/Width/{print $3}' | tr '/' 'x')
+size=$(v4l2-ctl --all -d /dev/$capture_vin  | awk '/Width/{print $3}' | tr '/' 'x')
 
-yavta -n 4 --capture=10 /dev/$vin0 --file=$out/frame-#.bin $*
+yavta -n 4 --capture=10 /dev/$capture_vin --file=$out/frame-#.bin $*
 
 strings $out/frame*.bin | head | wc -l
 md5sum $out/frame*.bin
-for f in $out/frame*.bin ; do $base/convert.sh $f $size ; done;
+for f in $out/frame*.bin ; do $base/convert.sh $f $size $convert_format; done;
-- 
2.7.4
