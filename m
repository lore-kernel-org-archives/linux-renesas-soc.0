Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B759CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 14:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 680F020866
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 14:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpL+9jmT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbfAOO63 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 09:58:29 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39988 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfAOO61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 09:58:27 -0500
Received: by mail-lf1-f67.google.com with SMTP id v5so2253849lfe.7;
        Tue, 15 Jan 2019 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tiyxT14ak0ELW7KiHACFLDYCySHaPU9b8mArDRN5xS0=;
        b=QpL+9jmTRHQuIxPzCE8kECabRaWtpcSAjWeir77VcVnIKA3xgvOR+AlgXFgrCVjRPH
         IuqHMk8XolMsO0cNd5+cZNljpGBfK3dTCFjXMaxNUg5xvphvcGyXFoWS74GdXpp2rnHT
         8NFNTvj5JQhauFh4syuGvv/YJzEzNhjf7mhH4NsoCP8+qpyZ/zvlpbk+YW8+XQJOfa/a
         D1gCjgd6mrTOyrJgRQKUSDQ0iPtGRiF/b+jbqdYDYWfjEQV/esoO3Df24YZ4QcnI4go/
         2ijXnm9YFlvKwcQAFT1s0kyt9OuIV8saWsS27yA96FLizVej0Ho5D824ItK8do7nxJVo
         PwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tiyxT14ak0ELW7KiHACFLDYCySHaPU9b8mArDRN5xS0=;
        b=FrXzSqF9SwRC72TLjIaagND9iJadRGw5i33NYaJDmJBA9ipH7olZ5chusnOCRKR/XJ
         OWgcmqOXGoKsIixPwypIrN8FOrnESfSYM1zIrBx6jtMQFIij67KK/rSyTvGlYi6FX+pd
         zru3V2ZAQUKoy+XAJ3BsDmJNjCT81WHv1PT82eo0vySUefgLAdPsvcs8QgUqxnO1L7TL
         O+Hd3wOyTiXLPtnZn1ceROOFeImzPGx+a3SquPxGT/RHlQZ5LNa/SWmrVL+8TI2ignpN
         ptYvS1YN42VD8nvu1jBLdXm4nRYd4fD2GxBVHzu5zBFxWppmumZZHoKQyaCUBAu3GVRL
         clDw==
X-Gm-Message-State: AJcUukdzZruD/BCD9Q8vtQfChLGasEOEW4UP0xjYT+WKFegnqX2I8QBi
        CvRky2N/Z3eXK6sPoqtqlUTJO21I+/4=
X-Google-Smtp-Source: ALg8bN4p0cg2pw/IMnVGNQgFyJX/QBU83Asd1BWdUFVTq7wzAWlJ07/WJz1360Bv05yyx94e7zKKNA==
X-Received: by 2002:a19:c995:: with SMTP id z143mr2888340lff.79.1547564301628;
        Tue, 15 Jan 2019 06:58:21 -0800 (PST)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
        by smtp.gmail.com with ESMTPSA id a11sm668117lff.68.2019.01.15.06.58.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jan 2019 06:58:21 -0800 (PST)
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc:     freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        etnaviv@lists.freedesktop.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        virtualization@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-amlogic@lists.infradead.org, xen-devel@lists.xen.org,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20190115104137.25695-1-daniel.vetter@ffwll.ch>
 <4b1210f4-1903-0a89-c9fe-781bdb64f89c@baylibre.com>
