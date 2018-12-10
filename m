Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39758 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbeLJMaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:30:30 -0500
Received: by mail-wm1-f67.google.com with SMTP id f81so10995319wmd.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 04:30:27 -0800 (PST)
Subject: Re: [PATCH 7/7] drm: Split out drm_probe_helper.h
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        etnaviv@lists.freedesktop.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        virtualization@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        spice-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org, nouveau@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        xen-devel@lists.xen.org, freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20181210100359.22507-1-daniel.vetter@ffwll.ch>
 <20181210101133.5364-1-daniel.vetter@ffwll.ch>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <6a215a5f-845f-ee1e-fdb1-650cf1435c40@baylibre.com>
Date: Mon, 10 Dec 2018 13:30:24 +0100
MIME-Version: 1.0
In-Reply-To: <20181210101133.5364-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/12/2018 11:11, Daniel Vetter wrote:
> Having the probe helper stuff (which pretty much everyone needs) in
> the drm_crtc_helper.h file (which atomic drivers should never need) is
> confusing. Split them out.
> 
> To make sure I actually achieved the goal here I went through all
> drivers. And indeed, all atomic drivers are now free of
> drm_crtc_helper.h includes.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-tegra@vger.kernel.org
> Cc: xen-devel@lists.xen.org
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  2 +-
>  .../display/amdgpu_dm/amdgpu_dm_services.c    |  2 +-
>  drivers/gpu/drm/arc/arcpgu_crtc.c             |  2 +-
>  drivers/gpu/drm/arc/arcpgu_drv.c              |  2 +-
>  drivers/gpu/drm/arc/arcpgu_sim.c              |  2 +-
>  drivers/gpu/drm/arm/hdlcd_crtc.c              |  2 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
>  drivers/gpu/drm/armada/armada_510.c           |  2 +-
>  drivers/gpu/drm/armada/armada_crtc.c          |  2 +-
>  drivers/gpu/drm/armada/armada_drv.c           |  2 +-
>  drivers/gpu/drm/armada/armada_fb.c            |  2 +-
>  drivers/gpu/drm/ast/ast_drv.c                 |  1 +
>  drivers/gpu/drm/ast/ast_mode.c                |  1 +
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  2 +-
>  drivers/gpu/drm/bochs/bochs_drv.c             |  1 +
>  drivers/gpu/drm/bochs/bochs_kms.c             |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511.h      |  2 +-
>  drivers/gpu/drm/bridge/analogix-anx78xx.c     |  3 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
>  drivers/gpu/drm/bridge/cdns-dsi.c             |  2 +-
>  drivers/gpu/drm/bridge/dumb-vga-dac.c         |  2 +-
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  2 +-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c          |  2 +-
>  drivers/gpu/drm/bridge/panel.c                |  2 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c        |  2 +-
>  drivers/gpu/drm/bridge/sii902x.c              |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  2 +-
>  drivers/gpu/drm/bridge/tc358764.c             |  2 +-
>  drivers/gpu/drm/bridge/tc358767.c             |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
>  drivers/gpu/drm/cirrus/cirrus_drv.c           |  1 +
>  drivers/gpu/drm/cirrus/cirrus_mode.c          |  1 +
>  drivers/gpu/drm/drm_atomic_helper.c           |  1 -
>  drivers/gpu/drm/drm_dp_mst_topology.c         |  2 +-
>  drivers/gpu/drm/drm_modeset_helper.c          |  2 +-
>  drivers/gpu/drm/drm_probe_helper.c            |  2 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c       |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
>  drivers/gpu/drm/exynos/exynos_dp.c            |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h        |  1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  2 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  2 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  2 +-
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>  drivers/gpu/drm/i2c/ch7006_priv.h             |  2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c             |  2 +-
>  drivers/gpu/drm/i915/i915_drv.c               |  2 +-
>  drivers/gpu/drm/i915/intel_crt.c              |  2 +-
>  drivers/gpu/drm/i915/intel_display.c          |  2 +-
>  drivers/gpu/drm/i915/intel_dp.c               |  2 +-
>  drivers/gpu/drm/i915/intel_dp_mst.c           |  2 +-
>  drivers/gpu/drm/i915/intel_drv.h              |  2 +-
>  drivers/gpu/drm/imx/dw_hdmi-imx.c             |  2 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
>  drivers/gpu/drm/imx/imx-ldb.c                 |  2 +-
>  drivers/gpu/drm/imx/imx-tve.c                 |  2 +-
>  drivers/gpu/drm/imx/ipuv3-crtc.c              |  2 +-
>  drivers/gpu/drm/imx/parallel-display.c        |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_fb.c         |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  2 +-
>  drivers/gpu/drm/meson/meson_crtc.c            |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c         |  2 +-
>  drivers/gpu/drm/meson/meson_venc_cvbs.c       |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
>  .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |  2 +-
>  drivers/gpu/drm/msm/msm_fb.c                  |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c            |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_out.c             |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
>  drivers/gpu/drm/omapdrm/omap_connector.c      |  2 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |  2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.h            |  2 +-
>  drivers/gpu/drm/omapdrm/omap_encoder.c        |  2 +-
>  drivers/gpu/drm/omapdrm/omap_fb.c             |  2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  3 +-
>  drivers/gpu/drm/qxl/qxl_fb.c                  |  2 +-
>  drivers/gpu/drm/qxl/qxl_kms.c                 |  2 +-
>  drivers/gpu/drm/radeon/radeon_acpi.c          |  1 +
>  drivers/gpu/drm/radeon/radeon_connectors.c    |  1 +
>  drivers/gpu/drm/radeon/radeon_device.c        |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c       |  1 +
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  1 +
>  drivers/gpu/drm/radeon/radeon_drv.c           |  1 +
>  drivers/gpu/drm/radeon/radeon_irq_kms.c       |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  2 +-
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c        |  2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c          |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_psr.c   |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_rgb.c       |  2 +-
>  drivers/gpu/drm/sti/sti_crtc.c                |  2 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                 |  2 +-
>  drivers/gpu/drm/sti/sti_hda.c                 |  2 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
>  drivers/gpu/drm/sti/sti_tvout.c               |  2 +-
>  drivers/gpu/drm/stm/drv.c                     |  2 +-
>  drivers/gpu/drm/stm/ltdc.c                    |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c         |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c            |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_lvds.c            |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c             |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c              |  2 +-
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  2 +-
>  drivers/gpu/drm/tegra/drm.h                   |  2 +-
>  drivers/gpu/drm/tegra/hdmi.c                  |  2 +-
>  drivers/gpu/drm/tegra/hub.c                   |  2 +-
>  drivers/gpu/drm/tinydrm/core/tinydrm-core.c   |  2 +-
>  drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c   |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>  drivers/gpu/drm/udl/udl_connector.c           |  1 +
>  drivers/gpu/drm/udl/udl_drv.c                 |  1 +
>  drivers/gpu/drm/udl/udl_main.c                |  1 +
>  drivers/gpu/drm/vc4/vc4_crtc.c                |  2 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                 |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.c               |  2 +-
>  drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front.c           |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_conn.c      |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
>  drivers/gpu/drm/zte/zx_drm_drv.c              |  2 +-
>  drivers/gpu/drm/zte/zx_hdmi.c                 |  2 +-
>  drivers/gpu/drm/zte/zx_tvenc.c                |  2 +-
>  drivers/gpu/drm/zte/zx_vga.c                  |  2 +-
>  drivers/gpu/drm/zte/zx_vou.c                  |  2 +-
>  drivers/staging/vboxvideo/vbox_irq.c          |  2 +-
>  drivers/staging/vboxvideo/vbox_mode.c         |  2 +-
>  include/drm/drm_crtc_helper.h                 | 16 ------
>  include/drm/drm_probe_helper.h                | 50 +++++++++++++++++++
>  208 files changed, 256 insertions(+), 200 deletions(-)

