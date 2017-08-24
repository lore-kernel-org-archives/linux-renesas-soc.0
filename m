Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34910 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751811AbdHXJaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:30:16 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] vsp-lib: Use the correct media device name to count BRU inputs
Date: Thu, 24 Aug 2017 12:30:41 +0300
Message-Id: <20170824093043.8606-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the media device under test, not the default media0.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 726ff793b2ce..fa4a6984e1bb 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -54,7 +54,7 @@ vsp1_count_wpfs() {
 }
 
 vsp1_count_bru_inputs() {
-	local num_pads=`media-ctl -p | grep 'entity.*bru' | sed 's/.*(\([0-9]\) pads.*/\1/'`
+	local num_pads=`$mediactl -d $mdev -p | grep 'entity.*bru' | sed 's/.*(\([0-9]\) pads.*/\1/'`
 	echo $((num_pads-1))
 }
 
-- 
Regards,

Laurent Pinchart
