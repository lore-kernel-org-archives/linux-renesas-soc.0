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
Subject: [PATCH 01/20] drm/atomic: Fix remaining places where !funcs->best_encoder is valid
Date: Thu,  2 Jun 2016 16:31:28 +0200
Message-Id: <1464877907-27723-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Adapt drm_pick_crtcs() and update_connector_routing() to fallback to
drm_atomic_helper_best_encoder() if funcs->best_encoder() is NULL so
that DRM drivers can leave this hook unassigned if they know they want
to use drm_atomic_helper_best_encoder().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |  4 +++-
 drivers/gpu/drm/drm_fb_helper.c     | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f6a3350..849d029 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -300,8 +300,10 @@ update_connector_routing(struct drm_atomic_state *state,
 	if (funcs->atomic_best_encoder)
 		new_encoder = funcs->atomic_best_encoder(connector,
 							 connector_state);
-	else
+	else if (funcs->best_encoder)
 		new_encoder = funcs->best_encoder(connector);
+	else
+		new_encoder = drm_atomic_helper_best_encoder(connector);
 
 	if (!new_encoder) {
 		DRM_DEBUG_ATOMIC("No suitable encoder found for [CONNECTOR:%d:%s]\n",
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 7c2eb75..d44389a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2000,7 +2000,18 @@ static int drm_pick_crtcs(struct drm_fb_helper *fb_helper,
 		my_score++;
 
 	connector_funcs = connector->helper_private;
-	encoder = connector_funcs->best_encoder(connector);
+
+	/*
+	 * If the DRM device implements atomic hooks and ->best_encoder() is
+	 * NULL we fallback to the default drm_atomic_helper_best_encoder()
+	 * helper.
+	 */
+	if (fb_helper->dev->mode_config.funcs->atomic_commit &&
+	    !connector_funcs->best_encoder)
+		encoder = drm_atomic_helper_best_encoder(connector);
+	else
+		encoder = connector_funcs->best_encoder(connector);
+
 	if (!encoder)
 		goto out;
 
-- 
2.7.4
