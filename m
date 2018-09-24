Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49719 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbeIXPJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 11:09:58 -0400
Date: Mon, 24 Sep 2018 11:08:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 5/5] ARM: shmobile: defconfig: Enable SII902X
Message-ID: <20180924090850.krd2cjzf6cyfdfh6@verge.net.au>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537553311-8831-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537553311-8831-6-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 21, 2018 at 07:08:31PM +0100, Fabrizio Castro wrote:
> The iwg23s board comes with the SiI9022ACNU HDMI transmitter,
> this patch makes sure the corresponding driver gets built.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> 
> Hello Simon,
> 
> a patch for the multi_v7_defconfig will be sent at a later stage.

Thanks Fabrizio,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> Thanks,
> Fab
> 
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index d090022..9e5a5ad 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -142,6 +142,7 @@ CONFIG_DRM=y
>  CONFIG_DRM_RCAR_DU=y
>  CONFIG_DRM_RCAR_LVDS=y
>  CONFIG_DRM_DUMB_VGA_DAC=y
> +CONFIG_DRM_SII902X=y
>  CONFIG_DRM_I2C_ADV7511=y
>  CONFIG_DRM_I2C_ADV7511_AUDIO=y
>  CONFIG_FB_SH_MOBILE_LCDC=y
> -- 
> 2.7.4
> 
