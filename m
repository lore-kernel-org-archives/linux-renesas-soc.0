Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39293 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753004AbcJGFlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 01:41:04 -0400
Date: Fri, 7 Oct 2016 14:40:58 +0900
From: Simon Horman <horms@verge.net.au>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
Subject: Re: HDMI No signal for koelsch Board
Message-ID: <20161007054058.GB5855@verge.net.au>
References: <SG2PR0401MB1296D6828F14FE3C6D844327D8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR0401MB1296D6828F14FE3C6D844327D8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Fri, Oct 07, 2016 at 05:11:21AM +0000, Jithin T Raj wrote:
> hi,
>     I have a trouble in getting HDMI OUT in koelsche Board  
> 
> 
> 
> I am using source tree v4.1.17-ltsi..also i have applied the below patch to shmobile_defconfig
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 0bdeb4925be4..3aef019c0de7 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -140,7 +140,10 @@ CONFIG_VIDEO_RENESAS_VSP1=y
>  CONFIG_VIDEO_ADV7180=y
>  CONFIG_VIDEO_ML86V7667=y
>  CONFIG_DRM=y
> +CONFIG_DRM_I2C_ADV7511=y
>  CONFIG_DRM_RCAR_DU=y
> +CONFIG_DRM_RCAR_HDMI=y
> +CONFIG_DRM_RCAR_LVDS=y
>  CONFIG_FB_SH_MOBILE_LCDC=y
>  CONFIG_FB_SH_MOBILE_MERAM=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
> 
> and when I checked the pinmux it is like
> 
> du_pins: du {
>         renesas,groups = "du_rgb666", "du_sync", "du_disp", "du_clk_out_0";
>         renesas,function = "du";
>     };
> 
> do I need to change it to   24 bit (du_rgb888)? my UBoot is gb653737..

I would recommend looking at the latest mainline code.
e.g. Do you get HDMI output on v4.8?
