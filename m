Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbeLDPv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:59 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 7/7] vsp-lib: Reset controls to defaults on each test run
Date: Tue,  4 Dec 2018 15:51:46 +0000
Message-Id: <20181204155146.9726-8-kieran.bingham@ideasonboard.com>
In-Reply-To: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some of our tests set flipping and rotation controls, and the VSP cell
can be used again by later tests. If these controls are not reset, then
that operation is applied to later tests incorrectly causing that test
to fail.

In an ideal world, tests should clean up after themselves, and leave the
system in a known state. However the world is not ideal and we would not
be able to guarantee any previous system state before a test was run
anyway. Therefore it is more effective to reset state at the beginning
of a test.

To repair this - reset all control values to their defaults at the start
of every test during test_init()

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 3d2792707d24..33442816f208 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -94,6 +94,14 @@ vsp1_set_control() {
 	$yavta --no-query -w "$control $value" $subdev | ./logger.sh "$entity" >> $logfile
 }
 
+vsp1_reset_controls() {
+	local entity=$1
+	local subdev=$(vsp1_entity_subdev $entity)
+
+	echo "Resetting controls on $subdev" | ./logger.sh "$entity" >> $logfile
+	$yavta --no-query --reset-controls $subdev | ./logger.sh "$entity" >> $logfile
+}
+
 # -----------------------------------------------------------------------------
 # Reference frame generation
 #
@@ -1082,6 +1090,9 @@ test_init() {
 	dev=$(vsp1_device $mdev)
 	echo "Using device $mdev ($dev)" | ./logger.sh config >> $logfile
 
+	# Reset any rotation or flipping controls
+	vsp1_reset_controls wpf.0
+
 	vsp_runner=./vsp-runner.sh
 }
 
-- 
2.17.1
