Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:57205 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752984AbeEKKBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 06:01:19 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] vin-tests: Add function to propagate digital format
Date: Fri, 11 May 2018 12:00:36 +0200
Message-Id: <1526032839-14536-3-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add function to vin-tests.sh to propagate the HDMI format for the
digital input use case. This is useful for D3 when capturing HDMI input
from adv7612 at 640x480 resolution.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/vin-tests.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
index 4a38d43..52e25b9 100644
--- a/scripts/vin-tests.sh
+++ b/scripts/vin-tests.sh
@@ -206,3 +206,12 @@ mc_propagate_cvbs() {
 
     mc_propagate_format "$cvbsname" 8 "$txbname" 0 "$csi20name" 1 "$vin"
 }
+
+# HDMI input from ADV7612 (D3 Draak)
+mc_propagate_hdmi_digital() {
+    vin="$1"
+    vdev=$($mediactl -d $mdev -e "$vin" )
+
+    media-ctl -v -d $mdev -V "'$hdminame':1 [fmt:RGB888_1X24/640x480 field:none]"
+    yavta -f XBGR32 -s 640x480 --field none $vdev
+}
-- 
2.7.4
