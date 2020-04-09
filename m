Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DA0C2BB85
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 00:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F95C2085B
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 00:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gaWM0F7C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgDIAq3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 8 Apr 2020 20:46:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDIAq3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:46:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3322A12F4;
        Thu,  9 Apr 2020 02:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586393187;
        bh=KvlEoTqDsceeRsDIOpS4xbDfUkQa8m5bmFsUPlHMw9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gaWM0F7CZGzbx3NvHUbGWn9UsyqfKdaz8QNM18hpj89iYk2O1RvCDHcuBBIWLdw2a
         AvpIGbcyX5xG3ldUBZLRV/T6Sxd7zzqh91+e6CWZUEU9fmVi0+Ur42B6WzhKjG3DpT
         1XdTCrxXUgRTcHZTGVCGSDe3Xargign6gY3nPBc0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 4/4] drm: bridge: adv7511: Make connector creation optional
Date:   Thu,  9 Apr 2020 03:46:10 +0300
Message-Id: <20200409004610.12346-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that the driver supports all the connector-related bridge
operations, make the connector creation optional. This enables usage of
the adv7511 with the DRM bridge connector helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 723560b36ee0..60efd19fa4df 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -902,17 +902,14 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
-	int ret;
+	int ret = 0;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = adv7511_connector_init(adv);
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = adv7511_connector_init(adv);
-	if (ret < 0)
-		return ret;
-
 	if (adv->type == ADV7533 || adv->type == ADV7535)
 		ret = adv7533_attach_dsi(adv);
 
-- 
Regards,

Laurent Pinchart

