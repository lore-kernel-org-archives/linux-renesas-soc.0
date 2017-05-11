Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:50430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751028AbdEKLiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 07:38:01 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCHv2] ADV748x: Reconfigure all scripts to support multi-subdevs
Date: Thu, 11 May 2017 12:37:52 +0100
Message-Id: <1494502672-17552-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The ADV748x used for testing now has entities to represent the HDMI,
CVBS, TXA and TXB ports.

Reconfigure all of the scripts to support propagating formats across
these extra entities

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
Hi Niklas,

Updates to the VIN-Tests to support multiple ADV749x Subdevices

v2:
 - scripts/m3.sh was missing!

 h3-compliance.sh     |  8 ++++----
 h3-qv4l2.sh          |  6 +++---
 m3-compliance.sh     |  8 ++++----
 m3-qv4l2.sh          |  6 +++---
 scripts/h3.sh        |  7 +++++--
 scripts/m3.sh        |  7 +++++--
 scripts/vin-tests.sh | 20 ++++++++++++++++++--
 7 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/h3-compliance.sh b/h3-compliance.sh
index 5a1fddfc01ce..a60f928291b0 100755
--- a/h3-compliance.sh
+++ b/h3-compliance.sh
@@ -12,16 +12,16 @@ test_compliance_begin
 mc_reset
 mc_set_link "$csi40name" 1 "$vinname0" 1
 mc_set_link "$csi20name" 1 "$vinname1" 1
-mc_propagate_format "$hdminame" 10 "$csi40name" 1 "$vinname0"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname1"
+mc_propagate_hdmi "$vinname0"
+mc_propagate_cvbs "$vinname1"
 test_compliance_mc $vin0
 test_compliance_mc $vin1
 
 mc_reset
 mc_set_link "$csi40name" 1 "$vinname2" 1
 mc_set_link "$csi20name" 1 "$vinname4" 1
-mc_propagate_format "$hdminame" 10 "$csi40name" 1 "$vinname2"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname4"
+mc_propagate_hdmi "$vinname2"
+mc_propagate_cvbs "$vinname4"
 test_compliance_mc $vin2
 test_compliance_mc $vin4
 
diff --git a/h3-qv4l2.sh b/h3-qv4l2.sh
index 9a23ef06c5f6..28bb31538230 100755
--- a/h3-qv4l2.sh
+++ b/h3-qv4l2.sh
@@ -10,9 +10,9 @@ mc_set_link "$csi40name" 1 "$vinname0" 1
 mc_set_link "$csi20name" 1 "$vinname1" 1
 mc_set_link "$csi20name" 1 "$vinname6" 1
 
-mc_propagate_format "$hdminame" 10 "$csi40name" 1 "$vinname0"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname1"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname6"
+mc_propagate_hdmi "$vinname0"
+mc_propagate_cvbs "$vinname1"
+mc_propagate_cvbs "$vinname6"
 
 # Test HDMI
 test_qv4l2 $vin0
diff --git a/m3-compliance.sh b/m3-compliance.sh
index 28d63e06cd51..a196ce2b5074 100755
--- a/m3-compliance.sh
+++ b/m3-compliance.sh
@@ -12,16 +12,16 @@ test_compliance_begin
 mc_reset
 mc_set_link "$csi40name" 1 "$vinname0" 1
 mc_set_link "$csi20name" 1 "$vinname1" 1
-mc_propagate_format "$hdminame" 10 "$csi40name" 1 "$vinname0"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname1"
+mc_propagate_hdmi "$vinname0"
+mc_propagate_cvbs "$vinname1"
 test_compliance_mc $vin0
 test_compliance_mc $vin1
 
 mc_reset
 mc_set_link "$csi40name" 1 "$vinname2" 1
 mc_set_link "$csi20name" 1 "$vinname4" 1
-mc_propagate_format "$hdminame" 10 "$csi40name" 1 "$vinname2"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname4"
+mc_propagate_hdmi "$vinname2"
+mc_propagate_cvbs "$vinname4"
 test_compliance_mc $vin2
 test_compliance_mc $vin4
 
