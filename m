Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54158 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752421AbeEOMUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 08:20:53 -0400
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so638677wmf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 05:20:52 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
Date: Tue, 15 May 2018 14:20:37 +0200
Message-Id: <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3d2d3bb..58fb9f8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
 	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
 };
 
+static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
+	.gen = 3,
+	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,
+};
+
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
@@ -519,6 +524,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
+	{ .compatible = "renesas,r8a77995-lvds", .data = &rcar_lvds_r8a77995_info },
 	{ }
 };
 
-- 
2.7.4
