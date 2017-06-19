Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37466 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752464AbdFSRFe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:34 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 07/12] media: rcar: vin: Add ID for parallel input on Gen3
Date: Mon, 19 Jun 2017 19:04:44 +0200
Message-Id: <1497891889-8038-8-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add an identifier for parallel input on Gen3.
Also define the maximum number of available inputs on Gen3 boards.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-vin.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index e7e600f..4361de9 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -51,6 +51,8 @@ enum rvin_csi_id {
 	RVIN_CSI40,
 	RVIN_CSI41,
 	RVIN_CSI_MAX,
+	RVIN_PARALLEL_IN,
+	RVIN_INPUT_MAX,
 	RVIN_NC, /* Not Connected */
 };
 
-- 
2.7.4
