Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:13776 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752107AbeB0M5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 07:57:08 -0500
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
        Alison Wang <alison.wang@freescale.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Archit Taneja <architt@codeaurora.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Eric Anholt <eric@anholt.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Keith Packard <keithp@keithp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Manfred Schlaegl <manfred.schlaegl@gmx.at>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [RFC][PATCH 00/11] drm: Try to make display info less nuts
Date: Tue, 27 Feb 2018 14:56:49 +0200
Message-Id: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently the display info is cleared/populated in a very ad-hoc manner.
I'd like to make it more robust by making sure it gets cleared by the
core forcing drivers to repopulate in .fill_modes().

The bus_formats stuff looks very much ad-hoc all over, so I left that
out from consideration for now.

The locking around the display info and edid updates looks somewhat
busted as well, so I figured I'd sprinkle some lockdep asserts around.
That last part probably won't cooperate nicely with amdgpu as they
seem to be doing edid updates from the modeset path. So need to think
of some way to untangle that mess. Hence this is just an RFC for now.

Cc: Alison Wang <alison.wang@freescale.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Keith Packard <keithp@keithp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Manfred Schlaegl <manfred.schlaegl@gmx.at>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shashank Sharma <shashank.sharma@intel.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>

Ville Syrjälä (11):
  drm/gma500: Fill display_info.{width,height}_mm from .get_modes()
  drm/i915: Fill display_info.{width,height}_mm from .get_modes()
  drm/shmobile: Don't fill display_info.{width,height}_mm at init time
  drm: Split the display info into static and dynamic parts
  drm/edid: Clear display info fully
  drm/edid: Don't call drm_add_display_info() with an invalid EDID
  drm/probe-helper: Avoid iterating the list twice on ww backoff
  drm: Add drm_connector_fill_modes()
  drm: Fix getconnector locking
  drm: Fix debugfs edid_override locking
  drm: Sprinkle lockdep asserts for edid/display_info

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   2 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  70 ++++++++---
 drivers/gpu/drm/drm_debugfs.c                      |  12 +-
 drivers/gpu/drm/drm_edid.c                         |  35 +-----
 drivers/gpu/drm/drm_fb_helper.c                    |   4 +-
 drivers/gpu/drm/drm_probe_helper.c                 |  10 +-
 drivers/gpu/drm/drm_sysfs.c                        |   6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   2 +-
 drivers/gpu/drm/gma500/mdfld_dsi_output.c          |  14 +--
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |   2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   2 +-
 drivers/gpu/drm/i915/intel_dp.c                    |  15 ++-
 drivers/gpu/drm/i915/intel_dsi.c                   |  17 +--
 drivers/gpu/drm/i915/intel_dvo.c                   |   2 +-
 drivers/gpu/drm/i915/intel_lvds.c                  |  11 +-
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
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   3 -
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   4 +-
 drivers/gpu/drm/tve200/tve200_display.c            |   2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   4 +-
 include/drm/drm_connector.h                        | 128 ++++++++++++---------
 include/drm/drm_edid.h                             |   1 -
 43 files changed, 227 insertions(+), 185 deletions(-)

-- 
2.13.6
