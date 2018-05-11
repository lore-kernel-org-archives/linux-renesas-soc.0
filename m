Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:53823 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752980AbeEKKBS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 06:01:18 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] boards: Add R8A77995 D3 Draak board
Date: Fri, 11 May 2018 12:00:35 +0200
Message-Id: <1526032839-14536-2-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for R-Car Gen3 Draak board based on R8A77995 SoC.
Define additional variables such as which vin should be used to perform
capture operations and which is the destination image format for each
board. These variables will be used later to generalize the image
scripts.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/boards.sh | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index e078ba5..f265463 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -16,6 +16,8 @@ case $info in
         vin6=$(basename /sys/devices/platform/soc/e6ef6000.video/video4linux/video*)
         vin7=$(basename /sys/devices/platform/soc/e6ef7000.video/video4linux/video*)
 
+        capture_vin="${vin0}"
+
         vinname0="VIN0 output"
         vinname1="VIN1 output"
         vinname2="VIN2 output"
@@ -35,6 +37,8 @@ case $info in
 
         txaname="adv748x 4-0070 txa"
         txbname="adv748x 4-0070 txb"
+
+        convert_format="RGB565"
         ;;
 
     "Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+")
@@ -50,6 +54,8 @@ case $info in
         vin6=$(basename /sys/devices/platform/soc/e6ef6000.video/video4linux/video*)
         vin7=$(basename /sys/devices/platform/soc/e6ef7000.video/video4linux/video*)
 
+        capture_vin="${vin0}"
+
         vinname0="VIN0 output"
         vinname1="VIN1 output"
         vinname2="VIN2 output"
@@ -68,6 +74,8 @@ case $info in
 
         txaname="adv748x 4-0070 txa"
         txbname="adv748x 4-0070 txb"
+
+        convert_format="RGB565"
         ;;
 
     "Renesas Salvator-X board based on r8a7796")
@@ -82,6 +90,8 @@ case $info in
         vin6=$(basename /sys/devices/platform/soc/e6ef6000.video/video4linux/video*)
         vin7=$(basename /sys/devices/platform/soc/e6ef7000.video/video4linux/video*)
 
+        capture_vin="${vin0}"
+
         vinname0="VIN0 output"
         vinname1="VIN1 output"
         vinname2="VIN2 output"
@@ -99,6 +109,8 @@ case $info in
 
         txaname="adv748x 4-0070 txa"
         txbname="adv748x 4-0070 txb"
+
+        convert_format="RGB565"
         ;;
 
     "Renesas Eagle board based on r8a77970")
@@ -109,6 +121,8 @@ case $info in
         vin2=$(basename /sys/devices/platform/soc/e6ef2000.video/video4linux/video*)
         vin3=$(basename /sys/devices/platform/soc/e6ef3000.video/video4linux/video*)
 
+        capture_vin="${vin0}"
+
         vinname0="VIN0 output"
         vinname1="VIN1 output"
         vinname2="VIN2 output"
@@ -121,6 +135,23 @@ case $info in
 
         txaname="adv748x 0-0070 txa"
         txbname="adv748x 0-0070 txb"
+
+        convert_format="RGB565"
+        ;;
+
+    "Renesas Draak board based on r8a77995")
+        echo "Board: D3"
+        gen="gen3"
+        digital=1
+        vin4=$(basename /sys/devices/platform/soc/e6ef4000.video/video4linux/video*)
+
+        capture_vin="${vin4}"
+
+        vinname4="VIN4 output"
+
+        hdminame="adv7612 0-004c"
+
+        convert_format="BGR32"
         ;;
 
     "Koelsch")
-- 
2.7.4
