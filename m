Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-he1eur01on0132.outbound.protection.outlook.com ([104.47.0.132]:61408
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1756177AbeDZWdM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 18:33:12 -0400
From: Peter Rosin <peda@axentia.se>
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Peter Senna Tschudin <peter.senna@collabora.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 23/24] drm/bridge: require the .owner to be filled in on drm_bridge_attach
Date: Fri, 27 Apr 2018 00:31:38 +0200
Message-Id: <20180426223139.16740-24-peda@axentia.se>
In-Reply-To: <20180426223139.16740-1-peda@axentia.se>
References: <20180426223139.16740-1-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The .owner will be handy to have around.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9f023bd84d56..a038da696802 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -115,6 +115,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
 
+	if (WARN_ON(!bridge->owner))
+		return -EINVAL;
+
 	if (previous && (!previous->dev || previous->encoder != encoder))
 		return -EINVAL;
 
-- 
2.11.0
