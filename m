Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH] scripts: bin2png: Support conversion of all files in a directory
Date: Mon, 13 Feb 2017 16:15:22 +0200
Message-Id: <20170213141522.11545-1-laurent.pinchart@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

When the first argument is a directory name instead of a file name,
convert all test script output binaries in that directory.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/bin2png.sh | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
index 2563e87d4187..90fdfb077715 100755
--- a/scripts/bin2png.sh
+++ b/scripts/bin2png.sh
@@ -1,25 +1,40 @@
 #!/bin/sh
 
-FILE="$1"
+FILE=${1:-.}
 
-PNM=${FILE/.bin/.pnm}
-PNG=${FILE/.bin/.png}
+convert_image() {
+	local file=$1
+	local pnm=${file/%bin/pnm}
+	local png=${file/%bin/png}
 
-fmt=$(echo $FILE | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|' | tr '[:lower:]' '[:upper:]')
-size=$(echo $FILE | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\2|')
+	local format=$(echo $file | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|' | tr '[:lower:]' '[:upper:]')
+	local size=$(echo $file   | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\2|')
 
-case $fmt in
+	case $format in
 	yuv*|yvu*)
-		fmt=$(echo $fmt | tr 'M' 'P')
+		format=$(echo $format | tr 'M' 'P')
 		;;
 	nv*)
-		fmt=$(echo $fmt | tr -d 'M')
+		format=$(echo $format | tr -d 'M')
 		;;
 	*rgb*)
-		fmt=$(echo $fmt | tr -d 'AX')
+		format=$(echo $format | tr -d 'AX')
 		;;
-esac
+	esac
 
-raw2rgbpnm -s $size -f $fmt $FILE $PNM && \
-	convert $PNM $PNG
-rm $PNM
+	raw2rgbpnm -f $format -s $size $file $pnm && \
+		convert $pnm $png
+	rm $pnm
+}
+
+if [ -d $FILE ] ; then
+	if [ $(ls $FILE/vsp-unit-test-00*-*frame*.bin 2>/dev/null | wc -l) != 0 ] ; then
+		for f in $FILE/vsp-unit-test-00*-*frame*.bin ; do
+			convert_image $f
+		done
+	fi
+elif [ -f $FILE ] ; then
+	convert_image $FILE
+else
+	echo "Usage: $0 <file or directory>"
+fi
-- 
Regards,

Laurent Pinchart
