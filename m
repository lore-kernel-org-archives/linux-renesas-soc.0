Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH] scripts: Add statistics to test suite runner
Date: Mon, 13 Feb 2017 15:26:46 +0200
Message-Id: <20170213132646.10599-1-laurent.pinchart@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Print the number of passed, failed and skipped tests.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-tests.sh | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
index 6a10f70ca35c..1ed81713e5c5 100755
--- a/scripts/vsp-tests.sh
+++ b/scripts/vsp-tests.sh
@@ -21,9 +21,17 @@ KERNEL_VERSION=`uname -r`
 run_test() {
 	local script=$1
 	local iteration=$2
+	local IFS="$(printf '\n\t')"
 
 	echo "- $script"
-	./$script
+
+	local output=$(./$script 2>&1 | tee /proc/self/fd/2)
+	for line in $output ; do
+		(echo "$line" | grep -q 'fail$') && num_fail=$((num_fail+1))
+		(echo "$line" | grep -q 'pass$') && num_pass=$((num_pass+1))
+		(echo "$line" | grep -q 'skipped$') && num_skip=$((num_skip+1))
+		num_test=$((num_test+1))
+	done
 
 	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ] ; then
 		local dir=$KERNEL_VERSION/test-$script/$iteration/
@@ -36,9 +44,16 @@ run_test() {
 run_suite() {
 	echo "--- Test loop $1 ---"
 
+	num_fail=0
+	num_pass=0
+	num_skip=0
+	num_test=0
+
 	for test in vsp-unit-test*.sh; do
 		run_test $test $1
 	done;
+
+	echo "$num_test tests: $num_pass passed, $num_fail failed, $num_skip skipped"
 }
 
 for loop in `seq 1 1 $1`; do
-- 
Regards,

Laurent Pinchart
