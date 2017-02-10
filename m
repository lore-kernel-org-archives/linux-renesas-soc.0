Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v2 3/4] vsp-lib: Support RPF frame cropping
Date: Fri, 10 Feb 2017 13:30:07 +0000
Message-Id: <c732195e24dccdec607abd89eabd21c17b587a88.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Pass the optional '--crop (X,Y)/WxH' parameter through reference_frame
allowing the input to be cropped for comparison

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 52 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 9e5e57b8c4ba..d13e7b6cde31 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -147,6 +147,9 @@ reference_frame() {
 		clu)
 			options="$options --clu $value"
 			;;
+		crop)
+			options="$options --crop $value"
+			;;
 		hflip)
 			[ x$value = x1 ] && options="$options --hflip"
 			;;
@@ -662,22 +665,51 @@ format_rpf_wpf() {
 	local infmt=$(format_v4l2_to_mbus $3)
 	local size=$4
 	local outfmt=$(format_v4l2_to_mbus $5)
-	local crop=$6
+	local rpfcrop=
+	local wpfcrop=
+	local rpfoutsize=
 	local outsize=
+	local option=
+
+	__vsp_rpf_format=$3
+	__vsp_wpf_format=$5
+
+	shift 5
+
+	for option in $* ; do
+		case $option in
+		--rpfcrop=*)
+			rpfcrop=${option/--rpfcrop=/}
+			;;
+
+		--wpfcrop=*)
+			wpfcrop=${option/--wpfcrop=/}
+			;;
+		*)
+			echo "format_rpf_wpf: Unrecognised arguments"
+			return 1
+			;;
+		esac
+	done
 
-	if [ x$crop != 'x' ] ; then
-		crop="crop:$crop"
-		outsize=$(echo $crop | sed 's/.*\///')
+	if [ x$rpfcrop != 'x' ] ; then
+		rpfcrop="crop:$rpfcrop"
+		rpfoutsize=$(echo $rpfcrop | sed 's/.*\///')
 	else
-		outsize=$size
+		rpfoutsize=$size
 	fi
 
-	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$infmt/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$infmt/$size $crop]"
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$outfmt/$outsize]"
+	if [ x$wpfcrop != 'x' ] ; then
+		wpfcrop="crop:$wpfcrop"
+		outsize=$(echo $wpfcrop | sed 's/.*\///')
+	else
+		outsize=$rpfoutsize
+	fi
 
-	__vsp_rpf_format=$3
-	__vsp_wpf_format=$5
+	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$infmt/$size $rpfcrop]"
+	$mediactl -d $mdev -V "'$dev rpf.$rpf':1 [fmt:$infmt/$rpfoutsize]"
+	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$infmt/$rpfoutsize $wpfcrop]"
+	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$outfmt/$outsize]"
 }
 
 format_wpf() {
-- 
git-series 0.9.1
