Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=zE3d=ZY=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH 2/2] tests: Add extended stress testing
Date: Sat, 11 Feb 2017 14:43:06 +0000
Message-Id: <1486824186-26450-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <1486824186-26450-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1486824186-26450-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Duplicate the functionality of vsp-unit-test-0020, to provide a longer
duration task for the hardware to run, whilst we load the system using the
'stress' utility.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 tests/vsp-unit-test-0023.sh | 61 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100755 tests/vsp-unit-test-0023.sh

diff --git a/tests/vsp-unit-test-0023.sh b/tests/vsp-unit-test-0023.sh
new file mode 100755
index 000000000000..e944b12c9d53
--- /dev/null
+++ b/tests/vsp-unit-test-0023.sh
@@ -0,0 +1,61 @@
+#!/bin/sh
+
+#
+# Test active pipeline, with high load on CPU/Memory/IO using 'stress'
+#
+# Utilise the same test as for suspend resume testing, to verify a longer
+# duration pipeline lifetime while we stress the system.
+#
+
+source vsp-lib.sh
+
+features="rpf.0 wpf.0"
+
+# This extended function performs the same
+# as it's non-extended name-sake - but runs the pipeline
+# for 300 frames.
+
+test_extended_wpf_packing() {
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 ARGB32 1024x768 RGB24
+
+	vsp_runner rpf.0 --count=300 &
+	vsp_runner wpf.0 --count=300 --skip=297
+
+	local result=$(compare_frames)
+
+	if [ x$result == x"pass" ] ; then
+		return 0;
+	else
+		return 1;
+	fi
+}
+
+exists() { type -t "$1" > /dev/null 2>&1; }
+
+test_main() {
+	test_start "long duration pipelines under stress"
+
+	if exists stress ; then
+		STRESS=`which stress`
+	else
+		echo "$0: Stress test requires utility 'stress'"
+		test_complete skip
+		return
+	fi
+
+	# Start stressing the system, as a background task
+	$STRESS --cpu 8 --io 4 --vm 2 --vm-bytes 128M &
+
+	if test_extended_wpf_packing ; then
+		test_complete pass
+	else
+		test_complete fail
+	fi
+
+	# Recover the system. Stress launches multiple PIDs, so it's best to:
+	killall -9 stress
+}
+
+test_init $0 "$features"
+test_run
\ No newline at end of file
-- 
2.7.4
