Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13371C48BE5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jun 2021 23:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E52D4600EF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jun 2021 23:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhFVXWr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 19:22:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55124 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFVXWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 19:22:47 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A9D8B63;
        Wed, 23 Jun 2021 01:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624404029;
        bh=BfW+VuiImixFtwo26YRsiUh4VPXeAT4jUVmUXsDVa0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ftEqxS2izD8zlEVLL2jwU3jjcHCnigJwdgu0MWzFrZyRmnXOYwdYpaIPURx0KEzw4
         l7EiLPNsYWo+APOV0tD6AxXPVJrfYZRN9R3KiWtiHilEk6ASDwFnwX5GAUCfqPWIF5
         kVrpH0xzjJj0wHXEa2IQePAyfIdz/XTYMyVk6HYo=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm: rcar-du: Sort the DU outputs
Date:   Wed, 23 Jun 2021 00:20:22 +0100
Message-Id: <20210622232024.3215248-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Sort the DU outputs alphabetically, with the exception of the final
entry which is there as a sentinal.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5f2940c42225..440e6b4fbb58 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -96,10 +96,10 @@ struct rcar_du_crtc_state {
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
 	RCAR_DU_OUTPUT_DPAD1,
-	RCAR_DU_OUTPUT_LVDS0,
-	RCAR_DU_OUTPUT_LVDS1,
 	RCAR_DU_OUTPUT_HDMI0,
 	RCAR_DU_OUTPUT_HDMI1,
+	RCAR_DU_OUTPUT_LVDS0,
+	RCAR_DU_OUTPUT_LVDS1,
 	RCAR_DU_OUTPUT_TCON,
 	RCAR_DU_OUTPUT_MAX,
 };
-- 
2.30.2

