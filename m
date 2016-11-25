Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kbingham@kernel.org>
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH 1/5] scripts: Test suite runner
Date: Fri, 25 Nov 2016 13:59:12 +0000
Message-Id: <1480082356-23380-2-git-send-email-kbingham@kernel.org>
In-Reply-To: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran@bingham.xyz>

Provide a utility script to execute all vsp unit tests, as well
as the option to execute multiple iterations of the suite.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 scripts/vsp-tests.sh | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100755 scripts/vsp-tests.sh

diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
new file mode 100755
index 000000000000..e5ffa0ec4236
--- /dev/null
+++ b/scripts/vsp-tests.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+##
+## VSP Tests runner
+##
+## Automatically execute all vsp-unit tests
+## Move test failure results to a specific folder for
+## the running kernel version
+##
+## An argument can be provided to specify the number of
+## iterations to perform
+##
+## usage:
+##  ./vsp-tests.sh <n>
+##
+##   n: Number of iterations to execute test suite
+##
+
+KERNEL_VERSION=`uname -r`
+
+run_test() {
+	echo $1
+	./$1
+
+	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ];
+	then
+		RESULTS_DIR=$KERNEL_VERSION/test-$1/$2/
+
+		echo "Moving *.bin to test-$1/$2/";
+		mkdir -p $RESULTS_DIR;
+		echo "mv *.bin $RESULTS_DIR";
+		mv *.bin $RESULTS_DIR;
+	fi;
+}
+
+run_suite() {
+	echo "Test loop $1"
+
+	for test in vsp-unit-test*.sh; do
+		run_test $test $1;
+	done;
+}
+
+for loop in `seq 1 1 $1`; do
+	run_suite $loop
+done;
-- 
2.7.4
