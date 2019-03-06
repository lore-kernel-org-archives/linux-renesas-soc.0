Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDA8C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFA9620663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u9Sy8JPU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfCFXYI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfCFXYI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:08 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D30C1309;
        Thu,  7 Mar 2019 00:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914641;
        bh=dH3LyqSGf65ozoaAddJEdP+Ju8HaoesWsLTLRcZ3TZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u9Sy8JPUTC9An1jK3FLWXImHW15Jn8QkHC9z072pg5+6q1M+jmsu2pcIxIaX7QV3P
         HWJSmAcCECpDBid8CmhKUjCrmlRPwwsXAO6Lmz+cNMOs8xN+Rob0f+1M8HEv01s49t
         3y9yoTrtGWV1hTFarCg29GonQ4VybBn8WKDCrYJk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 08/15] drm: rcar-du: lvds: Remove LVDS double-enable checks
Date:   Thu,  7 Mar 2019 01:23:38 +0200
Message-Id: <20190306232345.23052-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DRM core and DU driver guarantee that the LVDS bridge will not be
double-enabled or double-disabled. Remove the corresponding unnecessary
checks.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 7ef97b2a6eda..cd202157264a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -63,7 +63,6 @@ struct rcar_lvds {
 		struct clk *extal;		/* External clock */
 		struct clk *dotclkin[2];	/* External DU clocks */
 	} clocks;
-	bool enabled;
 
 	struct drm_display_mode display_mode;
 	enum rcar_lvds_mode mode;
@@ -368,15 +367,12 @@ int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
 
 	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
 
-	WARN_ON(lvds->enabled);
-
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
 		return ret;
 
 	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
 
-	lvds->enabled = true;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
@@ -390,13 +386,9 @@ void rcar_lvds_clk_disable(struct drm_bridge *bridge)
 
 	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
 
-	WARN_ON(!lvds->enabled);
-
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	clk_disable_unprepare(lvds->clocks.mod);
-
-	lvds->enabled = false;
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
 
@@ -417,8 +409,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	u32 lvdcr0;
 	int ret;
 
-	WARN_ON(lvds->enabled);
-
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
 		return;
@@ -503,16 +493,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 		drm_panel_prepare(lvds->panel);
 		drm_panel_enable(lvds->panel);
 	}
-
-	lvds->enabled = true;
 }
 
 static void rcar_lvds_disable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
-	WARN_ON(!lvds->enabled);
-
 	if (lvds->panel) {
 		drm_panel_disable(lvds->panel);
 		drm_panel_unprepare(lvds->panel);
@@ -523,8 +509,6 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	clk_disable_unprepare(lvds->clocks.mod);
-
-	lvds->enabled = false;
 }
 
 static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
@@ -583,8 +567,6 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
-	WARN_ON(lvds->enabled);
-
 	lvds->display_mode = *adjusted_mode;
 
 	rcar_lvds_get_lvds_mode(lvds);
@@ -784,7 +766,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 
 	lvds->dev = &pdev->dev;
 	lvds->info = of_device_get_match_data(&pdev->dev);
-	lvds->enabled = false;
 
 	ret = rcar_lvds_parse_dt(lvds);
 	if (ret < 0)
-- 
Regards,

Laurent Pinchart

