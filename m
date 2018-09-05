Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46227 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbeIEUAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 16:00:46 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/8] media: rcar-csi2: Add R8A77990 support
Date: Wed,  5 Sep 2018 17:29:41 +0200
Message-Id: <1536161385-25562-5-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for R-Car E3 R8A77965 to R-Car CSI-2 driver.
Based on the experimental patch from Magnus Damm.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index dc5ae80..f82b668 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -959,6 +959,11 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 	.confirm_start = rcsi2_confirm_start_v3m_e3,
 };
 
+static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
+	.init_phtw = rcsi2_init_phtw_v3m_e3,
+	.confirm_start = rcsi2_confirm_start_v3m_e3,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a7795-csi2",
@@ -976,6 +981,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a77970-csi2",
 		.data = &rcar_csi2_info_r8a77970,
 	},
+	{
+		.compatible = "renesas,r8a77990-csi2",
+		.data = &rcar_csi2_info_r8a77990,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
-- 
2.7.4
