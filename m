Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Yao <mark.yao@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 2/4] drm/sun4i: Use the runtime_pm commit_tail variant
Date: Thu, 13 Jul 2017 16:41:14 +0200
Message-Id: <672c009f30c3121d75eb367743f89b0c69d16f5f.1499956639.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The backend (planes) commit can only happen when the TCON (CRTC) is
enabled, which is not guaranteed with the default commit_tail helper.

Let's use the runtime_pm version that is designed specifically to deal with
that case.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
index 9872e0fc03b0..189048d33a1d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
@@ -10,6 +10,7 @@
  * the License, or (at your option) any later version.
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drmP.h>
@@ -31,6 +32,10 @@ static const struct drm_mode_config_funcs sun4i_de_mode_config_funcs = {
 	.fb_create		= drm_fb_cma_create,
 };
 
+static struct drm_mode_config_helper_funcs sun4i_de_mode_config_helpers = {
+	.atomic_commit_tail	= drm_atomic_helper_commit_tail_runtime_pm,
+};
+
 struct drm_fbdev_cma *sun4i_framebuffer_init(struct drm_device *drm)
 {
 	drm_mode_config_reset(drm);
@@ -39,6 +44,7 @@ struct drm_fbdev_cma *sun4i_framebuffer_init(struct drm_device *drm)
 	drm->mode_config.max_height = 8192;
 
 	drm->mode_config.funcs = &sun4i_de_mode_config_funcs;
+	drm->mode_config.helper_private = &sun4i_de_mode_config_helpers;
 
 	return drm_fbdev_cma_init(drm, 32, drm->mode_config.num_connector);
 }
-- 
git-series 0.9.1
