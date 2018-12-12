Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_MIXED_ES,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1CEC65BAF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06B2B20839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="B0rxw+bv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06B2B20839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbeLLKxO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:53:14 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43311 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbeLLKxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:53:14 -0500
Received: by mail-ed1-f66.google.com with SMTP id f9so15147655eds.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Dec 2018 02:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Pj/KE3C4s4H6j7rZNVvU/PpQbsjd7c3wLG4/pe5Pe5I=;
        b=B0rxw+bvs4L6ih8o6NKFt1u2Jqe2RQzCHavwnPLB/+FtFPbSQ6TOJKBj8xg9JNgjgC
         GEdLqB7vptBNrUJBUy6gAFz904pze6OlnGG7kqDwnrtW98iyhzQF9oOr2B+GuG7ZccSO
         9dXuxtj9MvDB8qPJGZWRdpNTGx16qT/igDB0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=Pj/KE3C4s4H6j7rZNVvU/PpQbsjd7c3wLG4/pe5Pe5I=;
        b=n0UK5lkzM7r2IAQIjlFctNoXqHk6+jAZHe6bCp77SGeQkRddVlMefjjPnzHFrfIdIV
         7KGuQR+9ks73Sn9pmU3edus0h730ls7nH4sBxTZG9ghaZ7UttMHLtaYMsgPrFD6gbe4a
         WC7ctsMaC+94584u98rj3W4eZnDFK+DCvhDYDYYiYqx0MszIYBCfGNEepsYkgdUq0/g8
         2NqNfirSpQcpg/S6IW5CTEyr5kvnXigKAiJToUbxWeCSnVliS7AYKARtwnw9NCO0NJbY
         w/8ll3vxmujtojVJCmgzaCBBk5NPhiwkf35DFxj+vKdacNrttnYfUGk1iP44/Ce4k9hu
         5Q7w==
X-Gm-Message-State: AA+aEWbhNBEoavvWD8uffqjN/Eiza6OCdUBqXUXO+OcuH7qsvsx3I5kc
        HeffaqUFQEm59JLkH2Q1jwGpMA==
X-Google-Smtp-Source: AFSGD/UiPdOA2W7tPDdZTLiZzGg5hekdJF24vdCXA83P1AkvBDppahotVFPGySTiOe2+Xv/nHhBbZA==
X-Received: by 2002:a50:8951:: with SMTP id f17mr17939036edf.130.1544611990796;
        Wed, 12 Dec 2018 02:53:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id l17sm4737362edc.56.2018.12.12.02.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Dec 2018 02:53:09 -0800 (PST)
Date:   Wed, 12 Dec 2018 11:53:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "moderated list:ARM/S5P EXYNOS AR..." 
        <linux-samsung-soc@vger.kernel.org>, nouveau@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
        spice-devel@lists.freedesktop.org, xen-devel@lists.xen.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/7] drm: Split out drm_probe_helper.h
Message-ID: <20181212105307.GW21184@phenom.ffwll.local>
References: <20181210100359.22507-1-daniel.vetter@ffwll.ch>
 <20181210101133.5364-1-daniel.vetter@ffwll.ch>
 <20181210102426.GG15154@ulmo>
 <CA+M3ks5MgpCqMDp6DrtyB_Cj_YMryysTmbAaUjzN7sWde5dX6Q@mail.gmail.com>
 <CA+M3ks7ODkgZe_otsens1H4PoKOdnfHVxUgi84NPyri6Xhh1dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+M3ks7ODkgZe_otsens1H4PoKOdnfHVxUgi84NPyri6Xhh1dg@mail.gmail.com>
X-Operating-System: Linux phenom 4.18.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 10, 2018 at 02:40:25PM +0100, Benjamin Gaignard wrote:
> Le lun. 10 déc. 2018 à 12:10, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> a écrit :
> >
> > Le lun. 10 déc. 2018 à 11:24, Thierry Reding
> > <thierry.reding@gmail.com> a écrit :
> > >
> > > On Mon, Dec 10, 2018 at 11:11:33AM +0100, Daniel Vetter wrote:
> > > > Having the probe helper stuff (which pretty much everyone needs) in
> > > > the drm_crtc_helper.h file (which atomic drivers should never need) is
> > > > confusing. Split them out.
> > > >
> > > > To make sure I actually achieved the goal here I went through all
> > > > drivers. And indeed, all atomic drivers are now free of
> > > > drm_crtc_helper.h includes.
> > > >
> >
> > I have difficulties to apply this with git on top of drm-misc-next.
> > It is because of that I got errors (encoder and connector types not
> > found) while compiling adv7511_audio.c and exynos_dp.c ?
> >
> 
> Nack on this patch because it break compiling at least on sti driver.
> drm_probe_helper.h doesn't bring the same includes than drm_crtc_helper.h:
> #include <drm/drm_crtc.h>
> #include <drm/drm_modeset_helper_vtables.h>
> #include <drm/drm_modeset_helper.h>
> so some types, structures and functions proptotypes are missing while compiling.

