Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42394 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbeHaOaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 10:30:55 -0400
From: Kieran Bingham <kieran@ksquared.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests: PATCH] tests: add pseudo platform test
Date: Fri, 31 Aug 2018 11:23:59 +0100
Message-Id: <20180831102359.18335-1-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide an initial test which can run as part of the test suite.
This test will report the platform and kernel version, along with
the identified paths of required utilities.

This will aid in ensuring that required tools are available on a
running platform - and report the kernel and platform details in
any test suite output for clarification of results.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---

This addition allows extra information to be recorded about the system
when running the tests in a batch (or in future automated testing)

Ideally - we would report the version of each tool as well, allowing any
issues to be fully recreated.


 tests/vsp-unit-test-0000.sh | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100755 tests/vsp-unit-test-0000.sh

diff --git a/tests/vsp-unit-test-0000.sh b/tests/vsp-unit-test-0000.sh
new file mode 100755
index 000000000000..144cfc677b32
--- /dev/null
+++ b/tests/vsp-unit-test-0000.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# Report testing conditions
+
+model=`cat /sys/firmware/devicetree/base/model`
+
+echo "Test Conditions:"
+
+function check_all() {
+	echo "  Platform: " "$model"
+	echo "  Kernel release: " `uname -r`
+	echo "  convert: " `which convert`
+	echo "  compare: " `which compare`
+	echo "  killall: " `which killall`
+	echo "  raw2rgbpnm: " `which raw2rgbpnm`
+	echo "  stress: " `which stress`
+	echo "  yavta: " `which yavta`
+}
+
+check_all | column -ts ":"
-- 
2.17.1
