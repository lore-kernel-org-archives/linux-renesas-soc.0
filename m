Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:44258 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbeHaRsx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 13:48:53 -0400
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests: PATCH] tests: Provide copy test to validate 1xN streams
Date: Fri, 31 Aug 2018 14:41:16 +0100
Message-Id: <20180831134116.27510-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Validate that a 1xN stream can be read through the RPF and written
through the WPF.

The test framework does not currently support processing images where
the stride does not match the output width - so the testing is currently
limited to testing only the vertical direction in this aspect.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 tests/vsp-unit-test-0025.sh | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100755 tests/vsp-unit-test-0025.sh

diff --git a/tests/vsp-unit-test-0025.sh b/tests/vsp-unit-test-0025.sh
new file mode 100755
index 000000000000..5c8980c40d89
--- /dev/null
+++ b/tests/vsp-unit-test-0025.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+#
+# Test pipelines which have a single pixel dimension. Use a RPF -> UDS -> WPF
+# pipeline with identical input and output formats to generate our output.
+#
+
+. ./vsp-lib.sh
+
+features="rpf.0 uds wpf.0"
+formats="RGB24 ARGB32"
+
+# Input is directly copied to the output. No change in format or size.
+test_copy() {
+	local format=$1
+	local insize=$2
+
+	test_start "copying $insize in $format"
+
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 $format $insize $format
+
+	vsp_runner rpf.0 &
+	vsp_runner wpf.0
+
+	local result=$(compare_frames)
+
+	test_complete $result
+}
+
+test_main() {
+	local format
+
+	for format in $formats ; do
+		test_copy $format 1024x768
+		test_copy $format 128x128
+		test_copy $format 128x1
+
+		# Skipped : Test framework does not yet support strides != width
+		#test_copy $format 1x128
+	done
+}
+
+test_init $0 "$features"
+test_run
-- 
2.17.1
