Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754013AbdKOOij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 09:38:39 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/3] vin-tests: Refactor mc_get_dev
Date: Wed, 15 Nov 2017 14:38:31 +0000
Message-Id: <1510756711-6488-4-git-send-email-kbingham@kernel.org>
In-Reply-To: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
References: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Rather that using shell parsing of each file when looking for a device
node, use a combination of grep and sed to identify the device.

This is a remarkable speed optimisation for this code segment.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 scripts/vin-tests.sh | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
index 7c81aa51c1c5..2e6214bc95e6 100644
--- a/scripts/vin-tests.sh
+++ b/scripts/vin-tests.sh
@@ -99,17 +99,9 @@ mc_get_mdev() {
 }
 
 mc_get_dev() {
-    name=$1
-    mdev=$(mc_get_mdev)
-
-    for dev in  /sys/class/video4linux/*; do
-        if [[ "$(cat $dev/name)" == "$name" ]]; then
-            basename $dev
-            return 0
-        fi
-    done
-
-    error "Can't find device"
+    name="$1"
+    grep -l "$name" /sys/class/video4linux/video*/name | \
+	    sed 's#.*video4linux\(.*\)/name#/dev\1#g'
 }
 
 mc_log() {
-- 
2.7.4
