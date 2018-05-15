Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33155 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752357AbeEOHbX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 03:31:23 -0400
Date: Tue, 15 May 2018 09:31:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 5/6] usb: gadget: udc: renesas_usb3: should fail if
 devm_phy_get() returns error
Message-ID: <20180515073103.urmp3mbvzhxjdjyi@verge.net.au>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523338734-20474-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523338734-20474-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 10, 2018 at 02:38:53PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that this driver ignores errors other than
> the non-existence of the device, f.e. a memory allocation failure
> in devm_phy_get(). So, this patch replaces devm_phy_get() with
> devm_phy_optional_get().
> 
> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for generic phy")
> Cc: <stable@vger.kernel.org> # v4.15+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> Remarks:
>  - A new file in v2
> 
>  drivers/usb/gadget/udc/renesas_usb3.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index 233bc04..0e70163 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2636,9 +2636,11 @@ static int renesas_usb3_probe(struct platform_device *pdev)
>  	 * This is optional. So, if this driver cannot get a phy,
>  	 * this driver will not handle a phy anymore.
>  	 */
> -	usb3->phy = devm_phy_get(&pdev->dev, "usb");
> -	if (IS_ERR(usb3->phy))
> -		usb3->phy = NULL;
> +	usb3->phy = devm_phy_optional_get(&pdev->dev, "usb");
> +	if (IS_ERR(usb3->phy)) {
> +		ret = PTR_ERR(usb3->phy);
> +		goto err_add_udc;
> +	}
>  
>  	pm_runtime_enable(&pdev->dev);
>  	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
> -- 
> 1.9.1
> 