[...]

> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index 75d97f1b2e8f..ec573c04206b 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -30,7 +30,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_flip_work.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  
>  #include "meson_crtc.h"
>  #include "meson_plane.h"
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 3ee4d4a4ecba..6b29447fd09e 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -31,7 +31,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_flip_work.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 807111ebfdd9..b6299f3f4310 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -27,7 +27,7 @@
>  
>  #include <drm/drmP.h>
>  #include <drm/drm_edid.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/bridge/dw_hdmi.h>
>  
> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> index f7945bae3b4a..64de3a7026d0 100644
> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> @@ -27,7 +27,7 @@
>  
>  #include <drm/drmP.h>
>  #include <drm/drm_edid.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  
>  #include "meson_venc_cvbs.h"

[...]
> diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
> index 0ee9a96b70da..a6d520d5b6ca 100644
> --- a/include/drm/drm_crtc_helper.h
> +++ b/include/drm/drm_crtc_helper.h
> @@ -58,20 +58,4 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode);
>  void drm_helper_resume_force_mode(struct drm_device *dev);
>  int drm_helper_force_disable_all(struct drm_device *dev);
>  
> -/* drm_probe_helper.c */
> -int drm_helper_probe_single_connector_modes(struct drm_connector
> -					    *connector, uint32_t maxX,
> -					    uint32_t maxY);
> -int drm_helper_probe_detect(struct drm_connector *connector,
> -			    struct drm_modeset_acquire_ctx *ctx,
> -			    bool force);
> -void drm_kms_helper_poll_init(struct drm_device *dev);
> -void drm_kms_helper_poll_fini(struct drm_device *dev);
> -bool drm_helper_hpd_irq_event(struct drm_device *dev);
> -void drm_kms_helper_hotplug_event(struct drm_device *dev);
> -
> -void drm_kms_helper_poll_disable(struct drm_device *dev);
> -void drm_kms_helper_poll_enable(struct drm_device *dev);
> -bool drm_kms_helper_is_poll_worker(void);
> -
>  #endif
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> new file mode 100644
> index 000000000000..96c060c16a1e
> --- /dev/null
> +++ b/include/drm/drm_probe_helper.h
> @@ -0,0 +1,50 @@
> +/*
> + * Copyright © 2006 Keith Packard
> + * Copyright © 2007-2008 Dave Airlie
> + * Copyright © 2007-2008 Intel Corporation
> + *   Jesse Barnes <jesse.barnes@intel.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef __DRM_PROBE_HELPER_H__
> +#define __DRM_PROBE_HELPER_H__
> +
> +#include <linux/types.h>
> +
> +struct drm_connector;
> +struct drm_device;
> +struct drm_modeset_acquire_ctx;
> +
> +int drm_helper_probe_single_connector_modes(struct drm_connector
> +					    *connector, uint32_t maxX,
> +					    uint32_t maxY);
> +int drm_helper_probe_detect(struct drm_connector *connector,
> +			    struct drm_modeset_acquire_ctx *ctx,
> +			    bool force);
> +void drm_kms_helper_poll_init(struct drm_device *dev);
> +void drm_kms_helper_poll_fini(struct drm_device *dev);
> +bool drm_helper_hpd_irq_event(struct drm_device *dev);
> +void drm_kms_helper_hotplug_event(struct drm_device *dev);
> +
> +void drm_kms_helper_poll_disable(struct drm_device *dev);
> +void drm_kms_helper_poll_enable(struct drm_device *dev);
> +bool drm_kms_helper_is_poll_worker(void);
> +
> +#endif
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
