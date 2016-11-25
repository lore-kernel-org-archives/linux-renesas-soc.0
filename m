Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kbingham@kernel.org>
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH 2/5] scripts: Provide bin2png.sh helper
Date: Fri, 25 Nov 2016 13:59:13 +0000
Message-Id: <1480082356-23380-3-git-send-email-kbingham@kernel.org>
In-Reply-To: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran@bingham.xyz>

Identify the size and format from the test output filename, and pass
to raw2rgbpnm for conversion to a PNM file.

>From there we can convert easily to a PNG output file.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 scripts/Makefile   |  2 +-
 scripts/bin2png.sh | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100755 scripts/bin2png.sh

diff --git a/scripts/Makefile b/scripts/Makefile
index 8c452f4c54ce..6586b2989aed 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -1,4 +1,4 @@
-SCRIPTS=logger.sh vsp-lib.sh
+SCRIPTS=$(wildcard *.sh)
 
 all:
 
diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
new file mode 100755
index 000000000000..527c5546514d
--- /dev/null
+++ b/scripts/bin2png.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+FILE="$1"
+
+fmt=$(echo $FILE | sed -e 's/.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin/\1/')
+size=$(echo $FILE | sed -e 's/.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin/\2/')
+
+case $fmt in
+	yuv410m|yvu410m|yuv411m|yuv420m|yvu420m|yuv422m|yvu422m|yuv444m|yvu444m)
+		fmt=`echo $fmt | tr '[:lower:]' '[:upper:]'`
+		fmt=`echo $fmt | tr 'M' 'P'`
+		;;
+	nv12m|nv21m|nv16m|nv61m)
+		fmt=`echo $fmt | tr '[:lower:]' '[:upper:]'`
+		fmt=`echo $fmt | tr -d 'M'`
+		;;
+	argb555|xrgb555)
+		fmt=RGB555X
+		;;
+	argb32|xrgb32)
+		fmt=RGB32
+		;;
+	abgr32|xbgr32)
+		fmt=BGR32
+		;;
+	*)
+		fmt=`echo $fmt | tr '[:lower:]' '[:upper:]'`
+		;;
+esac
+
+# Only run pnmtopng if the conversion to PNM succeeds
+raw2rgbpnm -s $size -f $fmt $FILE $FILE.pnm && \
+	pnmtopng $FILE.pnm > $FILE.png
+rm $FILE.pnm
-- 
2.7.4
