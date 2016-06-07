Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Inki Dae <inki.dae@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@freescale.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	Vincent Abriou <vincent.abriou@st.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 16/20] drm: omap: Rely on the default ->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:48:11 +0200
Message-Id: <1465300095-16971-17-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We have a 1:1 relationship between connectors and encoders and the
driver is relying on the atomic helpers: we can drop the custom
->best_encoder() implementation and let the core call
drm_atomic_helper_best_encoder() for us.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_connector.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index ce2d67b..137fe69 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -32,7 +32,6 @@
 struct omap_connector {
 	struct drm_connector base;
 	struct omap_dss_device *dssdev;
-	struct drm_encoder *encoder;
 	bool hdmi_mode;
 };
 
@@ -256,13 +255,6 @@ static int omap_connector_mode_valid(struct drm_connector *connector,
 	return ret;
 }
 
-struct drm_encoder *omap_connector_attached_encoder(
-		struct drm_connector *connector)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	return omap_connector->encoder;
-}
-
 static const struct drm_connector_funcs omap_connector_funcs = {
 	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
@@ -276,7 +268,6 @@ static const struct drm_connector_funcs omap_connector_funcs = {
 static const struct drm_connector_helper_funcs omap_connector_helper_funcs = {
 	.get_modes = omap_connector_get_modes,
 	.mode_valid = omap_connector_mode_valid,
-	.best_encoder = omap_connector_attached_encoder,
 };
 
 /* initialize connector */
@@ -296,7 +287,6 @@ struct drm_connector *omap_connector_init(struct drm_device *dev,
 		goto fail;
 
 	omap_connector->dssdev = dssdev;
-	omap_connector->encoder = encoder;
 
 	connector = &omap_connector->base;
 
-- 
2.7.4
