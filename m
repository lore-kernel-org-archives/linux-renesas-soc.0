Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752462AbeESUeI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 16:34:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH 1/2] vsp-lib: Capture the kernel log messages in test log files
Date: Sat, 19 May 2018 23:34:25 +0300
Message-Id: <20180519203426.25711-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It can be useful to capture kernel log messages in test log files for
diagnostic purpose. Add a simple mechanism to do so by capturing the
full kernel log at the end of the test. The kernel log is cleared first
before starting the test to avoid capturing unrelated messages.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 0f3992a7827e..e672686a377e 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -1075,6 +1075,9 @@ test_init() {
 	echo "Using device $mdev ($dev)" | ./logger.sh config >> $logfile
 
 	vsp_runner=./vsp-runner.sh
+
+	# Clear the kernel log
+	dmesg -c > /dev/null
 }
 
 test_start() {
@@ -1086,6 +1089,8 @@ test_complete() {
 	echo "Done: $1" | ./logger.sh >> $logfile
 	echo $1 >&2
 
+	dmesg -c | ./logger.sh kernel >> $logfile
+
 	rm -f ${frames_dir}frame-*.bin
 	rm -f ${frames_dir}histo-*.bin
 	rm -f ${frames_dir}rpf.*.bin
-- 
Regards,

Laurent Pinchart
