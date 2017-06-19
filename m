Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42781 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdFSRFi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:38 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 10/12] media: rcar: vin: Add digital input mask to vin_dev
Date: Mon, 19 Jun 2017 19:04:47 +0200
Message-Id: <1497891889-8038-11-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add bitmask to enumerate VIN channel identifiers that support digital
video inputs.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 4 ++++
 drivers/media/platform/rcar-vin/rcar-vin.h  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 6e5d84a..1d0b492 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1028,6 +1028,8 @@ static const struct rvin_info rcar_info_r8a7795 = {
 			{ .csi = RVIN_CSI21, .chan = 3 },
 		},
 	},
+
+	.din_mask = BIT(4) | BIT(5),
 };
 
 static const struct rvin_info rcar_info_r8a7796 = {
@@ -1088,6 +1090,8 @@ static const struct rvin_info rcar_info_r8a7796 = {
 			{ .csi = RVIN_CSI20, .chan = 3 },
 		},
 	},
+
+	.din_mask = BIT(4) | BIT(5),
 };
 
 static const struct of_device_id rvin_of_id_table[] = {
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 4361de9..333ef3b 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -119,6 +119,8 @@ struct rvin_group_chsel {
  *
  * num_chsels:		number of possible chsel values for this VIN
  * chsels:		routing table VIN <-> CSI-2 for the chsel values
+ *
+ * din_mask:		mask of VIN channels IDs supporting digital input
  */
 struct rvin_info {
 	enum chip_id chip;
@@ -129,6 +131,8 @@ struct rvin_info {
 
 	unsigned int num_chsels;
 	struct rvin_group_chsel chsels[RCAR_VIN_NUM][RCAR_CHSEL_MAX];
+
+	unsigned int din_mask;
 };
 
 /**
-- 
2.7.4