diff --git a/m3-qv4l2.sh b/m3-qv4l2.sh
index 31c79864c842..816795fe2210 100755
--- a/m3-qv4l2.sh
+++ b/m3-qv4l2.sh
@@ -10,9 +10,9 @@ mc_set_link "$csi40name" 1 "$vinname0" 1
 mc_set_link "$csi20name" 1 "$vinname1" 1
 mc_set_link "$csi20name" 1 "$vinname6" 1
 
-mc_propagate_format "$hdminame" 10 "$csi40name" 1 "$vinname0"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname1"
-mc_propagate_format "$cvbsname" 11 "$csi20name" 1 "$vinname6"
+mc_propagate_hdmi "$vinname0"
+mc_propagate_cvbs "$vinname1"
+mc_propagate_cvbs "$vinname6"
 
 # Test HDMI
 test_qv4l2 $vin0
diff --git a/scripts/h3.sh b/scripts/h3.sh
index 440f55f82eb7..5882af1f295b 100644
--- a/scripts/h3.sh
+++ b/scripts/h3.sh
@@ -23,5 +23,8 @@ csi21name="rcar_csi2 fea90000.csi2"
 csi40name="rcar_csi2 feaa0000.csi2"
 csi41name="rcar_csi2 feab0000.csi2"
 
-cvbsname="adv7482 4-0034"
-hdminame="adv7482 4-0070"
+cvbsname="adv748x 4-0070 afe"
+hdminame="adv748x 4-0070 hdmi"
+
+txaname="adv748x 4-0070 txa"
+txbname="adv748x 4-0070 txb"
diff --git a/scripts/m3.sh b/scripts/m3.sh
index 38362107104b..20320d91c9ee 100644
--- a/scripts/m3.sh
+++ b/scripts/m3.sh
@@ -21,5 +21,8 @@ vinname7="rcar_vin e6ef7000.video"
 csi20name="rcar_csi2 fea80000.csi2"
 csi40name="rcar_csi2 feaa0000.csi2"
 
-cvbsname="adv7482 4-0034"
-hdminame="adv7482 4-0070"
+cvbsname="adv748x 4-0070 afe"
+hdminame="adv748x 4-0070 hdmi"
+
+txaname="adv748x 4-0070 txa"
+txbname="adv748x 4-0070 txb"
diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
index 24fb83c76959..35d37321682a 100644
--- a/scripts/vin-tests.sh
+++ b/scripts/vin-tests.sh
@@ -171,8 +171,9 @@ mc_propagate_format() {
     mdev=$(mc_get_mdev)
 
     cam="'$1':$2"
-    csi="'$3':$4"
-    vin="$5"
+    atx="'$3':$4"
+    csi="'$5':$6"
+    vin="$7"
 
     format=$($mediactl -d $mdev --get-v4l2 "$cam" | sed 's|.*fmt:\([^/]*\).*|\1|')
     size=$($mediactl -d $mdev --get-v4l2 "$cam" | sed 's|.*fmt:[^/]*/\([^ ]*\).*|\1|')
@@ -182,6 +183,21 @@ mc_propagate_format() {
     echo "format: $format size: $size field: $field vdev: $vdev"
 
     $mediactl -d $mdev -V "$cam [fmt:$format/$size field:$field]"
+    $mediactl -d $mdev -V "$atx [fmt:$format/$size field:$field]"
     $mediactl -d $mdev -V "$csi [fmt:$format/$size field:$field]"
     yavta -f RGB565 -s $size --field $field $vdev
 }
+
+# HDMI can only output to TXA on the ADV748x
+mc_propagate_hdmi() {
+    vin="$1"
+
+    mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" 1 "$vin"
+}
+
+# CVBS is only currently supported on TXB
+mc_propagate_cvbs() {
+    vin="$1"
+
+    mc_propagate_format "$cvbsname" 8 "$txbname" 0 "$csi40name" 1 "$vin"
+}
-- 
2.7.4
