Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34914 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751342AbdHXJaS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:30:18 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] tests: Add BRS test
Date: Thu, 24 Aug 2017 12:30:43 +0300
Message-Id: <20170824093043.8606-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/vsp-unit-test-0024.sh | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100755 tests/vsp-unit-test-0024.sh

diff --git a/tests/vsp-unit-test-0024.sh b/tests/vsp-unit-test-0024.sh
new file mode 100755
index 000000000000..036429254a8f
--- /dev/null
+++ b/tests/vsp-unit-test-0024.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+#
+# Test composition through the BRS in RGB and YUV formats.
+#
+
+source vsp-lib.sh
+
+features="rpf.0 rpf.1 brs wpf.0"
+formats="RGB24 YUV444M"
+
+test_brs() {
+	local format=$1
+	local ninputs=$2
+
+	test_start "BRS in $format with $ninputs inputs"
+
+	pipe_configure rpf-brs $ninputs
+	format_configure rpf-brs $format 1024x768 $ninputs
+
+	local input
+	for input in `seq 0 1 $((ninputs-1))` ; do
+		vsp_runner rpf.$input &
+	done
+	vsp_runner wpf.0
+
+	local result=$(compare_frames)
+
+	test_complete $result
+}
+
+test_main() {
+	local num_inputs=2
+	local format
+	local ninputs
+
+	for format in $formats ; do
+		for ninputs in `seq $num_inputs` ; do
+			test_brs $format $ninputs
+		done
+	done
+}
+
+test_init $0 "$features"
+test_run
-- 
Regards,

Laurent Pinchart
