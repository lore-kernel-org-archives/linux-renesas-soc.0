Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:44248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbeHaRsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 13:48:36 -0400
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests: PATCH] vsp-lib: Provide command line argument parsing
Date: Fri, 31 Aug 2018 14:40:58 +0100
Message-Id: <20180831134058.27454-1-kieran.bingham@ideasonboard.com>
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
index 0f3992a7827e..6a0f4af5eaf5 100755
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
+# non-recognised arguements are restored, to allow tests
+# to implement their own parsing if necessary.
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
