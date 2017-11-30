Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752179AbdK3O7J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 09:59:09 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] rcar-vin: Fix rvin_group_init
Date: Thu, 30 Nov 2017 14:59:04 +0000
Message-Id: <1512053944-14681-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

rvin_group_init incorrectly calls rvin_group_update_links.

Repair by removing the call, and simply returning 0;

Fixes: 3135326aae2c ("rcar-vin: parse Gen3 OF and setup media graph")
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Hi Niklas,

A small fixup for your RCar VIN branch

 drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index be2dfe2908e0..924722a0fdfa 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -926,7 +926,7 @@ static int rvin_group_init(struct rvin_dev *vin)
 			goto error_vdev;
 	}
 
-	return rvin_group_update_links(vin);
+	return 0;
 
 error_vdev:
 	rvin_v4l2_unregister(vin);
-- 
2.7.4
