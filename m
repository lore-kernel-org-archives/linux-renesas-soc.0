Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbeLDPvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:55 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 3/7] vsp-lib: Provide command line argument parsing
Date: Tue,  4 Dec 2018 15:51:42 +0000
Message-Id: <20181204155146.9726-4-kieran.bingham@ideasonboard.com>
In-Reply-To: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Extend the vsp-lib to support command line parsing for all tests.  The
arguments parsed here should be common to all tests, and initially
provide shell level verbose debug output, and the option to easily keep
frames output by the VSP1.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 0f3992a7827e..56969606382f 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -1094,3 +1094,37 @@ test_complete() {
 test_run() {
 	test_main | ./logger.sh error >> $logfile
 }
+
+# ------------------------------------------------------------------------------
+# Common argument parsing
+#
+# non-recognised arguments are restored, to allow tests to implement their own
+# parsing if necessary.
+
+POSITIONAL=()
+while [[ $# -gt 0 ]]
+do
+case $1 in
+	-x|--debug)
+		set -x;
+		shift
+		;;
+	-k|--keep-frames)
+		export VSP_KEEP_FRAMES=1
+		shift
+		;;
+	-h|--help)
+		echo "$(basename $0): VSP Test library"
+		echo "  -x|--debug          enable shell debug"
+		echo "  -k|--keep-frames    keep generated and captured frames"
+		echo "  -h|--help           this help"
+		exit
+		shift
+		;;
+	*)    # unknown option
+		POSITIONAL+=("$1") # save it in an array for later
+		shift # past argument
+		;;
+esac
+done
+set -- "${POSITIONAL[@]}" # restore positional parameters
-- 
2.17.1
