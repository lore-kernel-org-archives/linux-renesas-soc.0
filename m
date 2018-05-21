Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46122 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbeEUJKm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 05:10:42 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH v2 2/2] tests: suspend/resume: Increase number of processed frames
Date: Mon, 21 May 2018 12:11:02 +0300
Message-Id: <20180521091102.18764-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20180521091102.18764-1-laurent.pinchart@ideasonboard.com>
References: <20180521091102.18764-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The suspend/resume test starts a run of 300 frames and suspends the
system one second later. On some SoCs (namely H3 ES2.0) the VSP
bandwidth is high enough to complete processing of 300 frames in less
than a second. The test thus suspends and resumes the system with the
VSP idle instead of running, defeating the purpose of the test.

Fix this by increasing the number of frames to process to 1000. The
frame count is now passed as an argument to the
test_extended_wpf_packing function to ease future changes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Don't explicitly state at which frame suspend/resume is expected to
occur as that's device-dependent

- Compare the last three frames instead of just one
---
 tests/vsp-unit-test-0020.sh | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
index 91f6b167f22e..c662466b76de 100755
--- a/tests/vsp-unit-test-0020.sh
+++ b/tests/vsp-unit-test-0020.sh
@@ -15,25 +15,26 @@ features="rpf.0 wpf.0"
 # These can be extracted from /sys/power/pm_test
 suspend_modes="freezer devices platform processors core"
 
-# This extended function performs the same
-# as it's non-extended name-sake - but runs the pipeline
-# for 300 frames. The suspend action occurs between frame #150~#200
-
+# This extended function performs the same as it's non-extended name-sake, but
+# runs the pipeline for a configurable number of frames.
 test_extended_wpf_packing() {
 	local format=$1
+	local num_frames=$2
 
 	pipe_configure rpf-wpf 0 0
 	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
 
-	vsp_runner rpf.0 --count=300 &
-	vsp_runner wpf.0 --count=300 --skip=297
+	vsp_runner rpf.0 --count=$num_frames &
+	vsp_runner wpf.0 --count=$num_frames --skip=$((num_frames-3))
 
 	local result=$(compare_frames)
 	[ x$result == xpass ] && return 0 || return 1
 }
 
 test_hw_pipe() {
-	test_extended_wpf_packing RGB24
+	# Run the pipeline for 1000 frames. The suspend action should occur in
+	# the middle.
+	test_extended_wpf_packing RGB24 1000
 }
 
 test_suspend_resume() {
-- 
Regards,

Laurent Pinchart
