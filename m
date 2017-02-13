Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH] vsp-lib: Fix reference frame generation for HSV input formats
Date: Mon, 13 Feb 2017 17:46:56 +0200
Message-Id: <20170213154656.30363-1-laurent.pinchart@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

gen-image doesn't support processing HSV input frames. Fortunately the
HSV tests don't require it either, when they take an HSV input frame
they just pass it straight to the WPF. We can thus set the input format
to RGB for reference frame generation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index ae9683cffab6..695e081bf34d 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -103,6 +103,16 @@ reference_frame() {
 	local alpha=
 	local options=
 
+	# gen-image doesn't support processing HSV input images. The good news
+	# is that the HSV tests that take HSV images as inputs don't need to
+	# perform any processing. We can set the input format to RGB for HSB
+	# reference frame generation.
+	case $in_format in
+	HSV24 | HSV32)
+		in_format=ARGB32
+		;;
+	esac
+
 	# Start with the input format to compute the alpha value being used by
 	# the RPF after unpacking. Keep in sync with generate_input_frame.
 	case $in_format in
-- 
Regards,

Laurent Pinchart
