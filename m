Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbeLDPv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:59 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 6/7] vsp-lib: Support late queuing of buffers in yavta
Date: Tue,  4 Dec 2018 15:51:45 +0000
Message-Id: <20181204155146.9726-7-kieran.bingham@ideasonboard.com>
In-Reply-To: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide the pass-through option of --queue-late to vsp-runner, to request
that yavta will queue frames after the stream has started.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 9140254c7459..3d2792707d24 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -898,6 +898,7 @@ vsp_runner() {
 	local count=10
 	local pause=
 	local skip=7
+	local queue_late=
 
 	for option in $* ; do
 		case $option in
@@ -916,6 +917,8 @@ vsp_runner() {
 		--skip=*)
 			skip=${option/--skip=/}
 			;;
+		--queue-late)
+			queue_late=queue-late
 
 		*)
 			return 1
@@ -959,6 +962,7 @@ vsp_runner() {
 
 	$yavta -c$count -n $buffers ${format:+-f $format} ${size:+-s $size} \
 		${skip:+--skip $skip} ${file:+--file=$file} ${pause:+-p$pause} \
+		${queue_late:+--$queue_late} \
 		$videodev | ./logger.sh $entity >> $logfile
 }
 
-- 
2.17.1
