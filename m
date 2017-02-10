Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v2 4/4] tests: Add RPF cropping test
Date: Fri, 10 Feb 2017 13:30:08 +0000
Message-Id: <e5e453cb2a3a04e3f265f1457aa7e77cb19837c3.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Test both the input cropping size and position

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/vsp-unit-test-0021.sh | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100755 tests/vsp-unit-test-0021.sh

diff --git a/tests/vsp-unit-test-0021.sh b/tests/vsp-unit-test-0021.sh
new file mode 100755
index 000000000000..9d692cfc6194
--- /dev/null
+++ b/tests/vsp-unit-test-0021.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+#
+# Test RPF crop using RGB. Use a RPF -> WPF pipeline, passing a selection of
+# cropping windows.
+#
+
+source vsp-lib.sh
+
+features="rpf.0 wpf.0"
+crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
+
+test_rpf_cropping() {
+	test_start "RPF crop from $crop"
+
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 RGB24 1024x768 ARGB32 --rpfcrop=$crop
+
+	vsp_runner rpf.0 &
+	vsp_runner wpf.0
+
+	local result=$(compare_frames crop=${crop})
+
+	test_complete $result
+}
+
+test_main() {
+	local crop
+
+	for crop in $crops ; do
+		test_rpf_cropping $crop
+	done
+}
+
+test_init $0 "$features"
+test_run
-- 
git-series 0.9.1
