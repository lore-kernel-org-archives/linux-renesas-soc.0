Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44982 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbeGMHi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 03:38:28 -0400
Date: Fri, 13 Jul 2018 09:25:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: host: xhci-rcar: Simplify getting the firmware
 name for R-Car Gen3
Message-ID: <20180713072503.7hbgyidfbmkh3it7@verge.net.au>
References: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1530614818-7634-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530614818-7634-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 03, 2018 at 07:46:57PM +0900, Yoshihiro Shimoda wrote:
> This patch simplifies getting the firmware name for R-Car Gen3.
> Almost all R-Car Gen3 USB3.0 Host controllers use "V3". But,
> r8a7795 ES1.x SoCs only should use "V2". Since the xhci-plat already
> has the firmware_name of R-Car Gen3 as "V3", the xhci-rcar doesn't
> need some members of rcar_quirks_match.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I would slightly prefer if this patch was squashed into 1/3.
But nonetheless:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/usb/host/xhci-rcar.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index f33ffc2..4a22f25 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -17,9 +17,8 @@
>  #include "xhci-rcar.h"
>  
>  /*
> -* - The V3 firmware is for r8a7796 (with good performance) and r8a7795 es2.0
> -*   or later.
> -* - The V2 firmware can be used on both r8a7795 (es1.x) and r8a7796.
> +* - The V3 firmware is for almost all R-Car Gen3 (except r8a7795 ES1.x)
> +* - The V2 firmware is for r8a7795 ES1.x.
>  * - The V2 firmware is possible to use on R-Car Gen2. However, the V2 causes
>  *   performance degradation. So, this driver continues to use the V1 if R-Car
>  *   Gen2.
> @@ -75,18 +74,6 @@
>  		.soc_id = "r8a7795", .revision = "ES1.*",
>  		.data = (void *)RCAR_XHCI_FIRMWARE_V2,
>  	},
> -	{
> -		.soc_id = "r8a7795",
> -		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
> -	},
> -	{
> -		.soc_id = "r8a7796",
> -		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
> -	},
> -	{
> -		.soc_id = "r8a77965",
> -		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
> -	},
>  	{ /* sentinel */ },
>  };
>  
> -- 
> 1.9.1
> 
