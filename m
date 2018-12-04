Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbeLDPv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:57 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 4/7] vsp-lib: trivial: Fix spelling of Reference
Date: Tue,  4 Dec 2018 15:51:43 +0000
Message-Id: <20181204155146.9726-5-kieran.bingham@ideasonboard.com>
In-Reply-To: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 56969606382f..cf15a045ea8c 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -95,7 +95,7 @@ vsp1_set_control() {
 }
 
 # -----------------------------------------------------------------------------
-# Referance frame generation
+# Reference frame generation
 #
 
 reference_frame() {
-- 
2.17.1
