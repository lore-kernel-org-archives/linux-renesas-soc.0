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
Subject: [PATCH 09/20] drm: rcar-du: Rely on the default ->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:36 +0200
Message-Id: <1464877907-27723-10-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

All outputs have a 1:1 relationship between connectors and encoders,
and the driver is relying on the atomic helpers: we can drop the custom
->best_encoder() implementations and let the core call
drm_atomic_helper_best_encoder() for us.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ------------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |  3 ---
 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c |  1 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c |  1 -
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c  |  1 -
 5 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 4e939e4..55149e9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -27,18 +27,6 @@
 #include "rcar_du_vgacon.h"
 
 /* -----------------------------------------------------------------------------
- * Common connector functions
- */
-
-struct drm_encoder *
-rcar_du_connector_best_encoder(struct drm_connector *connector)
-{
-	struct rcar_du_connector *rcon = to_rcar_connector(connector);
-
-	return rcar_encoder_to_drm_encoder(rcon->encoder);
-}
-
-/* -----------------------------------------------------------------------------
  * Encoder
  */
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 719b6f2a..a8669c3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -49,9 +49,6 @@ struct rcar_du_connector {
 #define to_rcar_connector(c) \
 	container_of(c, struct rcar_du_connector, connector)
 
-struct drm_encoder *
-rcar_du_connector_best_encoder(struct drm_connector *connector);
-
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
index 6c92714..612b4d5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
@@ -52,7 +52,6 @@ static int rcar_du_hdmi_connector_mode_valid(struct drm_connector *connector,
 static const struct drm_connector_helper_funcs connector_helper_funcs = {
 	.get_modes = rcar_du_hdmi_connector_get_modes,
 	.mode_valid = rcar_du_hdmi_connector_mode_valid,
-	.best_encoder = rcar_du_connector_best_encoder,
 };
 
 static enum drm_connector_status
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
index e905f5d..6afd0af 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
@@ -59,7 +59,6 @@ static int rcar_du_lvds_connector_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs connector_helper_funcs = {
 	.get_modes = rcar_du_lvds_connector_get_modes,
-	.best_encoder = rcar_du_connector_best_encoder,
 };
 
 static enum drm_connector_status
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c b/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
index 9d7e5c9..68f7ffa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
@@ -28,7 +28,6 @@ static int rcar_du_vga_connector_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs connector_helper_funcs = {
 	.get_modes = rcar_du_vga_connector_get_modes,
-	.best_encoder = rcar_du_connector_best_encoder,
 };
 
 static enum drm_connector_status
-- 
2.7.4
