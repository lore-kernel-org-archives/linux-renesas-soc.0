Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3320C32796
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Aug 2022 13:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237974AbiHXNA5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbiHXNA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 09:00:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7CC97B16
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 06:00:56 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1D55592;
        Wed, 24 Aug 2022 15:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661346052;
        bh=qd2zwmFtWKzt3wNOwGSiPpn0zrJLLpoC1FlvscOYJWI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i1PHfpn0swXSUjWiVrVJll9g2IZkf4T/vZKpiJOTrfnqzx+/uAy1YxXMxIUI7mUPI
         JcC06UvAY553nXc+EwM0WY5Da9pZl2BRvlG93YYFJFEoFYXvow+Lll5pKKVXzYyyOR
         8vj9Ke9GFzFDeBshUwGTIHw1R/LsmUlrGvx2fBpk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too large blanking
Date:   Wed, 24 Aug 2022 16:00:32 +0300
Message-Id: <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The blanking related registers are 8 bits, so reject any modes
with larger blanking periods.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ba84215c1511..f085a037ff5b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 594000)
 		return MODE_CLOCK_HIGH;
 
+	/*
+	 * The blanking related registers are 8 bits, so reject any modes
+	 * with larger blanking periods.
+	 */
+
+	if ((mode->hsync_start - mode->hdisplay) > 0xff)
+		return MODE_HBLANK_WIDE;
+
+	if ((mode->vsync_start - mode->vdisplay) > 0xff)
+		return MODE_VBLANK_WIDE;
+
+	if ((mode->hsync_end - mode->hsync_start) > 0xff)
+		return MODE_HSYNC_WIDE;
+
+	if ((mode->vsync_end - mode->vsync_start) > 0xff)
+		return MODE_VSYNC_WIDE;
+
+	if ((mode->htotal - mode->hsync_end) > 0xff)
+		return MODE_HBLANK_WIDE;
+
+	if ((mode->vtotal - mode->vsync_end) > 0xff)
+		return MODE_VBLANK_WIDE;
+
 	return MODE_OK;
 }
 
-- 
2.34.1