Hm, I thought I've compile-tested all the arm stuff, I guess I've failed.
Will respin, sorry for the confusion.
-Daniel

> 
> 
> > Benjamin
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Cc: virtualization@lists.linux-foundation.org
> > > > Cc: etnaviv@lists.freedesktop.org
> > > > Cc: linux-samsung-soc@vger.kernel.org
> > > > Cc: intel-gfx@lists.freedesktop.org
> > > > Cc: linux-mediatek@lists.infradead.org
> > > > Cc: linux-amlogic@lists.infradead.org
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: freedreno@lists.freedesktop.org
> > > > Cc: nouveau@lists.freedesktop.org
> > > > Cc: spice-devel@lists.freedesktop.org
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > Cc: linux-rockchip@lists.infradead.org
> > > > Cc: linux-stm32@st-md-mailman.stormreply.com
> > > > Cc: linux-tegra@vger.kernel.org
> > > > Cc: xen-devel@lists.xen.org
> > > > ---
> > > >  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  2 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
> > > >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
> > > >  .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  2 +-
> > > >  .../display/amdgpu_dm/amdgpu_dm_services.c    |  2 +-
> > > >  drivers/gpu/drm/arc/arcpgu_crtc.c             |  2 +-
> > > >  drivers/gpu/drm/arc/arcpgu_drv.c              |  2 +-
> > > >  drivers/gpu/drm/arc/arcpgu_sim.c              |  2 +-
> > > >  drivers/gpu/drm/arm/hdlcd_crtc.c              |  2 +-
> > > >  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
> > > >  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
> > > >  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
> > > >  drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
> > > >  drivers/gpu/drm/armada/armada_510.c           |  2 +-
> > > >  drivers/gpu/drm/armada/armada_crtc.c          |  2 +-
> > > >  drivers/gpu/drm/armada/armada_drv.c           |  2 +-
> > > >  drivers/gpu/drm/armada/armada_fb.c            |  2 +-
> > > >  drivers/gpu/drm/ast/ast_drv.c                 |  1 +
> > > >  drivers/gpu/drm/ast/ast_mode.c                |  1 +
> > > >  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  2 +-
> > > >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  2 +-
> > > >  drivers/gpu/drm/bochs/bochs_drv.c             |  1 +
> > > >  drivers/gpu/drm/bochs/bochs_kms.c             |  1 +
> > > >  drivers/gpu/drm/bridge/adv7511/adv7511.h      |  2 +-
> > > >  drivers/gpu/drm/bridge/analogix-anx78xx.c     |  3 +-
> > > >  .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
> > > >  drivers/gpu/drm/bridge/cdns-dsi.c             |  2 +-
> > > >  drivers/gpu/drm/bridge/dumb-vga-dac.c         |  2 +-
> > > >  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  2 +-
> > > >  drivers/gpu/drm/bridge/nxp-ptn3460.c          |  2 +-
> > > >  drivers/gpu/drm/bridge/panel.c                |  2 +-
> > > >  drivers/gpu/drm/bridge/parade-ps8622.c        |  2 +-
> > > >  drivers/gpu/drm/bridge/sii902x.c              |  2 +-
> > > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
> > > >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  2 +-
> > > >  drivers/gpu/drm/bridge/tc358764.c             |  2 +-
> > > >  drivers/gpu/drm/bridge/tc358767.c             |  2 +-
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  2 +-
> > > >  drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
> > > >  drivers/gpu/drm/cirrus/cirrus_drv.c           |  1 +
> > > >  drivers/gpu/drm/cirrus/cirrus_mode.c          |  1 +
> > > >  drivers/gpu/drm/drm_atomic_helper.c           |  1 -
> > > >  drivers/gpu/drm/drm_dp_mst_topology.c         |  2 +-
> > > >  drivers/gpu/drm/drm_modeset_helper.c          |  2 +-
> > > >  drivers/gpu/drm/drm_probe_helper.c            |  2 +-
> > > >  drivers/gpu/drm/drm_simple_kms_helper.c       |  2 +-
> > > >  drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
> > > >  drivers/gpu/drm/exynos/exynos_dp.c            |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
> > > >  drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
> > > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  2 +-
> > > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
> > > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |  2 +-
> > > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  2 +-
> > > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |  2 +-
> > > >  drivers/gpu/drm/gma500/psb_intel_drv.h        |  1 +
> > > >  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  2 +-
> > > >  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
> > > >  .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  2 +-
> > > >  .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  2 +-
> > > >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  2 +-
> > > >  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  2 +-
> > > >  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
> > > >  drivers/gpu/drm/i2c/ch7006_priv.h             |  2 +-
> > > >  drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
> > > >  drivers/gpu/drm/i2c/tda998x_drv.c             |  2 +-
> > > >  drivers/gpu/drm/i915/i915_drv.c               |  2 +-
> > > >  drivers/gpu/drm/i915/intel_crt.c              |  2 +-
> > > >  drivers/gpu/drm/i915/intel_display.c          |  2 +-
> > > >  drivers/gpu/drm/i915/intel_dp.c               |  2 +-
> > > >  drivers/gpu/drm/i915/intel_dp_mst.c           |  2 +-
> > > >  drivers/gpu/drm/i915/intel_drv.h              |  2 +-
> > > >  drivers/gpu/drm/imx/dw_hdmi-imx.c             |  2 +-
> > > >  drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
> > > >  drivers/gpu/drm/imx/imx-ldb.c                 |  2 +-
> > > >  drivers/gpu/drm/imx/imx-tve.c                 |  2 +-
> > > >  drivers/gpu/drm/imx/ipuv3-crtc.c              |  2 +-
> > > >  drivers/gpu/drm/imx/parallel-display.c        |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_dpi.c            |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_drm_fb.c         |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_dsi.c            |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  2 +-
> > > >  drivers/gpu/drm/meson/meson_crtc.c            |  2 +-
> > > >  drivers/gpu/drm/meson/meson_drv.c             |  2 +-
> > > >  drivers/gpu/drm/meson/meson_dw_hdmi.c         |  2 +-
> > > >  drivers/gpu/drm/meson/meson_venc_cvbs.c       |  2 +-
> > > >  drivers/gpu/drm/mgag200/mgag200_mode.c        |  1 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
> > > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  2 +-
> > > >  .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |  2 +-
> > > >  .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |  2 +-
> > > >  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
> > > >  .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  2 +-
> > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
> > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |  2 +-
> > > >  drivers/gpu/drm/msm/msm_drv.h                 |  2 +-
> > > >  drivers/gpu/drm/msm/msm_fb.c                  |  2 +-
> > > >  drivers/gpu/drm/mxsfb/mxsfb_crtc.c            |  2 +-
> > > >  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
> > > >  drivers/gpu/drm/mxsfb/mxsfb_out.c             |  2 +-
> > > >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  1 +
> > > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
> > > >  drivers/gpu/drm/nouveau/nouveau_connector.c   |  1 +
> > > >  drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
> > > >  drivers/gpu/drm/omapdrm/omap_connector.c      |  2 +-
> > > >  drivers/gpu/drm/omapdrm/omap_crtc.c           |  2 +-
> > > >  drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
> > > >  drivers/gpu/drm/omapdrm/omap_drv.h            |  2 +-
> > > >  drivers/gpu/drm/omapdrm/omap_encoder.c        |  2 +-
> > > >  drivers/gpu/drm/omapdrm/omap_fb.c             |  2 +-
> > > >  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
> > > >  drivers/gpu/drm/qxl/qxl_display.c             |  2 +-
> > > >  drivers/gpu/drm/qxl/qxl_drv.c                 |  3 +-
> > > >  drivers/gpu/drm/qxl/qxl_fb.c                  |  2 +-
> > > >  drivers/gpu/drm/qxl/qxl_kms.c                 |  2 +-
> > > >  drivers/gpu/drm/radeon/radeon_acpi.c          |  1 +
> > > >  drivers/gpu/drm/radeon/radeon_connectors.c    |  1 +
> > > >  drivers/gpu/drm/radeon/radeon_device.c        |  1 +
> > > >  drivers/gpu/drm/radeon/radeon_display.c       |  1 +
> > > >  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  1 +
> > > >  drivers/gpu/drm/radeon/radeon_drv.c           |  1 +
> > > >  drivers/gpu/drm/radeon/radeon_irq_kms.c       |  1 +
> > > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  2 +-
> > > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
> > > >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  2 +-
> > > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  2 +-
> > > >  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  2 +-
> > > >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  2 +-
> > > >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  2 +-
> > > >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  2 +-
> > > >  drivers/gpu/drm/rockchip/cdn-dp-core.c        |  2 +-
> > > >  drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
> > > >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  2 +-
> > > >  drivers/gpu/drm/rockchip/inno_hdmi.c          |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_psr.c   |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
> > > >  drivers/gpu/drm/rockchip/rockchip_rgb.c       |  2 +-
> > > >  drivers/gpu/drm/sti/sti_crtc.c                |  2 +-
> > > >  drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
> > > >  drivers/gpu/drm/sti/sti_dvo.c                 |  2 +-
> > > >  drivers/gpu/drm/sti/sti_hda.c                 |  2 +-
> > > >  drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
> > > >  drivers/gpu/drm/sti/sti_tvout.c               |  2 +-
> > > >  drivers/gpu/drm/stm/drv.c                     |  2 +-
> > > >  drivers/gpu/drm/stm/ltdc.c                    |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_backend.c         |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_crtc.c            |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_lvds.c            |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_rgb.c             |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c            |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun4i_tv.c              |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c           |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  2 +-
> > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  2 +-
> > > >  drivers/gpu/drm/tegra/drm.h                   |  2 +-
> > > >  drivers/gpu/drm/tegra/hdmi.c                  |  2 +-
> > > >  drivers/gpu/drm/tegra/hub.c                   |  2 +-
> > > >  drivers/gpu/drm/tinydrm/core/tinydrm-core.c   |  2 +-
> > > >  drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c   |  2 +-
> > > >  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
> > > >  drivers/gpu/drm/udl/udl_connector.c           |  1 +
> > > >  drivers/gpu/drm/udl/udl_drv.c                 |  1 +
> > > >  drivers/gpu/drm/udl/udl_main.c                |  1 +
> > > >  drivers/gpu/drm/vc4/vc4_crtc.c                |  2 +-
> > > >  drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
> > > >  drivers/gpu/drm/vc4/vc4_dsi.c                 |  2 +-
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
> > > >  drivers/gpu/drm/vc4/vc4_kms.c                 |  2 +-
> > > >  drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
> > > >  drivers/gpu/drm/vc4/vc4_vec.c                 |  2 +-
> > > >  drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
> > > >  drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
> > > >  drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
> > > >  drivers/gpu/drm/vkms/vkms_drv.c               |  2 +-
> > > >  drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
> > > >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  2 +-
> > > >  drivers/gpu/drm/xen/xen_drm_front.c           |  2 +-
> > > >  drivers/gpu/drm/xen/xen_drm_front_conn.c      |  2 +-
> > > >  drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
> > > >  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
> > > >  drivers/gpu/drm/zte/zx_drm_drv.c              |  2 +-
> > > >  drivers/gpu/drm/zte/zx_hdmi.c                 |  2 +-
> > > >  drivers/gpu/drm/zte/zx_tvenc.c                |  2 +-
> > > >  drivers/gpu/drm/zte/zx_vga.c                  |  2 +-
> > > >  drivers/gpu/drm/zte/zx_vou.c                  |  2 +-
> > > >  drivers/staging/vboxvideo/vbox_irq.c          |  2 +-
> > > >  drivers/staging/vboxvideo/vbox_mode.c         |  2 +-
> > > >  include/drm/drm_crtc_helper.h                 | 16 ------
> > > >  include/drm/drm_probe_helper.h                | 50 +++++++++++++++++++
> > > >  208 files changed, 256 insertions(+), 200 deletions(-)
> > > >  create mode 100644 include/drm/drm_probe_helper.h
> > >
> > > Looks good to me:
> > >
> > > Acked-by: Thierry Reding <treding@nvidia.com>
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Benjamin Gaignard
> 
> Graphic Study Group
> 
> Linaro.org │ Open source software for ARM SoCs
> 
> Follow Linaro: Facebook | Twitter | Blog

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
