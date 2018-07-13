Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44967 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbeGMHho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 03:37:44 -0400
Date: Fri, 13 Jul 2018 09:24:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: host: xhci-plat: add firmware_name for R-Car
 Gen3
Message-ID: <20180713072420.3etrtrkzz3ondqez@verge.net.au>
References: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1530614818-7634-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530614818-7634-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 03, 2018 at 07:46:56PM +0900, Yoshihiro Shimoda wrote:
> To clean up the xhci-rcar.c code later, this patch adds firmware_name
> "V3" for R-Car Gen3.

Maybe "to allow for a follow-up to clean up the xhci-rcar.c code, this
patch firmware_name "V3" for R-Car Gen3.

>From a backporting point of view I think it would be slightly nicer to
merge this and the following (the follow-up cleanup) patch. But I don't
feel strongly about that.

The above notwithstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/host/xhci-plat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1b22fc..8dc77e3 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -105,6 +105,7 @@ static int xhci_plat_start(struct usb_hcd *hcd)
>  };
>  
>  static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
> +	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
>  	.init_quirk = xhci_rcar_init_quirk,
>  	.plat_start = xhci_rcar_start,
>  	.resume_quirk = xhci_rcar_resume_quirk,
> -- 
> 1.9.1
> 
