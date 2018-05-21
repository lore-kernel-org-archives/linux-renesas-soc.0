Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46118 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750945AbeEUJKl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 05:10:41 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH v2 1/2] vsp-lib: Capture the kernel log messages in test log files
Date: Mon, 21 May 2018 12:11:01 +0300
Message-Id: <20180521091102.18764-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20180521091102.18764-1-laurent.pinchart@ideasonboard.com>
References: <20180521091102.18764-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It can be useful to capture kernel log messages in test log files for
diagnostic purpose. Add a simple mechanism to do so by capturing the
full kernel log at the end of the test. The kernel log is cleared first
before starting the test to avoid capturing unrelated messages.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Don't clear the kernel log
---
 scripts/vsp-lib.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 0f3992a7827e..0ecdf9acb152 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -1080,12 +1080,18 @@ test_init() {
 test_start() {
 	echo "Testing $1" | ./logger.sh >> $logfile
 	echo -n "Testing $1: " >&2
+
+	# Store the marker for the last line of the kernel log.
+	marker=$(dmesg | tail -n 1 | sed 's/^\[\([^]]*\)\].*/\1/g')
 }
 
 test_complete() {
 	echo "Done: $1" | ./logger.sh >> $logfile
 	echo $1 >&2
 
+	# Capture the part of the kernel log relative to the test.
+	dmesg | sed "1,/$marker/d" | ./logger.sh kernel >> $logfile
+
 	rm -f ${frames_dir}frame-*.bin
 	rm -f ${frames_dir}histo-*.bin
 	rm -f ${frames_dir}rpf.*.bin
-- 
Regards,

Laurent Pinchart
