Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99CEC49EA4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jun 2021 03:47:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56296100A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jun 2021 03:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFWDuB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:50:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWDuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:50:01 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E74375FA6;
        Wed, 23 Jun 2021 05:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420061;
        bh=VWbaPXeunQapg+T1nOyAt8m2XuXqrMn7CdqvrrqPYBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=plXYTLltEL7xZPvfol5UC+9xfXWen4lqPqfvQA+TLazvbQHeKNaKZdeqWMNTwyKN3
         ri9httw3l5EM6uSsTYy8j+SP9mj4TKNqyzJXR0AMAg98lyZsI3f1WqSoBHqa/SHLvH
         K3Hxw8LxyOK9PMrwIU59orbu8pXpeo+7bIBiWiCM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 15/15] drm: rcar-du: dsi: Include the DSI header
Date:   Wed, 23 Jun 2021 06:46:56 +0300
Message-Id: <20210623034656.10316-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The rcar_mipi_dsi.h header declares the interface for the CRTC component
to use.

The lack of inclusion of the header causes a compiler warning.

Include the header correctly at the beginning of the component to ensure
consistency.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 381b5bc9bce1..f708bcf5984c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
 
+#include "rcar_mipi_dsi.h"
+
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-- 
Regards,

Laurent Pinchart

