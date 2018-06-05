Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40398 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752144AbeFEUaj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 16:30:39 -0400
Received: by mail-lf0-f66.google.com with SMTP id q11-v6so5614588lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 13:30:38 -0700 (PDT)
Subject: [PATCH 2/2] drm: rcar-du: lvds: add R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Message-ID: <668491ee-915d-66fc-feea-c2afed5d645d@cogentembedded.com>
Date: Tue, 5 Jun 2018 23:30:36 +0300
MIME-Version: 1.0
In-Reply-To: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car V3H (R8A77980) SoC to the LVDS encoder driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_lvds.c |    1 +
 1 file changed, 1 insertion(+)

Index: drm/drivers/gpu/drm/rcar-du/rcar_lvds.c
===================================================================
--- drm.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ drm/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -519,6 +519,7 @@ static const struct of_device_id rcar_lv
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
+	{ .compatible = "renesas,r8a77980-lvds", .data = &rcar_lvds_gen3_info },
 	{ }
 };
 
