Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751552AbdHRIGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 04:06:35 -0400
Date: Fri, 18 Aug 2017 10:06:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH ] ARM: multi_v7_defconfig: Enable BQ32000 RTC driver
Message-ID: <20170818080621.GI9175@verge.net.au>
References: <1502975345-4209-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502975345-4209-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 17, 2017 at 02:09:05PM +0100, Biju Das wrote:
> The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> To increase hardware support enable the driver in the
> multi_v7_defconfig multiplatform configuration.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against linux-next tag next-20170817 as well as 
> renesas-dev tag renesas-devel-20170815-v4.13-rc5 .
> 
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 18e1f80..02dc373 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -766,6 +766,7 @@ CONFIG_RTC_DRV_MAX8997=m
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_RK808=m
>  CONFIG_RTC_DRV_RS5C372=m
> +CONFIG_RTC_DRV_BQ32K=y

My assumption is that multi_v7_defconfig produces a very large kernel image
and that we should try to avoid making it larger by using modules where
possible. Is it practical to enable this option as a module (m) rather than
a built-in (y)?

>  CONFIG_RTC_DRV_PALMAS=y
>  CONFIG_RTC_DRV_ST_LPC=y
>  CONFIG_RTC_DRV_TWL4030=y
> -- 
> 1.9.1
> 
