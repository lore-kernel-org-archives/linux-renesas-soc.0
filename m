Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-he1eur01on0132.outbound.protection.outlook.com ([104.47.0.132]:61408
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754611AbeDZWdR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 18:33:17 -0400
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
Subject: [PATCH 24/24] drm/bridge: establish a link between the bridge supplier and consumer
Date: Fri, 27 Apr 2018 00:31:39 +0200
Message-Id: <20180426223139.16740-25-peda@axentia.se>
In-Reply-To: <20180426223139.16740-1-peda@axentia.se>
References: <20180426223139.16740-1-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If the bridge supplier is unbound, this will bring the bridge consumer
down along with the bridge. Thus, there will no longer linger any
dangling pointers from the bridge consumer (the drm_device) to some
non-existent bridge supplier.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/drm_bridge.c | 18 ++++++++++++++++++
 include/drm/drm_bridge.h     |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a038da696802..f0c79043ec43 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -26,6 +26,7 @@
 #include <linux/mutex.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
 
 #include "drm_crtc_internal.h"
@@ -124,12 +125,25 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (bridge->dev)
 		return -EBUSY;
 
+	if (encoder->dev->dev != bridge->owner) {
+		bridge->link = device_link_add(encoder->dev->dev,
+					       bridge->owner, 0);
+		if (!bridge->link) {
+			dev_err(bridge->owner, "failed to link bridge to %s\n",
+				dev_name(encoder->dev->dev));
+			return -EINVAL;
+		}
+	}
+
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge);
 		if (ret < 0) {
+			if (bridge->link)
+				device_link_del(bridge->link);
+			bridge->link = NULL;
 			bridge->dev = NULL;
 			bridge->encoder = NULL;
 			return ret;
@@ -156,6 +170,10 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
+	if (bridge->link)
+		device_link_del(bridge->link);
+	bridge->link = NULL;
+
 	bridge->dev = NULL;
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3bc659f3e7d2..9a386559a41a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -261,6 +261,7 @@ struct drm_bridge_timings {
  * @list: to keep track of all added bridges
  * @timings: the timing specification for the bridge, if any (may
  * be NULL)
+ * @link: drm consumer <-> bridge supplier
  * @funcs: control functions
  * @driver_private: pointer to the bridge driver's internal context
  */
@@ -271,6 +272,7 @@ struct drm_bridge {
 	struct drm_bridge *next;
 	struct list_head list;
 	const struct drm_bridge_timings *timings;
+	struct device_link *link;
 
 	const struct drm_bridge_funcs *funcs;
 	void *driver_private;
-- 
2.11.0
