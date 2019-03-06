Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B01FC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C72D20663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c/o2wWxz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfCFXYI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfCFXYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:07 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B951E55;
        Thu,  7 Mar 2019 00:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914641;
        bh=CGp8IR/xWBkoN+k7dMBBhxdmBRcXwkqXiTJb8pLmRBM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c/o2wWxzRJ4GGLBBbHhru3yMv3QoHK1N8/yGjSoiTVE9ln4k6Cr3nBZdE81gzjQ9q
         68LSstpNP5ijFfeC/hrBpOvPadW5UmMM1sYVLsPRT4POB4kJHYRxO8i+HeL44KAb4D
         T2nx07UgT72BhsTJ3M5YhKsCVklYacY1CW8AR6CM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 09/15] drm: rcar-du: lvds: Adjust operating frequency for D3 and E3
Date:   Thu,  7 Mar 2019 01:23:39 +0200
Message-Id: <20190306232345.23052-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The D3 and E3 SoCs have different pixel clock frequency limits for the
LVDS encoder than the other SoCs in the Gen3 family. Adjust the mode
fixup implementation accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index cd202157264a..b1abe737dc05 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -515,11 +515,16 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adjusted_mode)
 {
+	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+	int min_freq;
+
 	/*
 	 * The internal LVDS encoder has a restricted clock frequency operating
-	 * range (31MHz to 148.5MHz). Clamp the clock accordingly.
+	 * range, from 5MHz to 148.5MHz on D3 and E3, and from 31MHz to
+	 * 148.5MHz on all other platforms. Clamp the clock accordingly.
 	 */
-	adjusted_mode->clock = clamp(adjusted_mode->clock, 31000, 148500);
+	min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
+	adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
 
 	return true;
 }
-- 
Regards,

Laurent Pinchart

