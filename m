Return-Path: <SRS0=X8Wi=D3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C03C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Oct 2020 09:49:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BE5C2223C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Oct 2020 09:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730193AbgJTJtR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 20 Oct 2020 05:49:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:13439 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729960AbgJTJtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 05:49:17 -0400
X-IronPort-AV: E=Sophos;i="5.77,396,1596466800"; 
   d="scan'208";a="60068410"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Oct 2020 18:49:16 +0900
Received: from localhost.localdomain (unknown [172.29.52.189])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7CD224235FBA;
        Tue, 20 Oct 2020 18:49:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/panel: panel-simple: Add connector_type for EDT ETM0700G0DH6 panel
Date:   Tue, 20 Oct 2020 10:49:10 +0100
Message-Id: <20201020094910.4756-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the warning message "missing connector type" by adding connector_type
for EDT ETM0700G0DH6 panel.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8b82ec33f08a..41bab82dffea 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1812,6 +1812,7 @@ static const struct panel_desc edt_etm0700g0dh6 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct panel_desc edt_etm0700g0bdh6 = {
-- 
2.17.1

