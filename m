Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:33521 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752977AbeEKKBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 06:01:19 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] gen3-links: Support linking for digital input
Date: Fri, 11 May 2018 12:00:37 +0200
Message-Id: <1526032839-14536-4-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for linking the digital subdevice to a vin instance. This is
useful for D3 board.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 gen3-links.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/gen3-links.sh b/gen3-links.sh
index cfcdeb7..0ec30e4 100755
--- a/gen3-links.sh
+++ b/gen3-links.sh
@@ -8,8 +8,14 @@ source $base/scripts/vin-tests.sh
 source $base/scripts/boards.sh
 
 mc_reset
-mc_set_link "$csi40name" 1 "$vinname0" 1
-mc_set_link "$csi20name" 1 "$vinname1" 1
 
-mc_propagate_hdmi "$vinname0"
-mc_propagate_cvbs "$vinname1"
+if [[ $digital -eq 1 ]]; then
+	mc_set_link "$hdminame" 1  "$vinname4" 1
+	mc_propagate_hdmi_digital "$vinname4"
+else
+	mc_set_link "$csi40name" 1 "$vinname0" 1
+	mc_set_link "$csi20name" 1 "$vinname1" 1
+
+	mc_propagate_hdmi "$vinname0"
+	mc_propagate_cvbs "$vinname1"
+fi
-- 
2.7.4
