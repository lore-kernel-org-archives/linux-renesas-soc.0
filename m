Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=o/Yn=ZV=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH 1/5] vsp-lib: sort output frames correctly
Date: Wed,  8 Feb 2017 14:03:56 +0000
Message-Id: <f20a4abc8c18e8b3bb57dabf283f0eebbd220086.1486562055.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

In the event of failed frames, or VSP_KEEP_FRAMES being set, the output
file names do not sort such that the reference frame is next to the
failed frame.

This can make comparing reference frames and the relevant output frames
tedious and difficult.

Re-arrange the output filenames such that the sort order will match the
option parameters correctly, followed by either the reference frame
identifier, or the frame number at the end of the filename string

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 1a356ec02374..5aff30217a27 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -278,12 +278,12 @@ compare_frames() {
 		}
 
 		if [ $match = "false" -o x$VSP_KEEP_FRAMES = x1 ] ; then
-			mv $frame ${0/.sh/}-$(basename ${frame/.bin/-$params.bin})
+			mv $frame ${0/.sh/}-$params-$(basename ${frame})
 		fi
 	done
 
 	if [ x$VSP_KEEP_FRAMES = x1 -o $result = "fail" ] ; then
-		mv ${frames_dir}ref-frame.bin ${0/.sh/}-ref-frame-$params.bin
+		mv ${frames_dir}ref-frame.bin ${0/.sh/}-$params-ref-frame.bin
 	else
 		rm -f ${frames_dir}ref-frame.bin
 		rm -f ${frames_dir}frame-*.bin
-- 
git-series 0.9.1
