Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v2 1/4] vsp-lib: Filter non-filesystem regular characters
Date: Fri, 10 Feb 2017 13:30:05 +0000
Message-Id: <a6cd919063a1d5983be9dd24268881e23dc294aa.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Parameters can contain characters not suited to use in filenames.

Add '=','(', and ')' to the filtering, and replace with '_'

This reduces extra escaping, and quoting when working with the output
filenames of failed tests and VSP_KEEP_FRAMES=1

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 8f2755b57519..9e5e57b8c4ba 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -258,6 +258,9 @@ compare_frames() {
 	local params=${args// /-}
 	params=${params:+-$params}
 	params=${params//\//_}
+	params=${params//=/_}
+	params=${params//(/_}
+	params=${params//)/_}
 	params=$in_fmt-$out_fmt-$size$params
 
 	if [ x$__vsp_pixel_perfect != xtrue ] ; then
-- 
git-series 0.9.1
