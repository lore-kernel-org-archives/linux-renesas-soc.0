Return-Path: <SRS0=VuhC=74=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C91CC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 12:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BC8C206B7
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 12:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgFOMQ3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 08:16:29 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33351 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbgFOMQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 08:16:28 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id C3A82100008;
        Mon, 15 Jun 2020 12:16:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] scripts/boards.sh: Add support for E3 SoC
Date:   Mon, 15 Jun 2020 14:19:35 +0200
Message-Id: <20200615121935.108142-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615121935.108142-1-jacopo@jmondi.org>
References: <20200615121935.108142-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car E3 R8A77990 SoC in scripts/boards.sh.

The E3 SoC features VIN4 and VIN5 instances only, so add them to
yavta-hdmi and yavta-cvbs to support capture from there.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/boards.sh | 15 ++++++++++++---
 yavta-cvbs        | 10 ++++++++++
 yavta-hdmi        | 10 ++++++++++
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 84361d9..69a4d77 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -3,6 +3,11 @@
 info=$(strings /proc/device-tree/model)
 
 case $info in
+    "Renesas Ebisu board based on r8a77990")
+        gen="gen3"
+        vins="4 5"
+        csis="40"
+        ;;
     "Renesas Salvator-X board based on r8a7795 ES1.x")
         gen="gen3"
         vins="0 1 2 3 4 5 6 7"
@@ -65,17 +70,21 @@ if [[ "$gen" == "gen3" ]]; then
         esac
     done
 
-    if [[ "$info" == "Renesas Eagle board based on r8a77970" ]]; then
+    case "$info" in
+    "Renesas Eagle board based on r8a77970" | \
+    "Renesas Ebisu board based on r8a77990")
         cvbsname="adv748x 0-0070 afe"
         hdminame="adv748x 0-0070 hdmi"
 
         txaname="adv748x 0-0070 txa"
         txbname="adv748x 0-0070 txb"
-    else
+        ;;
+    *)
         cvbsname="adv748x 4-0070 afe"
         hdminame="adv748x 4-0070 hdmi"
 
         txaname="adv748x 4-0070 txa"
         txbname="adv748x 4-0070 txb"
-    fi
+        ;;
+    esac
 fi
diff --git a/yavta-cvbs b/yavta-cvbs
index 823db48..c32df1c 100755
--- a/yavta-cvbs
+++ b/yavta-cvbs
@@ -33,6 +33,16 @@ case $vc in
         dev=/dev/$vin3
         csipad=4
         ;;
+    4)
+        vinname=$vinname4
+        dev=/dev/$vin4
+        csipad=1
+        ;;
+    5)
+        vinname=$vinname5
+        dev=/dev/$vin5
+        csipad=2
+        ;;
     *)
         echo "Unkown VC '$vc'"
         exit 1
diff --git a/yavta-hdmi b/yavta-hdmi
index b371d3b..62adf00 100755
--- a/yavta-hdmi
+++ b/yavta-hdmi
@@ -33,6 +33,16 @@ case $vc in
         dev=/dev/$vin3
         csipad=4
         ;;
+    4)
+        vinname=$vinname4
+        dev=/dev/$vin4
+        csipad=1
+        ;;
+    5)
+        vinname=$vinname5
+        dev=/dev/$vin5
+        csipad=2
+        ;;
     *)
         echo "Unkown VC '$vc'"
         exit 1
-- 
2.27.0

