Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49215 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbeHXN6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 09:58:35 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] vin-tests: yavta-hdmi: Add VIN4 and parallel link
Date: Fri, 24 Aug 2018 12:24:22 +0200
Message-Id: <1535106262-13004-5-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for VIN4 to yavta-hdmi and check if format propagation should
go through 'mc_propagate_parallel()' if the HDMI receiver chip is an
ADV7612 one.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 yavta-hdmi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/yavta-hdmi b/yavta-hdmi
index fdec546..2e3b625 100755
--- a/yavta-hdmi
+++ b/yavta-hdmi
@@ -33,14 +33,23 @@ case $vc in
         dev=/dev/$vin3
         csipad=4
         ;;
+    4)
+        vinname=$vinname4
+        dev=/dev/$vin4
+        ;;
     *)
         echo "Unkown VC '$vc'"
         exit 1
 esac
 
 mc_reset
-mc_set_link "$csi40name" $csipad "$vinname" 1
-mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" $csipad "$vinname"
+if [[ "$hdminame" == "adv7612 0-004c" ]]; then
+	mc_set_link "$hdminame" 1  "$vinname" 1
+	mc_propagate_parallel "$vinname"
+else
+	mc_set_link "$csi40name" $csipad "$vinname" 1
+	mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" $csipad "$vinname"
+fi
 
 out=/tmp/vin-tests
 rm -fr $out
-- 
2.7.4
