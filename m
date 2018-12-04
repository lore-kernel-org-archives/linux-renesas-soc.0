Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33616 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbeLDPvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:54 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 1/7] tests: add pseudo platform test
Date: Tue,  4 Dec 2018 15:51:40 +0000
Message-Id: <20181204155146.9726-2-kieran.bingham@ideasonboard.com>
In-Reply-To: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide an initial test which can run as part of the test suite.
This test will report the platform and kernel version, along with
the identified paths of required utilities.

This will aid in ensuring that required tools are available on a
running platform - and report the kernel and platform details in
any test suite output for clarification of results.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
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
