Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=i9uI=XQ=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCHv2 4/5] tests: Test suspend/resume on idle pipelines
Date: Thu,  1 Dec 2016 21:31:48 +0000
Message-Id: <1480627909-19207-5-git-send-email-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide a test to verify the hardware is functional both before and
after entering a suspend / resume cycle. Make use of the
/sys/power/pm_test functionality provided by CONFIG_PM_DEBUG to perform
the testing

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:

- extended pipeline test to run twice to verify stop->start process
- added return value checking to track test progress
- modified test reporting to be once per 'suspend mode'
- removed trailing ';' uses
- verify the pm_test mode is available, or skip

 tests/vsp-unit-test-0019.sh | 101 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100755 tests/vsp-unit-test-0019.sh

diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
new file mode 100755
index 000000000000..728dcdda29e6
--- /dev/null
+++ b/tests/vsp-unit-test-0019.sh
@@ -0,0 +1,101 @@
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
+
+# Two formats are specified so that the test is run twice.
+# This ensures that stop -> start works both before and after suspend
+formats="RGB24 RGB24"
+
+# These can be extracted from /sys/power/pm_test
+suspend_modes="freezer devices platform processors core"
+
+test_wpf_packing() {
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
+
+	vsp_runner rpf.0 &
+	vsp_runner wpf.0
+
+	local result=$(compare_frames)
+	[ x$result == xpass ] && return 0 || return 1
+}
+
+test_hw_pipe() {
+	local format
+	local result
+
+	for format in $formats ; do
+		test_wpf_packing $format
+		result=$?
+
+		# return early on failure
+		[ $result != 0 ] && return 1
+	done
+
+	return 0
+}
+
+test_suspend_resume() {
+	local result=0
+
+	test_start "non-active pipeline suspend/resume in suspend:$mode"
+
+	# Verify the test is available
+	grep -q $mode /sys/power/pm_test
+	if [ $? != 0 ]; then
+		test_complete skip
+		return
+	fi
+
+	# Test the hardware each side of suspend resume
+	test_hw_pipe
+	result=$((result+$?))
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
+	result=$((result+$?))
+
+	if [ $result != 0 ]; then
+		test_complete "failed"
+	else
+		test_complete "passed"
+	fi
+}
+
+test_main() {
+	local mode
+
+	# Check for pm-suspend test option
+	if [ ! -e /sys/power/pm_test ] ; then
+		echo "$0: Suspend Resume testing requires CONFIG_PM_DEBUG"
+		test_complete skip
+		return
+	fi
+
+	for mode in $suspend_modes ; do
+		test_suspend_resume $mode
+	done
+}
+
+test_init $0 "$features"
+test_run
-- 
2.7.4
