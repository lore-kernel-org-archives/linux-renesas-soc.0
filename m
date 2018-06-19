Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f46.google.com ([209.85.160.46]:42822 "EHLO
        mail-pl0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937514AbeFSPRQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 11:17:16 -0400
Received: by mail-pl0-f46.google.com with SMTP id w17-v6so16775pll.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jun 2018 08:17:16 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Jun 2018 00:18:55 +0900
Message-Id: <152942153504.28480.18358640564322769858.sendpatchset@little-apple>
In-Reply-To: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
References: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
Subject: [PATCH 01/04] rcar-vin: r8a77990 prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the VIN driver with experimental r8a77990 support.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/media/platform/rcar-vin/rcar-core.c |   21 +++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-csi2.c |    8 ++++++++
 2 files changed, 29 insertions(+)

--- 0001/drivers/media/platform/rcar-vin/rcar-core.c
+++ work/drivers/media/platform/rcar-vin/rcar-core.c	2018-06-19 20:54:34.180607110 +0900
@@ -1037,6 +1037,23 @@ static const struct rvin_info rcar_info_
 	.routes = _rcar_info_r8a77970_routes,
 };
 
+
+static const struct rvin_group_route _rcar_info_r8a77990_routes[] = {
+	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
+	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
+	{ .csi = RVIN_CSI40, .channel = 1, .vin = 4, .mask = BIT(2) },
+	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
+	{ /* Sentinel */ }
+};
+
+static const struct rvin_info rcar_info_r8a77990 = {
+	.model = RCAR_GEN3,
+	.use_mc = true,
+	.max_width = 4096,
+	.max_height = 4096,
+	.routes = _rcar_info_r8a77990_routes,
+};
+
 static const struct of_device_id rvin_of_id_table[] = {
 	{
 		.compatible = "renesas,vin-r8a7778",
@@ -1082,6 +1099,10 @@ static const struct of_device_id rvin_of
 		.compatible = "renesas,vin-r8a77970",
 		.data = &rcar_info_r8a77970,
 	},
+	{
+		.compatible = "renesas,vin-r8a77990",
+		.data = &rcar_info_r8a77990,
+	},
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
--- 0001/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ work/drivers/media/platform/rcar-vin/rcar-csi2.c	2018-06-19 20:54:34.180607110 +0900
@@ -951,6 +951,10 @@ static const struct rcar_csi2_info rcar_
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 };
 
+static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
+	.init_phtw = rcsi2_init_phtw_v3m_e3,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a7795-csi2",
@@ -968,6 +972,10 @@ static const struct of_device_id rcar_cs
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
