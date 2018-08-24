Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53871 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbeHXN6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 09:58:34 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] vin-tests: Add capture format for parallel input
Date: Fri, 24 Aug 2018 12:24:21 +0200
Message-Id: <1535106262-13004-4-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add configurable capture format to propagate_parallel() function.
The capture format is the image format set on the VIN nodes.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/boards.sh    | 2 ++
 scripts/vin-tests.sh | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 7eb3a27..b379af6 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -28,6 +28,7 @@ case $info in
         # FIXME: This is a hack and not the correct mbus format
         # for V3M, but results in an image.
         parallelformat="YUYV8_1X16"
+	parallel_captureformat="RGB565"
         ;;
     "Renesas Draak board based on r8a77995")
         gen="gen3"
@@ -35,6 +36,7 @@ case $info in
         parallelname="adv7612 0-004c"
         # FIXME: This is a hackfor D3, but results in an image.
         parallelformat="YUYV8_1X16"
+	parallel_captureformat="RGB565"
         ;;
     "Koelsch")
         gen="gen2"
diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
index 0c5b29a..e7b7a48 100644
--- a/scripts/vin-tests.sh
+++ b/scripts/vin-tests.sh
@@ -111,5 +111,5 @@ mc_propagate_parallel() {
     echo "format: $format size: $size/$vinsize field: $field/$vinfield vdev: $vdev"
 
     $mediactl -d $mdev -V "$cam [fmt:$format/$size field:$field]"
-    yavta -f RGB565 -s $vinsize --field $vinfield $vdev
+    yavta -f $parallel_captureformat -s $vinsize --field $vinfield $vdev
 }
-- 
2.7.4
