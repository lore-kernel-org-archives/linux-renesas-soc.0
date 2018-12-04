Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbeLDPv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:58 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 5/7] vsp-lib: Allow forcing pixel perfect comparisons
Date: Tue,  4 Dec 2018 15:51:44 +0000
Message-Id: <20181204155146.9726-6-kieran.bingham@ideasonboard.com>
In-Reply-To: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide a means for the tester to request pixel perfect matches on tests.
This can be either through setting the environment variable VSP_PIXEL_PERFECT, or
by passing either '-p' or '--pixel-perfect' on the test command line.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index cf15a045ea8c..9140254c7459 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -287,7 +287,11 @@ compare_frames() {
 	params=${params//)/_}
 	params=$pipe-$in_fmt-$out_fmt-$size$params
 
-	if [ x$__vsp_pixel_perfect != xtrue ] ; then
+	# The system can hint when pixel-perfection is not supported,
+	# however the user can override to force this requirement with
+	# VSP_PIXEL_PERFECT=1 in the environment or by passing -p, or
+	# --pixel-perfect on the commandline.
+	if [ x$__vsp_pixel_perfect != xtrue -a x$VSP_PIXEL_PERFECT != x1 ] ; then
 		method=fuzzy
 	fi
 
@@ -1113,10 +1117,15 @@ case $1 in
 		export VSP_KEEP_FRAMES=1
 		shift
 		;;
+	-p|--pixel-perfect)
+		export VSP_PIXEL_PERFECT=1
+		shift
+		;;
 	-h|--help)
 		echo "$(basename $0): VSP Test library"
 		echo "  -x|--debug          enable shell debug"
 		echo "  -k|--keep-frames    keep generated and captured frames"
+		echo "  -p|--pixel-perfect  frames must match with pixel perfection"
 		echo "  -h|--help           this help"
 		exit
 		shift
-- 
2.17.1
