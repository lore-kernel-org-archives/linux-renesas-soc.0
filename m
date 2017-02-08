Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=o/Yn=ZV=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH 4/5] vsp-lib: Support RPF frame cropping
Date: Wed,  8 Feb 2017 14:03:59 +0000
Message-Id: <a5a3445637837e9bca24ccc6585e40f52acbe069.1486562055.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Pass the optional '--crop (X,Y)/WxH' parameter through reference_frame
allowing the input to be cropped for comparison

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 08bf8f36c582..42a4bb20d1be 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -162,6 +162,9 @@ reference_frame() {
 		vflip)
 			[ x$value = x1 ] && options="$options --vflip"
 			;;
+		crop)
+			options="$options --crop $value"
+			;;
 		esac
 	done
 
@@ -717,6 +720,40 @@ format_rpf_wpf() {
 	__vsp_wpf_format=$5
 }
 
+format_crop_rpf_wpf() {
+	local rpf=$1
+	local wpf=$2
+	local infmt=$(format_v4l2_to_mbus $3)
+	local size=$4
+	local outfmt=$(format_v4l2_to_mbus $5)
+	local rpfcrop=$6
+	local wpfcrop=$7
+	local rpfoutsize=
+	local outsize=
+
+	if [ x$rpfcrop != 'x' ] ; then
+		rpfcrop="crop:$rpfcrop"
+		rpfoutsize=$(echo $rpfcrop | sed 's/.*\///')
+	else
+		rpfoutsize=$size
+	fi
+
+	if [ x$wpfcrop != 'x' ] ; then
+		wpfcrop="crop:$wpfcrop"
+		outsize=$(echo $wpfcrop | sed 's/.*\///')
+	else
+		outsize=$rpfoutsize
+	fi
+
+	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$infmt/$size $rpfcrop]"
+	$mediactl -d $mdev -V "'$dev rpf.$rpf':1 [fmt:$infmt/$rpfoutsize]"
+	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$infmt/$rpfoutsize $wpfcrop]"
+	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$outfmt/$outsize]"
+
+	__vsp_rpf_format=$3
+	__vsp_wpf_format=$5
+}
+
 format_wpf() {
 	local format=$(format_v4l2_to_mbus $1)
 	local size=$2
-- 
git-series 0.9.1
