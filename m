Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D96C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 338E520870
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLIAKxdN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfAVWyN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 17:54:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60676 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfAVWyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 17:54:12 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE5F1223;
        Tue, 22 Jan 2019 23:54:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548197650;
        bh=9azgXEuWNg/GHyAmNFjhQ1iE6hrHF1CUh2bNdRZRIBY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rLIAKxdNq5i0vNJNk0fxXP3zvItV6Vm5wBmmc+/f5msW0/vW8gD6QIYU5Nc/0jxeA
         /2g8Hj39/wfhzArdxtcYpuK0rGdpI0csCt3BYtLx55aBxVADh24SSuAlPwx3f4JVQ3
         t2KEAj1jxoX5amcbzprSIHBUkecM8t8vEuuIgre0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 2/6] drm: rcar-du: lvds: Don't fail probe if output is not connected on D3/E3
Date:   Wed, 23 Jan 2019 00:54:01 +0200
Message-Id: <20190122225405.7815-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On the D3 and E3 SoCs the LVDS encoder has an extended internal PLL and
supplies a clock to the DU. That clock is used not only for the LVDS
outputs but also for the DPAD output. The LVDS encoder thus needs to be
available to the DU even when its output is disabled. Don't fail probe
in that case on D3 and E3.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Typo fix in the commit message
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index caea2c590b7a..b21906b81f10 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -544,7 +544,10 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
 		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
 					 bridge);
 
-	/* Otherwise we have a panel, create a connector. */
+	/* Otherwise if we have a panel, create a connector. */
+	if (!lvds->panel)
+		return 0;
+
 	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret < 0)
@@ -592,7 +595,8 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
 	if (!local_output) {
 		dev_dbg(lvds->dev, "unconnected port@1\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto done;
 	}
 
 	/*
@@ -642,6 +646,15 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	of_node_put(remote_input);
 	of_node_put(remote);
 
+	/*
+	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
+	 * used for the DPAD output even when the LVDS output is not connected.
+	 * Don't fail probe in that case as the DU will need the bridge to
+	 * control the clock.
+	 */
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
+		return ret == -ENODEV ? 0 : ret;
+
 	return ret;
 }
 
-- 
Regards,

Laurent Pinchart