From:   Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <b4174577-fe6c-3436-82d6-8e1f5fbd6517@gmail.com>
Date:   Tue, 15 Jan 2019 16:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <4b1210f4-1903-0a89-c9fe-781bdb64f89c@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/15/19 2:26 PM, Neil Armstrong wrote:
> On 15/01/2019 11:41, Daniel Vetter wrote:
>> Having the probe helper stuff (which pretty much everyone needs) in
>> the drm_crtc_helper.h file (which atomic drivers should never need) is
>> confusing. Split them out.
>>
>> To make sure I actually achieved the goal here I went through all
>> drivers. And indeed, all atomic drivers are now free of
>> drm_crtc_helper.h includes.
>>
>> v2: Make it compile. There was so much compile fail on arm drivers
>> that I figured I'll better not include any of the acks on v1.
>>
>> v3: Massive rebase because i915 has lost a lot of drmP.h includes, but
>> not all: Through drm_crtc_helper.h > drm_modeset_helper.h -> drmP.h
>> there was still one, which this patch largely removes. Which means
>> rolling out lots more includes all over.
>>
>> This will also conflict with ongoing drmP.h cleanup by others I
>> expect.
>>
>> v3: Rebase on top of atomic bochs.
>>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v2)
>> Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org> (v2)
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: virtualization@lists.linux-foundation.org
>> Cc: etnaviv@lists.freedesktop.org
>> Cc: linux-samsung-soc@vger.kernel.org
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: linux-mediatek@lists.infradead.org
>> Cc: linux-amlogic@lists.infradead.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: spice-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-rockchip@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-tegra@vger.kernel.org
>> Cc: xen-devel@lists.xen.org
>> ---
>> Merging this is going to be a bit a mess due to all the ongoing drmP.h
>> cleanups. I think the following should work:
>> - Apply Sam's prep patches for removing drmP.h from
>>    drm_modeset_helper.h
>> - Get the i915 drmP.h cleanup backmerged into drm-misc-next
>> - Apply this patch.
>> - Apply Sam's patch to remove drmP.h from drm_modeset_helper.h
>> - All through drm-misc-next, which has some potential for trivial
>>    conflicts around #includes with other drivers unfortunately.
>>
>> I hope there's no other driver who'll blow up accidentally because
>> someone else is doing a drmP.h cleanup. Laurent maybe?
>>
>> Jani, ack on this?
>> -Daniel
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>>   .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  2 +-
>>   .../display/amdgpu_dm/amdgpu_dm_services.c    |  2 +-
>>   drivers/gpu/drm/arc/arcpgu_crtc.c             |  2 +-
>>   drivers/gpu/drm/arc/arcpgu_drv.c              |  2 +-
>>   drivers/gpu/drm/arc/arcpgu_sim.c              |  2 +-
>>   drivers/gpu/drm/arm/hdlcd_crtc.c              |  2 +-
>>   drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>>   drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
>>   drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>>   drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
>>   drivers/gpu/drm/armada/armada_510.c           |  2 +-
>>   drivers/gpu/drm/armada/armada_crtc.c          |  2 +-
>>   drivers/gpu/drm/armada/armada_crtc.h          |  2 +
>>   drivers/gpu/drm/armada/armada_drv.c           |  2 +-
>>   drivers/gpu/drm/armada/armada_fb.c            |  2 +-
>>   drivers/gpu/drm/ast/ast_drv.c                 |  1 +
>>   drivers/gpu/drm/ast/ast_mode.c                |  1 +
>>   .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  2 +-
>>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  2 +-
>>   drivers/gpu/drm/bochs/bochs_drv.c             |  1 +
>>   drivers/gpu/drm/bochs/bochs_kms.c             |  1 +
>>   drivers/gpu/drm/bridge/adv7511/adv7511.h      |  5 +-
>>   drivers/gpu/drm/bridge/analogix-anx78xx.c     |  2 +-
>>   .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
>>   drivers/gpu/drm/bridge/cdns-dsi.c             |  2 +-
>>   drivers/gpu/drm/bridge/dumb-vga-dac.c         |  2 +-
>>   .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  2 +-
>>   drivers/gpu/drm/bridge/nxp-ptn3460.c          |  2 +-
>>   drivers/gpu/drm/bridge/panel.c                |  2 +-
>>   drivers/gpu/drm/bridge/parade-ps8622.c        |  2 +-
>>   drivers/gpu/drm/bridge/sii902x.c              |  2 +-
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
>>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  2 +-
>>   drivers/gpu/drm/bridge/tc358764.c             |  2 +-
>>   drivers/gpu/drm/bridge/tc358767.c             |  2 +-
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  2 +-
>>   drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
>>   drivers/gpu/drm/cirrus/cirrus_drv.c           |  1 +
>>   drivers/gpu/drm/cirrus/cirrus_mode.c          |  1 +
>>   drivers/gpu/drm/drm_atomic_helper.c           |  1 -
>>   drivers/gpu/drm/drm_dp_mst_topology.c         |  2 +-
>>   drivers/gpu/drm/drm_modeset_helper.c          |  2 +-
>>   drivers/gpu/drm/drm_probe_helper.c            |  2 +-
>>   drivers/gpu/drm/drm_simple_kms_helper.c       |  2 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
>>   drivers/gpu/drm/exynos/exynos_dp.c            |  3 +-
>>   drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
>>   drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  2 +-
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |  2 +-
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  2 +-
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |  2 +-
>>   drivers/gpu/drm/gma500/psb_intel_drv.h        |  1 +
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  2 +-
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  2 +-
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  2 +-
>>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  2 +-
>>   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  2 +-
>>   .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>>   drivers/gpu/drm/i2c/ch7006_priv.h             |  1 +
>>   drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
>>   drivers/gpu/drm/i2c/tda998x_drv.c             |  2 +-
>>   drivers/gpu/drm/i915/i915_debugfs.c           |  3 +-
>>   drivers/gpu/drm/i915/i915_drv.c               |  2 +-
>>   drivers/gpu/drm/i915/i915_gem.c               |  2 +
>>   drivers/gpu/drm/i915/i915_ioc32.c             |  1 +
>>   drivers/gpu/drm/i915/i915_irq.c               |  2 +
>>   drivers/gpu/drm/i915/i915_pci.c               |  2 +
>>   drivers/gpu/drm/i915/i915_trace.h             |  2 +
>>   drivers/gpu/drm/i915/intel_crt.c              |  2 +-
>>   drivers/gpu/drm/i915/intel_display.c          |  2 +-
>>   drivers/gpu/drm/i915/intel_dp.c               |  2 +-
>>   drivers/gpu/drm/i915/intel_dp_mst.c           |  2 +-
>>   drivers/gpu/drm/i915/intel_drv.h              |  3 +-
>>   drivers/gpu/drm/i915/intel_fbc.c              |  2 +
>>   drivers/gpu/drm/i915/intel_fbdev.c            |  2 +
>>   drivers/gpu/drm/i915/intel_lpe_audio.c        |  1 +
>>   drivers/gpu/drm/i915/intel_overlay.c          |  2 +
>>   drivers/gpu/drm/imx/dw_hdmi-imx.c             |  2 +-
>>   drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
>>   drivers/gpu/drm/imx/imx-ldb.c                 |  2 +-
>>   drivers/gpu/drm/imx/imx-tve.c                 |  2 +-
>>   drivers/gpu/drm/imx/ipuv3-crtc.c              |  2 +-
>>   drivers/gpu/drm/imx/parallel-display.c        |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_dpi.c            |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_fb.c         |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_dsi.c            |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c           |  2 +-
>>   drivers/gpu/drm/meson/meson_crtc.c            |  2 +-
>>   drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c         |  2 +-
>>   drivers/gpu/drm/meson/meson_venc_cvbs.c       |  2 +-
> For meson:
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>
>>   drivers/gpu/drm/mgag200/mgag200_mode.c        |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  2 +-
>>   .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |  2 +-
>>   .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |  2 +-
>>   .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
>>   .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  2 +-
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |  2 +-
>>   drivers/gpu/drm/msm/msm_drv.h                 |  2 +-
>>   drivers/gpu/drm/msm/msm_fb.c                  |  2 +-
>>   drivers/gpu/drm/mxsfb/mxsfb_crtc.c            |  2 +-
>>   drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>>   drivers/gpu/drm/mxsfb/mxsfb_out.c             |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  1 +
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_connector.c   |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
>>   drivers/gpu/drm/omapdrm/omap_connector.c      |  2 +-
>>   drivers/gpu/drm/omapdrm/omap_crtc.c           |  2 +-
>>   drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
>>   drivers/gpu/drm/omapdrm/omap_drv.h            |  2 +-
>>   drivers/gpu/drm/omapdrm/omap_encoder.c        |  2 +-
>>   drivers/gpu/drm/omapdrm/omap_fb.c             |  2 +-
>>   drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>>   drivers/gpu/drm/qxl/qxl_display.c             |  2 +-
>>   drivers/gpu/drm/qxl/qxl_drv.c                 |  3 +-
>>   drivers/gpu/drm/qxl/qxl_fb.c                  |  2 +-
>>   drivers/gpu/drm/qxl/qxl_kms.c                 |  2 +-
>>   drivers/gpu/drm/radeon/radeon_acpi.c          |  1 +
>>   drivers/gpu/drm/radeon/radeon_connectors.c    |  1 +
>>   drivers/gpu/drm/radeon/radeon_device.c        |  1 +
>>   drivers/gpu/drm/radeon/radeon_display.c       |  1 +
>>   drivers/gpu/drm/radeon/radeon_dp_mst.c        |  1 +
>>   drivers/gpu/drm/radeon/radeon_drv.c           |  1 +
>>   drivers/gpu/drm/radeon/radeon_irq_kms.c       |  1 +
>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  2 +-
>>   drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>>   drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  2 +-
>>   drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  2 +-
>>   drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  2 +-
>>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  2 +-
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c           |  2 +-
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  2 +-
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c        |  2 +-
>>   drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  2 +-
>>   drivers/gpu/drm/rockchip/inno_hdmi.c          |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_psr.c   |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_rgb.c       |  2 +-
>>   drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  1 +
>>   drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  1 +
>>   drivers/gpu/drm/shmobile/shmob_drm_kms.c      |  1 +
>>   drivers/gpu/drm/sti/sti_crtc.c                |  2 +-
>>   drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>>   drivers/gpu/drm/sti/sti_dvo.c                 |  2 +-
>>   drivers/gpu/drm/sti/sti_hda.c                 |  2 +-
>>   drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
>>   drivers/gpu/drm/sti/sti_tvout.c               |  2 +-
>>   drivers/gpu/drm/stm/drv.c                     |  2 +-
>>   drivers/gpu/drm/stm/ltdc.c                    |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_backend.c         |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_crtc.c            |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_lvds.c            |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_rgb.c             |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_tcon.c            |  2 +-
>>   drivers/gpu/drm/sun4i/sun4i_tv.c              |  2 +-
>>   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  2 +-
>>   drivers/gpu/drm/sun4i/sun8i_mixer.c           |  2 +-
>>   drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  2 +-
>>   drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  2 +-
>>   drivers/gpu/drm/tegra/drm.h                   |  2 +-
>>   drivers/gpu/drm/tegra/fb.c                    |  1 +
>>   drivers/gpu/drm/tegra/hdmi.c                  |  2 +-
>>   drivers/gpu/drm/tegra/hub.c                   |  2 +-
>>   drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  1 +
>>   drivers/gpu/drm/tilcdc/tilcdc_drv.h           |  1 -
>>   drivers/gpu/drm/tilcdc/tilcdc_external.c      |  1 +
>>   drivers/gpu/drm/tilcdc/tilcdc_panel.c         |  1 +
>>   drivers/gpu/drm/tilcdc/tilcdc_tfp410.c        |  1 +
>>   drivers/gpu/drm/tinydrm/core/tinydrm-core.c   |  2 +-
>>   drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c   |  2 +-
>>   drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>>   drivers/gpu/drm/udl/udl_connector.c           |  1 +
>>   drivers/gpu/drm/udl/udl_drv.c                 |  1 +
>>   drivers/gpu/drm/udl/udl_main.c                |  1 +
>>   drivers/gpu/drm/vc4/vc4_crtc.c                |  2 +-
>>   drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_dsi.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
>>   drivers/gpu/drm/vc4/vc4_kms.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_vec.c                 |  2 +-
>>   drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
>>   drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
>>   drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
>>   drivers/gpu/drm/vkms/vkms_drv.c               |  2 +-
>>   drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  2 +-
>>   drivers/gpu/drm/xen/xen_drm_front.c           |  2 +-
>>   drivers/gpu/drm/xen/xen_drm_front_conn.c      |  2 +-
>>   drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
>>   drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
For Xen:
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>   drivers/gpu/drm/zte/zx_drm_drv.c              |  2 +-
>>   drivers/gpu/drm/zte/zx_hdmi.c                 |  2 +-
>>   drivers/gpu/drm/zte/zx_tvenc.c                |  2 +-
>>   drivers/gpu/drm/zte/zx_vga.c                  |  2 +-
>>   drivers/gpu/drm/zte/zx_vou.c                  |  2 +-
>>   drivers/staging/vboxvideo/vbox_irq.c          |  4 +-
>>   drivers/staging/vboxvideo/vbox_mode.c         |  2 +-
>>   include/drm/drm_crtc_helper.h                 | 16 ------
>>   include/drm/drm_probe_helper.h                | 50 +++++++++++++++++++
>>   227 files changed, 289 insertions(+), 200 deletions(-)
>>   create mode 100644 include/drm/drm_probe_helper.h
>>
> [...]
>
>> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
>> index 75d97f1b2e8f..ec573c04206b 100644
>> --- a/drivers/gpu/drm/meson/meson_crtc.c
>> +++ b/drivers/gpu/drm/meson/meson_crtc.c
>> @@ -30,7 +30,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_flip_work.h>
>> -#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_probe_helper.h>
>>   
>>   #include "meson_crtc.h"
>>   #include "meson_plane.h"
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 1f2cf27ecb24..09e67a9cf678 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -31,7 +31,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_flip_work.h>
>> -#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_probe_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index bc25001b8207..a6165b1a564d 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -27,7 +27,7 @@
>>   
>>   #include <drm/drmP.h>
>>   #include <drm/drm_edid.h>
>> -#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_probe_helper.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/bridge/dw_hdmi.h>
>>   
>> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
>> index f7945bae3b4a..64de3a7026d0 100644
>> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
>> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
>> @@ -27,7 +27,7 @@
>>   
>>   #include <drm/drmP.h>
>>   #include <drm/drm_edid.h>
>> -#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_probe_helper.h>
>>   #include <drm/drm_atomic_helper.h>
>>   
>>   #include "meson_venc_cvbs.h"
> [...]
>
>> diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
>> index 0ee9a96b70da..a6d520d5b6ca 100644
>> --- a/include/drm/drm_crtc_helper.h
>> +++ b/include/drm/drm_crtc_helper.h
>> @@ -58,20 +58,4 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode);
>>   void drm_helper_resume_force_mode(struct drm_device *dev);
>>   int drm_helper_force_disable_all(struct drm_device *dev);
>>   
>> -/* drm_probe_helper.c */
>> -int drm_helper_probe_single_connector_modes(struct drm_connector
>> -					    *connector, uint32_t maxX,
>> -					    uint32_t maxY);
>> -int drm_helper_probe_detect(struct drm_connector *connector,
>> -			    struct drm_modeset_acquire_ctx *ctx,
>> -			    bool force);
>> -void drm_kms_helper_poll_init(struct drm_device *dev);
>> -void drm_kms_helper_poll_fini(struct drm_device *dev);
>> -bool drm_helper_hpd_irq_event(struct drm_device *dev);
>> -void drm_kms_helper_hotplug_event(struct drm_device *dev);
>> -
>> -void drm_kms_helper_poll_disable(struct drm_device *dev);
>> -void drm_kms_helper_poll_enable(struct drm_device *dev);
>> -bool drm_kms_helper_is_poll_worker(void);
>> -
>>   #endif
>> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
>> new file mode 100644
>> index 000000000000..96c060c16a1e
>> --- /dev/null
>> +++ b/include/drm/drm_probe_helper.h
>> @@ -0,0 +1,50 @@
>> +/*
>> + * Copyright © 2006 Keith Packard
>> + * Copyright © 2007-2008 Dave Airlie
>> + * Copyright © 2007-2008 Intel Corporation
>> + *   Jesse Barnes <jesse.barnes@intel.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#ifndef __DRM_PROBE_HELPER_H__
>> +#define __DRM_PROBE_HELPER_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_connector;
>> +struct drm_device;
>> +struct drm_modeset_acquire_ctx;
>> +
>> +int drm_helper_probe_single_connector_modes(struct drm_connector
>> +					    *connector, uint32_t maxX,
>> +					    uint32_t maxY);
>> +int drm_helper_probe_detect(struct drm_connector *connector,
>> +			    struct drm_modeset_acquire_ctx *ctx,
>> +			    bool force);
>> +void drm_kms_helper_poll_init(struct drm_device *dev);
>> +void drm_kms_helper_poll_fini(struct drm_device *dev);
>> +bool drm_helper_hpd_irq_event(struct drm_device *dev);
>> +void drm_kms_helper_hotplug_event(struct drm_device *dev);
>> +
>> +void drm_kms_helper_poll_disable(struct drm_device *dev);
>> +void drm_kms_helper_poll_enable(struct drm_device *dev);
>> +bool drm_kms_helper_is_poll_worker(void);
>> +
>> +#endif
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

