Return-Path: <SRS0=IUT2=64=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA57C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 May 2020 01:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E4BB205ED
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 May 2020 01:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k7sStJd2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgENBR2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 May 2020 21:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725925AbgENBR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 21:17:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F347EC061A0E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2020 18:17:27 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 201C99A8;
        Thu, 14 May 2020 03:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589419044;
        bh=n7hlmyzD/bevl4wx8zqkO9jjvgYiwmG6A/5T3iD80pw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k7sStJd29aEnT7uzorbfcMEow1MJlG7AwwU5tju3clHtGQyUOAUcvBLaMxtZ0/Nsn
         PisbHqSNtdsM+0ccgG6htDcQIPvmJrt96qF5DJNGQS1Y1QZtS76SrSzJt8KMHrYWcR
         zc6QciqtM86Q39W+EAC7NRWX4bmzckmDRPCHhy7Y=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] drm: meson: dw-hdmi: Use dw_hdmi context to replace hack
Date:   Thu, 14 May 2020 04:17:07 +0300
Message-Id: <20200514011707.6512-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514011707.6512-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200514011707.6512-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The meson-dw-hdmi driver needs to access its own context from the
.mode_valid() operation. It currently gets it from the dev_private field
of the drm_device retrieved from the connector, which is a hack. Use the
dw_hdmi context passed to the .mode_valid() operation instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 174d45ecdeda..808e73fe8b3e 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -634,7 +634,9 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi,
 		   struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
-	struct meson_drm *priv = connector->dev->dev_private;
+	struct device *dev = dw_hdmi_device(hdmi);
+	struct meson_dw_hdmi *dw_hdmi = dev_get_drvdata(dev);
+	struct meson_drm *priv = dw_hdmi->priv;
 	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
 	unsigned int phy_freq;
 	unsigned int vclk_freq;
@@ -693,7 +695,7 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+	dev_dbg(dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
 		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
 
 	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
-- 
Regards,

Laurent Pinchart

