Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:50593 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752107AbeB0M5T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 07:57:19 -0500
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Keith Packard <keithp@keithp.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH 03/11] drm/shmobile: Don't fill display_info.{width,height}_mm at init time
Date: Tue, 27 Feb 2018 14:56:52 +0200
Message-Id: <20180227125700.6527-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
References: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

shmobile is already populating display_info.width_mm and
display_info.height_mm from the .get_modes() hook which is what
we want. No need to populate it from the init path as well.

Cc: Keith Packard <keithp@keithp.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index e7738939a86d..327b7965679a 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -703,9 +703,6 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 
 	sdev->connector.encoder = encoder;
 
-	connector->display_info.width_mm = sdev->pdata->panel.width_mm;
-	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
-
 	ret = drm_connector_init(sdev->ddev, connector, &connector_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret < 0)
-- 
2.13.6
