Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kbingham@kernel.org>
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 4/5] tests: Test suspend/resume on idle pipelines
Date: Fri, 25 Nov 2016 13:59:15 +0000
Message-Id: <1480082356-23380-5-git-send-email-kbingham@kernel.org>
In-Reply-To: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide a test to verify the hardware is functional both before and
after entering a suspend / resume cycle. Make use of the
/sys/power/pm_test functionality provided by CONFIG_PM_DEBUG to perform
the testing

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 tests/vsp-unit-test-0019.sh | 77 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100755 tests/vsp-unit-test-0019.sh

diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
new file mode 100755
index 000000000000..e7b94996c1aa
--- /dev/null
+++ b/tests/vsp-unit-test-0019.sh
@@ -0,0 +1,77 @@
+#!/bin/sh
+
+#
+# Test power-management suspend/resume whilst pipelines are idle
+#
+# Utilise the basic RPF->WPF packing test case as a measure that the hardware
+# is operable while we perform test suspend and resume, and verify that it is
+# still operable after resume.
+#
+# Format iteration loops are maintained, even with only one format so that this
+# test can be easily extended to try further formats if needed in the future.
+#
+
+source vsp-lib.sh
+
+features="rpf.0 wpf.0"
+formats="RGB24"
+
+# These can be extracted from /sys/power/pm_test
+suspend_modes="freezer devices platform processors core"
+
+test_wpf_packing() {
+	test_start "Verify WPF packing in $format before/after suspend:$mode"
+
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
+
+	vsp_runner rpf.0 &
+	vsp_runner wpf.0
+
+	local result=$(compare_frames)
+
+	test_complete $result
+}
+
+test_hw_pipe() {
+	local format
+
+	for format in $formats ; do
+		test_wpf_packing $format
+	done
+}
+
+test_suspend_resume() {
+	local test_results=0
+
+	# Test the hardware each side of suspend resume
+	test_hw_pipe
+
+	# Set the test mode
+	echo $mode > /sys/power/pm_test
+
+	# Comence suspend
+	# The pm_test framework will automatically resume after 5 seconds
+	echo mem > /sys/power/state
+
+	# Verify the hardware is still operational
+	test_hw_pipe
+}
+
+test_main() {
+	local mode;
+
+	# Check for pm-suspend test option
+	if [ ! -e /sys/power/pm_test ] ; then
+		echo "$0: Suspend Resume testing requires CONFIG_PM_DEBUG"
+		test_complete skip
+		return
+	fi;
+
+	for mode in $suspend_modes ; do
+		test_suspend_resume $mode
+	done;
+}
+
+test_init $0 "$features"
+test_run
-- 
2.7.4
