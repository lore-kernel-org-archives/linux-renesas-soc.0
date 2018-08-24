Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43585 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbeHXN6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 09:58:33 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] vin-tests: Add support for D3 Draak
Date: Fri, 24 Aug 2018 12:24:19 +0200
Message-Id: <1535106262-13004-2-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for D3 Draak board.

Draak has its HDMI input connected to an ADV7612 which connects to VIN4
parallel data inputs.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/boards.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 26fdab9..7eb3a27 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -29,6 +29,13 @@ case $info in
         # for V3M, but results in an image.
         parallelformat="YUYV8_1X16"
         ;;
+    "Renesas Draak board based on r8a77995")
+        gen="gen3"
+        vins="4"
+        parallelname="adv7612 0-004c"
+        # FIXME: This is a hackfor D3, but results in an image.
+        parallelformat="YUYV8_1X16"
+        ;;
     "Koelsch")
         gen="gen2"
 
@@ -70,6 +77,8 @@ if [[ "$gen" == "gen3" ]]; then
 
         txaname="adv748x 0-0070 txa"
         txbname="adv748x 0-0070 txb"
+    elif [[ "$info" == "Renesas Draak board based on r8a77995" ]]; then
+        hdminame="adv7612 0-004c"
     else
         cvbsname="adv748x 4-0070 afe"
         hdminame="adv748x 4-0070 hdmi"
-- 
2.7.4
