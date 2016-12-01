Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=i9uI=XQ=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCHv2 2/5] scripts: Provide bin2png.sh helper
Date: Thu,  1 Dec 2016 21:31:46 +0000
Message-Id: <1480627909-19207-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Identify the size and format from the test output filename, and pass
to raw2rgbpnm for conversion to a PNM file.

>From there we can convert easily to a PNG output file.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:

- use 'convert' to proces png files to png
- strip '.bin' from target filenames

 scripts/Makefile   |  2 +-
 scripts/bin2png.sh | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
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
index 000000000000..bde1ddfa3eab
--- /dev/null
+++ b/scripts/bin2png.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+FILE="$1"
+
+PNM=$(echo $FILE | sed -e 's|\.bin$|.pnm|')
+PNG=$(echo $FILE | sed -e 's|\.bin$|.png|')
+
+fmt=$(echo $FILE | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|')
+size=$(echo $FILE | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\2|')
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
+raw2rgbpnm -s $size -f $fmt $FILE $PNM && \
+	convert $PNM $PNG
+rm $PNM
-- 
2.7.4
