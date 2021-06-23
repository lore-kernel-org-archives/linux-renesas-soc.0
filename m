Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7882DC49EA7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jun 2021 03:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6463C6100A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jun 2021 03:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhFWDt7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:49:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFWDt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:59 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F50A66;
        Wed, 23 Jun 2021 05:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420059;
        bh=sa79yJHs8M9O+j3OB5BjgfX6aJDbq3un2qlTAEA/cEo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=erDDLCXzhJQrOqvUDG1X9Ti6qC7wtknfIsrIf76hOy+FlbuOijDXNPHAuWgI7MHkk
         6wCTzdc+PjnyGNXJBeAaCFn7dbdaFVYfRQhYjguUrGtmd4kEHCDBbz9I8v6i+oJ54p
         yvO1/Fcq6BT9A1QRQX1rGsGjwUil9IkcFymd/ch4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 11/15] drm: rcar-du: dsi: Simplify error handling in rcar_mipi_dsi_enable()
Date:   Wed, 23 Jun 2021 06:46:52 +0300
Message-Id: <20210623034656.10316-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 2ef82ef0edc5..e8db56cc98f4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -577,10 +577,7 @@ static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		return;
 
-	ret = rcar_mipi_dsi_start_video(dsi);
-	if (ret < 0)
-		return;
-
+	rcar_mipi_dsi_start_video(dsi);
 }
 
 static enum drm_mode_status
-- 
Regards,

Laurent Pinchart

