Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=i9uI=XQ=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCHv2 1/5] scripts: Test suite runner
Date: Thu,  1 Dec 2016 21:31:45 +0000
Message-Id: <1480627909-19207-2-git-send-email-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide a utility script to execute all vsp unit tests, as well
as the option to execute multiple iterations of the suite.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2
- remove spurious uses of ';'
- fix output logging

 scripts/vsp-tests.sh | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100755 scripts/vsp-tests.sh

diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
new file mode 100755
index 000000000000..8b21176ccc09
--- /dev/null
+++ b/scripts/vsp-tests.sh
@@ -0,0 +1,49 @@
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
+	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ]
+	then
+		RESULTS_DIR=$KERNEL_VERSION/test-$1/$2/
+
+		echo "Moving *.bin to $RESULTS_DIR"
+		mkdir -p $RESULTS_DIR
+		mv *.bin $RESULTS_DIR
+		for f in $RESULTS_DIR/*.bin
+		do
+			./bin2png.sh "$f"
+		done
+	fi
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
