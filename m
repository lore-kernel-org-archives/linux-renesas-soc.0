Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:59458 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbeDUIBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Apr 2018 04:01:31 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: sh_mobile_meram: Drop SUPERH platform dependency
Date: Sat, 21 Apr 2018 11:01:41 +0300
Message-ID: <7367160.RYi9065hmc@avalon>
In-Reply-To: <1524234051-14058-1-git-send-email-geert+renesas@glider.be>
References: <1524234051-14058-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Friday, 20 April 2018 17:20:51 EEST Geert Uytterhoeven wrote:
> Since commit a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C
> board code"), the only remaining platforms using this driver are SuperH
> SH-Mobile SoCs (sh7723).  As both SUPERH and ARCH_SHMOBILE are set for
> these platforms, the SUPERH dependency can be dropped.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/video/fbdev/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index d94254263ea5caa7..434e95b9320ead05 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2348,7 +2348,7 @@ source "drivers/video/fbdev/mmp/Kconfig"
> 
>  config FB_SH_MOBILE_MERAM
>  	tristate "SuperH Mobile MERAM read ahead support"
> -	depends on (SUPERH || ARCH_SHMOBILE)
> +	depends on ARCH_SHMOBILE
>  	select GENERIC_ALLOCATOR
>  	---help---
>  	  Enable MERAM support for the SuperH controller.


-- 
Regards,

Laurent Pinchart
