Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50422 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751674AbeAaVAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 16:00:54 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] gmsl-yavta: Remove bash-isms
Date: Wed, 31 Jan 2018 23:01:08 +0200
Message-Id: <20180131210108.28048-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The script contains two bash-specific constructs:

- Replace ${!var} expansion with eval
- Initialize conf1234 and conf5678 variables to avoid empty argument to
  -ne test

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 gmsl-yavta.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/gmsl-yavta.sh b/gmsl-yavta.sh
index 635ab72feb07..a123bf52a16d 100755
--- a/gmsl-yavta.sh
+++ b/gmsl-yavta.sh
@@ -22,13 +22,17 @@ function conf() {
 
 function capture() {
     VID="$1"
+    vid=$(eval echo \$$VID)
 
-    yavta -f YUYV -s 1280x800 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/${!VID} &
+    yavta -f YUYV -s 1280x800 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/$vid &
 }
 
 mc_reset
 
 # Need to configure all formats going through each MAX9286
+conf1234=0
+conf5678=0
+
 for cam in "$@"; do
 	case $cam in
         1|2|3|4)
-- 
Regards,

Laurent Pinchart
