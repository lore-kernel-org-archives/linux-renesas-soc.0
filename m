Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:39140 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752233AbeB0M51 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 07:57:27 -0500
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Keith Packard <keithp@keithp.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Manfred Schlaegl <manfred.schlaegl@gmx.at>,
        Marek Vasut <marex@denx.de>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Alison Wang <alison.wang@freescale.com>,
        Eric Anholt <eric@anholt.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [RFC][PATCH 04/11] drm: Split the display info into static and dynamic parts
Date: Tue, 27 Feb 2018 14:56:53 +0200
Message-Id: <20180227125700.6527-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
References: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently we have a mix of static and dynamic information stored in
the display info structure. That makes it rather difficult to repopulate
the dynamic parts when a new EDID appears. Let's make life easier by
splitting the structure up into static and dynamic parts.

The static part will consist of subpixel_order, panel_orientation,
and bus_formats.

Actually I'm not sure where bus_formats & co. fit in all this. For some
drivers those seem to be static, even though they might fill them out
from .get_modes(). For other drivers this stuff even gets frobbed at
runtime, making it more some kind of a bastard encoder/connector state.
I'll just stick it into the static side so that the behaviour doesn't
change when I start clear out the entire dynamic state with memset().

Cc: Keith Packard <keithp@keithp.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Shashank Sharma <shashank.sharma@intel.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Manfred Schlaegl <manfred.schlaegl@gmx.at>
Cc: Marek Vasut <marex@denx.de>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Alison Wang <alison.wang@freescale.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   2 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  12 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   2 +-
 drivers/gpu/drm/gma500/mdfld_dsi_output.c          |   2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |   2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   2 +-
 drivers/gpu/drm/i915/intel_dsi.c                   |   4 +-
 drivers/gpu/drm/i915/intel_dvo.c                   |   2 +-
 drivers/gpu/drm/i915/intel_lvds.c                  |   2 +-
 drivers/gpu/drm/i915/intel_sdvo.c                  |   2 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |   4 +-
 drivers/gpu/drm/imx/parallel-display.c             |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c                 |   6 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c        |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   8 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |   4 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |   4 +-
 drivers/gpu/drm/panel/panel-simple.c               |   4 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   4 +-
 drivers/gpu/drm/tve200/tve200_display.c            |   2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   4 +-
 include/drm/drm_connector.h                        | 123 ++++++++++++---------
 36 files changed, 125 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 74d2efaec52f..1ba72dc2a85b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1927,7 +1927,7 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 	} else
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 
-	connector->display_info.subpixel_order = subpixel_order;
+	connector->static_display_info.subpixel_order = subpixel_order;
 	drm_connector_register(connector);
 
 	if (has_aux)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 120dd3b26fc2..7e9f7f1ab1b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -639,7 +639,7 @@ static int dce_virtual_connector_encoder_init(struct amdgpu_device *adev,
 	drm_connector_init(adev->ddev, connector, &dce_virtual_connector_funcs,
 			   DRM_MODE_CONNECTOR_VIRTUAL);
 	drm_connector_helper_add(connector, &dce_virtual_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 	drm_connector_register(connector);
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index d73281095fac..2d18c8ef22a0 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -238,7 +238,7 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
 
 	for_each_new_connector_in_state(state->state, connector, cstate, i) {
-		struct drm_display_info *info = &connector->display_info;
+		struct drm_static_display_info *info = &connector->static_display_info;
 		unsigned int supported_fmts = 0;
 		int j;
 
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index b1ab4ab09532..abd0bce9c31e 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -174,7 +174,7 @@ static int sii902x_get_modes(struct drm_connector *connector)
 		kfree(edid);
 	}
 
-	ret = drm_display_info_set_bus_formats(&connector->display_info,
+	ret = drm_display_info_set_bus_formats(&connector->static_display_info,
 					       &bus_format, 1);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 08ab7d6aea65..042ded9ca749 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1193,7 +1193,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge)
 	if (tc->panel)
 		drm_panel_attach(tc->panel, &tc->connector);
 
-	drm_display_info_set_bus_formats(&tc->connector.display_info,
+	drm_display_info_set_bus_formats(&tc->connector.static_display_info,
 					 &bus_format, 1);
 	drm_mode_connector_attach_encoder(&tc->connector, tc->bridge.encoder);
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b3cde897cd80..d73e97ed7dff 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -237,7 +237,7 @@ int drm_connector_init(struct drm_device *dev,
 	mutex_init(&connector->mutex);
 	connector->edid_blob_ptr = NULL;
 	connector->status = connector_status_unknown;
-	connector->display_info.panel_orientation =
+	connector->static_display_info.panel_orientation =
 		DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 
 	drm_connector_get_cmdline_mode(connector);
@@ -366,7 +366,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	ida_simple_remove(&dev->mode_config.connector_ida,
 			  connector->index);
 
-	kfree(connector->display_info.bus_formats);
+	kfree(connector->static_display_info.bus_formats);
 	drm_mode_object_unregister(dev, &connector->base);
 	kfree(connector->name);
 	connector->name = NULL;
@@ -674,7 +674,7 @@ static const struct drm_prop_enum_list drm_link_status_enum_list[] = {
 
 /**
  * drm_display_info_set_bus_formats - set the supported bus formats
- * @info: display info to store bus formats in
+ * @info: fixed display info to store bus formats in
  * @formats: array containing the supported bus formats
  * @num_formats: the number of entries in the fmts array
  *
@@ -682,7 +682,7 @@ static const struct drm_prop_enum_list drm_link_status_enum_list[] = {
  * See MEDIA_BUS_FMT_* definitions in include/uapi/linux/media-bus-format.h for
  * a full list of available formats.
  */
-int drm_display_info_set_bus_formats(struct drm_display_info *info,
+int drm_display_info_set_bus_formats(struct drm_static_display_info *info,
 				     const u32 *formats,
 				     unsigned int num_formats)
 {
@@ -1460,7 +1460,7 @@ int drm_connector_init_panel_orientation_property(
 	struct drm_connector *connector, int width, int height)
 {
 	struct drm_device *dev = connector->dev;
-	struct drm_display_info *info = &connector->display_info;
+	struct drm_static_display_info *info = &connector->static_display_info;
 	struct drm_property *prop;
 	int orientation_quirk;
 
@@ -1602,7 +1602,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 
 	out_resp->mm_width = connector->display_info.width_mm;
 	out_resp->mm_height = connector->display_info.height_mm;
-	out_resp->subpixel = connector->display_info.subpixel_order;
+	out_resp->subpixel = connector->static_display_info.subpixel_order;
 	out_resp->connection = connector->status;
 
 	/* delayed so we get modes regardless of pre-fill_modes state */
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 035784ddd133..18cb63b30e33 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2433,7 +2433,7 @@ static void drm_setup_crtc_rotation(struct drm_fb_helper *fb_helper,
 
 	fb_crtc->rotation = DRM_MODE_ROTATE_0;
 
-	switch (connector->display_info.panel_orientation) {
+	switch (connector->static_display_info.panel_orientation) {
 	case DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP:
 		rotation = DRM_MODE_ROTATE_180;
 		break;
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index 0e3752437e44..2444c14639ef 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -99,7 +99,7 @@ static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	vsw = mode->vsync_end - mode->vsync_start;
 
 	/* INV_PXCK as default (most display sample data on rising edge) */
-	if (!(con->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE))
+	if (!(con->static_display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE))
 		pol |= DCU_SYN_POL_INV_PXCK;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 563f193fcfac..6d608ce26076 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -322,7 +322,7 @@ void cdv_hdmi_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &cdv_hdmi_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &cdv_hdmi_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index e64960db3224..290221f73cbf 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -637,7 +637,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &cdv_intel_lvds_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &cdv_intel_lvds_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
index 41e7f25ba7e0..605c86ded14f 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
@@ -555,7 +555,7 @@ void mdfld_dsi_output_init(struct drm_device *dev,
 						DRM_MODE_CONNECTOR_LVDS);
 	drm_connector_helper_add(connector, &mdfld_dsi_connector_helper_funcs);
 
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index 8b2eb32ee988..c4e16ab25d1a 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -661,7 +661,7 @@ void oaktrail_hdmi_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &oaktrail_hdmi_helper_funcs);
 	drm_connector_helper_add(connector, &oaktrail_hdmi_connector_helper_funcs);
 
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 	drm_connector_register(connector);
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index e6943fef0611..4b8d2b6e7202 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -331,7 +331,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &oaktrail_lvds_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &psb_intel_lvds_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index be3eefec5152..fe4667eba85f 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -706,7 +706,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &psb_intel_lvds_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &psb_intel_lvds_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 84507912be84..3b31dde4c05a 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -2016,7 +2016,7 @@ psb_intel_sdvo_connector_init(struct psb_intel_sdvo_connector *connector,
 
 	connector->base.base.interlace_allowed = 0;
 	connector->base.base.doublescan_allowed = 0;
-	connector->base.base.display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->base.base.static_display_info.subpixel_order = SubPixelHorizontalRGB;
 
 	connector->base.save = psb_intel_sdvo_save;
 	connector->base.restore = psb_intel_sdvo_restore;
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 33fbf3965309..ed36b4e6e4ae 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2972,7 +2972,7 @@ static void intel_connector_info(struct seq_file *m,
 			   connector->display_info.width_mm,
 			   connector->display_info.height_mm);
 		seq_printf(m, "\tsubpixel order: %s\n",
-			   drm_get_subpixel_order_name(connector->display_info.subpixel_order));
+			   drm_get_subpixel_order_name(connector->static_display_info.subpixel_order));
 		seq_printf(m, "\tCEA rev: %d\n",
 			   connector->display_info.cea_rev);
 	}
diff --git a/drivers/gpu/drm/i915/intel_dsi.c b/drivers/gpu/drm/i915/intel_dsi.c
index c8cf3d5c7783..3eaf9bb8498d 100644
--- a/drivers/gpu/drm/i915/intel_dsi.c
+++ b/drivers/gpu/drm/i915/intel_dsi.c
@@ -1702,7 +1702,7 @@ static void intel_dsi_add_properties(struct intel_connector *connector)
 
 		connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
-		connector->base.display_info.panel_orientation =
+		connector->base.static_display_info.panel_orientation =
 			intel_dsi_get_panel_orientation(connector);
 		drm_connector_init_panel_orientation_property(
 				&connector->base,
@@ -1826,7 +1826,7 @@ void intel_dsi_init(struct drm_i915_private *dev_priv)
 
 	drm_connector_helper_add(connector, &intel_dsi_connector_helper_funcs);
 
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB; /*XXX*/
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB; /*XXX*/
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/i915/intel_dvo.c b/drivers/gpu/drm/i915/intel_dvo.c
index eb0c559b2715..68fe4587441f 100644
--- a/drivers/gpu/drm/i915/intel_dvo.c
+++ b/drivers/gpu/drm/i915/intel_dvo.c
@@ -520,7 +520,7 @@ void intel_dvo_init(struct drm_i915_private *dev_priv)
 
 		drm_connector_helper_add(connector,
 					 &intel_dvo_connector_helper_funcs);
-		connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+		connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 		connector->interlace_allowed = false;
 		connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/intel_lvds.c
index cdae4934b885..c35f84642c79 100644
--- a/drivers/gpu/drm/i915/intel_lvds.c
+++ b/drivers/gpu/drm/i915/intel_lvds.c
@@ -1050,7 +1050,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 		intel_encoder->crtc_mask = (1 << 1);
 
 	drm_connector_helper_add(connector, &intel_lvds_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
index 0c14d1c04cbd..6309a1d9f87e 100644
--- a/drivers/gpu/drm/i915/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/intel_sdvo.c
@@ -2440,7 +2440,7 @@ intel_sdvo_connector_init(struct intel_sdvo_connector *connector,
 
 	connector->base.base.interlace_allowed = 1;
 	connector->base.base.doublescan_allowed = 0;
-	connector->base.base.display_info.subpixel_order = SubPixelHorizontalRGB;
+	connector->base.base.static_display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->base.get_hw_state = intel_sdvo_connector_get_hw_state;
 
 	intel_connector_attach_encoder(&connector->base, &encoder->base);
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 56dd7a9a8e25..4909fe89e167 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -299,7 +299,7 @@ imx_ldb_encoder_atomic_mode_set(struct drm_encoder *encoder,
 
 	if (!bus_format) {
 		struct drm_connector *connector = connector_state->connector;
-		struct drm_display_info *di = &connector->display_info;
+		struct drm_static_display_info *di = &connector->static_display_info;
 
 		if (di->num_bus_formats)
 			bus_format = di->bus_formats[0];
@@ -358,7 +358,7 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
 	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
-	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_static_display_info *di = &conn_state->connector->static_display_info;
 	u32 bus_format = imx_ldb_ch->bus_format;
 
 	/* Bus format description in DT overrides connector display info. */
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index aedecda9728a..2aa80484a39d 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -118,7 +118,7 @@ static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
 				       struct drm_connector_state *conn_state)
 {
 	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
-	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_static_display_info *di = &conn_state->connector->static_display_info;
 	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
 
 	if (!imxpd->bus_format && di->num_bus_formats) {
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index 0abe77675b76..0429006288d6 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -101,8 +101,8 @@ static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
 
 	reg = readl(mxsfb->base + LCDC_CTRL);
 
-	if (mxsfb->connector.display_info.num_bus_formats)
-		bus_format = mxsfb->connector.display_info.bus_formats[0];
+	if (mxsfb->connector.static_display_info.num_bus_formats)
+		bus_format = mxsfb->connector.static_display_info.bus_formats[0];
 
 	reg &= ~CTRL_BUS_WIDTH_MASK;
 	switch (bus_format) {
@@ -199,7 +199,7 @@ static int mxsfb_reset_block(void __iomem *reset_addr)
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_display_mode *m = &mxsfb->pipe.crtc.state->adjusted_mode;
-	const u32 bus_flags = mxsfb->connector.display_info.bus_flags;
+	const u32 bus_flags = mxsfb->connector.static_display_info.bus_flags;
 	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
 	int err;
 
diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index b428c4678106..25958bc4c5ca 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -268,7 +268,7 @@ static int versatile_panel_get_modes(struct drm_panel *panel)
 		DRM_DISPLAY_INFO_LEN);
 	connector->display_info.width_mm = vpanel->panel_type->width_mm;
 	connector->display_info.height_mm = vpanel->panel_type->height_mm;
-	connector->display_info.bus_flags = vpanel->panel_type->bus_flags;
+	connector->static_display_info.bus_flags = vpanel->panel_type->bus_flags;
 
 	mode = drm_mode_duplicate(panel->drm, &vpanel->panel_type->mode);
 	drm_mode_set_name(mode);
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index b4ec0ecff807..1ba893942a2b 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -411,19 +411,19 @@ static int ili9322_init(struct drm_panel *panel, struct ili9322 *ili)
 	 */
 	if (ili->conf->dclk_active_high) {
 		reg = ILI9322_POL_DCLK;
-		connector->display_info.bus_flags |=
+		connector->static_display_info.bus_flags |=
 			DRM_BUS_FLAG_PIXDATA_POSEDGE;
 	} else {
 		reg = 0;
-		connector->display_info.bus_flags |=
+		connector->static_display_info.bus_flags |=
 			DRM_BUS_FLAG_PIXDATA_NEGEDGE;
 	}
 	if (ili->conf->de_active_high) {
 		reg |= ILI9322_POL_DE;
-		connector->display_info.bus_flags |=
+		connector->static_display_info.bus_flags |=
 			DRM_BUS_FLAG_DE_HIGH;
 	} else {
-		connector->display_info.bus_flags |=
+		connector->static_display_info.bus_flags |=
 			DRM_BUS_FLAG_DE_LOW;
 	}
 	if (ili->conf->hsync_active_high)
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index b5e3994f0aa8..b52095666bda 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -127,9 +127,9 @@ static int panel_lvds_get_modes(struct drm_panel *panel)
 
 	connector->display_info.width_mm = lvds->width;
 	connector->display_info.height_mm = lvds->height;
-	drm_display_info_set_bus_formats(&connector->display_info,
+	drm_display_info_set_bus_formats(&connector->static_display_info,
 					 &lvds->bus_format, 1);
-	connector->display_info.bus_flags = lvds->data_mirror
+	connector->static_display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index d964d454e4ae..9526461c0eb3 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -356,7 +356,7 @@ static int rpi_touchscreen_get_modes(struct drm_panel *panel)
 	connector->display_info.bpc = 8;
 	connector->display_info.width_mm = 154;
 	connector->display_info.height_mm = 86;
-	drm_display_info_set_bus_formats(&connector->display_info,
+	drm_display_info_set_bus_formats(&connector->static_display_info,
 					 &bus_format, 1);
 
 	return num;
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 71c09ed436ae..ffa9d1b6f863 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -115,9 +115,9 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel)
 	connector->display_info.width_mm = panel->desc->size.width;
 	connector->display_info.height_mm = panel->desc->size.height;
 	if (panel->desc->bus_format)
-		drm_display_info_set_bus_formats(&connector->display_info,
+		drm_display_info_set_bus_formats(&connector->static_display_info,
 						 &panel->desc->bus_format, 1);
-	connector->display_info.bus_flags = panel->desc->bus_flags;
+	connector->static_display_info.bus_flags = panel->desc->bus_flags;
 
 	return num;
 }
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5591984a392b..ba3f85b7338f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -152,9 +152,9 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 	connector->display_info.width_mm = panel->desc->size.width;
 	connector->display_info.height_mm = panel->desc->size.height;
 	if (panel->desc->bus_format)
-		drm_display_info_set_bus_formats(&connector->display_info,
+		drm_display_info_set_bus_formats(&connector->static_display_info,
 						 &panel->desc->bus_format, 1);
-	connector->display_info.bus_flags = panel->desc->bus_flags;
+	connector->static_display_info.bus_flags = panel->desc->bus_flags;
 
 	return num;
 }
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 5b8368c76734..affd050ee409 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -148,10 +148,10 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		tim2 |= TIM2_IVS;
 
 	if (connector) {
-		if (connector->display_info.bus_flags & DRM_BUS_FLAG_DE_LOW)
+		if (connector->static_display_info.bus_flags & DRM_BUS_FLAG_DE_LOW)
 			tim2 |= TIM2_IOE;
 
-		if (connector->display_info.bus_flags &
+		if (connector->static_display_info.bus_flags &
 		    DRM_BUS_FLAG_PIXDATA_NEGEDGE)
 			tim2 |= TIM2_IPC;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 2e2ca3c6b47d..c8a0f856f84e 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -2363,7 +2363,7 @@ radeon_add_atom_connector(struct drm_device *dev,
 	} else
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 
-	connector->display_info.subpixel_order = subpixel_order;
+	connector->static_display_info.subpixel_order = subpixel_order;
 	drm_connector_register(connector);
 
 	if (has_aux)
@@ -2526,7 +2526,7 @@ radeon_add_legacy_connector(struct drm_device *dev,
 	} else
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 
-	connector->display_info.subpixel_order = subpixel_order;
+	connector->static_display_info.subpixel_order = subpixel_order;
 	drm_connector_register(connector);
 }
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ba8d2804c1d1..72723a80b1e3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -102,7 +102,7 @@ static void rcar_du_encoder_mode_set(struct drm_encoder *encoder,
 				     struct drm_connector_state *conn_state)
 {
 	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
-	struct drm_display_info *info = &conn_state->connector->display_info;
+	struct drm_static_display_info *info = &conn_state->connector->static_display_info;
 	enum rcar_lvds_mode mode;
 
 	rcar_du_crtc_route_output(crtc_state->crtc, renc->output);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 1d714c06ec9d..d20a876ba4c6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -55,13 +55,13 @@ static struct drm_connector *sun4i_tcon_get_connector(const struct drm_encoder *
 static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
-	struct drm_display_info *info;
+	struct drm_static_display_info *info;
 
 	connector = sun4i_tcon_get_connector(encoder);
 	if (!connector)
 		return -EINVAL;
 
-	info = &connector->display_info;
+	info = &connector->static_display_info;
 	if (info->num_bus_formats != 1)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index db397fcb345a..aa805e2bc0fe 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -148,7 +148,7 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	/* Vsync IRQ at start of Vsync at first */
 	ctrl1 |= TVE200_VSTSTYPE_VSYNC;
 
-	if (connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
+	if (connector->static_display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
 		ctrl1 |= TVE200_CTRL_TVCLKP;
 
 	if ((mode->hdisplay == 352 && mode->vdisplay == 240) || /* SIF(525) */
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 72c9dbd81d7f..a757a2670353 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -170,8 +170,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
 	int ret;
 
-	if (dpi->connector->display_info.num_bus_formats) {
-		u32 bus_format = dpi->connector->display_info.bus_formats[0];
+	if (dpi->connector->static_display_info.num_bus_formats) {
+		u32 bus_format = dpi->connector->static_display_info.bus_formats[0];
 
 		switch (bus_format) {
 		case MEDIA_BUS_FMT_RGB888_1X24:
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 675cc3f8cf85..aad3258facf2 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -177,7 +177,7 @@ enum drm_link_status {
 };
 
 /**
- * enum drm_panel_orientation - panel_orientation info for &drm_display_info
+ * enum drm_panel_orientation - panel_orientation info for &drm_static_display_info
  *
  * This enum is used to track the (LCD) panel orientation. There are no
  * separate #defines for the uapi!
@@ -206,14 +206,67 @@ enum drm_panel_orientation {
 };
 
 /**
- * struct drm_display_info - runtime data about the connected sink
+ * struct drm_static_display_info - data about the connected sink
+ *
+ * Static data (as in not parsed from EDID) about the connected sink.
+ * This will not be reset once set, so drivers can safely populate this
+ * at connector init time. They can also adjust it dynamically as long
+ * as the don't leave stale garbage behind.
+ */
+struct drm_static_display_info {
+	/**
+	 * @subpixel_order: Subpixel order of LCD panels.
+	 */
+	enum subpixel_order subpixel_order;
+
+	/**
+	 * @panel_orientation: Read only connector property for built-in panels,
+	 * indicating the orientation of the panel vs the device's casing.
+	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
+	 * When not UNKNOWN this gets used by the drm_fb_helpers to rotate the
+	 * fb to compensate and gets exported as prop to userspace.
+	 */
+	int panel_orientation;
+
+	/**
+	 * @bus_formats: Pixel data format on the wire, somewhat redundant with
+	 * @color_formats. Array of size @num_bus_formats encoded using
+	 * MEDIA_BUS_FMT\_ defines shared with v4l and media drivers.
+	 */
+	const u32 *bus_formats;
+	/**
+	 * @num_bus_formats: Size of @bus_formats array.
+	 */
+	unsigned int num_bus_formats;
+
+#define DRM_BUS_FLAG_DE_LOW		(1<<0)
+#define DRM_BUS_FLAG_DE_HIGH		(1<<1)
+/* drive data on pos. edge */
+#define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
+/* drive data on neg. edge */
+#define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
+/* data is transmitted MSB to LSB on the bus */
+#define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
+/* data is transmitted LSB to MSB on the bus */
+#define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
+
+	/**
+	 * @bus_flags: Additional information (like pixel signal polarity) for
+	 * the pixel data on the bus, using DRM_BUS_FLAGS\_ defines.
+	 */
+	u32 bus_flags;
+};
+
+/**
+ * struct drm_display_info - Dynamic data about the connected sink
  *
  * Describes a given display (e.g. CRT or flat panel) and its limitations. For
  * fixed display sinks like built-in panels there's not much difference between
  * this and &struct drm_connector. But for sinks with a real cable this
  * structure is meant to describe all the things at the other end of the cable.
  *
- * For sinks which provide an EDID this can be filled out by calling
+ * This should be filled out by the connector .fill_modes()/.get_modes()
+ * hooks. For sinks which provide an EDID this can be filled out by calling
  * drm_add_edid_modes().
  */
 struct drm_display_info {
@@ -225,7 +278,7 @@ struct drm_display_info {
 	/**
 	 * @width_mm: Physical width in mm.
 	 */
-        unsigned int width_mm;
+	unsigned int width_mm;
 	/**
 	 * @height_mm: Physical height in mm.
 	 */
@@ -242,26 +295,12 @@ struct drm_display_info {
 	 */
 	unsigned int bpc;
 
-	/**
-	 * @subpixel_order: Subpixel order of LCD panels.
-	 */
-	enum subpixel_order subpixel_order;
-
 #define DRM_COLOR_FORMAT_RGB444		(1<<0)
 #define DRM_COLOR_FORMAT_YCRCB444	(1<<1)
 #define DRM_COLOR_FORMAT_YCRCB422	(1<<2)
 #define DRM_COLOR_FORMAT_YCRCB420	(1<<3)
 
 	/**
-	 * @panel_orientation: Read only connector property for built-in panels,
-	 * indicating the orientation of the panel vs the device's casing.
-	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
-	 * When not UNKNOWN this gets used by the drm_fb_helpers to rotate the
-	 * fb to compensate and gets exported as prop to userspace.
-	 */
-	int panel_orientation;
-
-	/**
 	 * @color_formats: HDMI Color formats, selects between RGB and YCrCb
 	 * modes. Used DRM_COLOR_FORMAT\_ defines, which are _not_ the same ones
 	 * as used to describe the pixel format in framebuffers, and also don't
@@ -270,34 +309,6 @@ struct drm_display_info {
 	u32 color_formats;
 
 	/**
-	 * @bus_formats: Pixel data format on the wire, somewhat redundant with
-	 * @color_formats. Array of size @num_bus_formats encoded using
-	 * MEDIA_BUS_FMT\_ defines shared with v4l and media drivers.
-	 */
-	const u32 *bus_formats;
-	/**
-	 * @num_bus_formats: Size of @bus_formats array.
-	 */
-	unsigned int num_bus_formats;
-
-#define DRM_BUS_FLAG_DE_LOW		(1<<0)
-#define DRM_BUS_FLAG_DE_HIGH		(1<<1)
-/* drive data on pos. edge */
-#define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
-/* drive data on neg. edge */
-#define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
-/* data is transmitted MSB to LSB on the bus */
-#define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
-/* data is transmitted LSB to MSB on the bus */
-#define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
-
-	/**
-	 * @bus_flags: Additional information (like pixel signal polarity) for
-	 * the pixel data on the bus, using DRM_BUS_FLAGS\_ defines.
-	 */
-	u32 bus_flags;
-
-	/**
 	 * @max_tmds_clock: Maximum TMDS clock rate supported by the
 	 * sink in kHz. 0 means undefined.
 	 */
@@ -335,7 +346,7 @@ struct drm_display_info {
 	bool non_desktop;
 };
 
-int drm_display_info_set_bus_formats(struct drm_display_info *info,
+int drm_display_info_set_bus_formats(struct drm_static_display_info *info,
 				     const u32 *formats,
 				     unsigned int num_formats);
 
@@ -851,15 +862,23 @@ struct drm_connector {
 	struct list_head probed_modes;
 
 	/**
-	 * @display_info: Display information is filled from EDID information
-	 * when a display is detected. For non hot-pluggable displays such as
-	 * flat panels in embedded systems, the driver should initialize the
-	 * &drm_display_info.width_mm and &drm_display_info.height_mm fields
-	 * with the physical size of the display.
+	 * @static_display_info: Display information is filled by the driver
+	 *
+	 * Protected by &drm_mode_config.mutex.
+	 */
+	struct drm_static_display_info static_display_info;
+	/**
+	 * @display_info: Dynamic display information is filled from EDID
+	 * information when a display is detected. For non hot-pluggable
+	 * displays such as flat panels in embedded systems, the driver
+	 * should initialize the &drm_display_info.width_mm and
+	 * &drm_display_info.height_mm fields with the physical size of
+	 * the display.
 	 *
 	 * Protected by &drm_mode_config.mutex.
 	 */
 	struct drm_display_info display_info;
+
 	const struct drm_connector_funcs *funcs;
 
 	struct drm_property_blob *edid_blob_ptr;
-- 
2.13.6
