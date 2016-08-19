Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52496 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754396AbcHSTPn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 15:15:43 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] IPMMU + DU
Date: Fri, 19 Aug 2016 22:15:55 +0300
Message-ID: <2879414.7LX4qKRD04@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

This pull request contains the latest driver work for the IPMMU + DU targeting 
Gen3. Gen3 support as such isn't included as IPMMU is known to be broken on 
H3, but the driver should work on both Gen2 and Gen3.

The following changes since commit 694d0d0bb2030d2e36df73e2d23d5770511dbc8d:

  Linux 4.8-rc2 (2016-08-14 19:11:36 -0700)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git iommu/devel/du

for you to fetch changes up to f1f0197796a61e5548af32606f15bcf8cf353267:

  drm: rcar-du: Map memory through the VSP device (2016-08-19 12:25:39 +0300)

----------------------------------------------------------------
Laurent Pinchart (6):
      drm: Don't implement empty prepare_fb()/cleanup_fb()
      drm: Unconstify state argument to prepare_fb()/cleanup_fb()
      v4l: rcar-fcp: Don't get/put module reference
      v4l: rcar-fcp: Add an API to retrieve the FCP device
      v4l: vsp1: Add API to map and unmap DRM buffers through the VSP
      drm: rcar-du: Map memory through the VSP device

 drivers/gpu/drm/arc/arcpgu_crtc.c               |  2 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c     | 15 -------
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 15 -------
 drivers/gpu/drm/i915/intel_display.c            |  4 +-
 drivers/gpu/drm/i915/intel_drv.h                |  4 +-
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_plane.c       |  4 +-
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |  4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c            |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 74 +++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h           |  2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  4 +-
 drivers/gpu/drm/tegra/dc.c                      | 17 --------
 drivers/gpu/drm/vc4/vc4_plane.c                 |  2 -
 drivers/media/platform/rcar-fcp.c               | 17 ++++----
 drivers/media/platform/vsp1/vsp1_drm.c          | 24 +++++++++++
 include/drm/drm_modeset_helper_vtables.h        |  4 +-
 include/media/rcar-fcp.h                        |  5 +++
 include/media/vsp1.h                            |  3 ++
 19 files changed, 126 insertions(+), 82 deletions(-)

-- 
Regards,

Laurent Pinchart
