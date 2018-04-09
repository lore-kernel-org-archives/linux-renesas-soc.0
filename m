Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55757 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbeDIL6b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 07:58:31 -0400
Date: Mon, 9 Apr 2018 13:58:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: gadget: udc: renesas_usb3: should call
 devm_phy_get() before add udc
Message-ID: <20180409115826.xrsdg3khgs7opgzh@verge.net.au>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522671694-10229-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 02, 2018 at 09:21:34PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that this driver cannot call phy_init()
> if a gadget driver is alreadly loaded because usb_add_gadget_udc()
> might call renesas_usb3_start() via .udc_start.
> 
> Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for generic phy")
> Cc: <stable@vger.kernel.org> # v4.15+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


Please see some suggestions for follow-up lower-priority patches below.

> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index 738b734..671bac3 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2632,6 +2632,14 @@ static int renesas_usb3_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_alloc_prd;
>  
> +	/*
> +	 * This is an optional. So, if this driver cannot get a phy,
> +	 * this driver will not handle a phy anymore.
> +	 */

nit: s/an optional/optional/

> +	usb3->phy = devm_phy_get(&pdev->dev, "usb");
> +	if (IS_ERR(usb3->phy))
> +		usb3->phy = NULL;

I think this will unintentionally ignore errors other than the
non-existence of the device, f.e. a memory allocation failure
in devm_phy_get().

So perhaps something like this, as per phy_optional_get(), would be better?

	usb3->phy = devm_phy_get(&pdev->dev, "usb");
	if (IS_ERR(usb3->phy) && (PTR_ERR(usb3->phy) == -ENODEV))
		usb3->phy = NULL;

> +
>  	pm_runtime_enable(&pdev->dev);
>  	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
>  	if (ret < 0)
> @@ -2641,14 +2649,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_dev_create;
>  
> -	/*
> -	 * This is an optional. So, if this driver cannot get a phy,
> -	 * this driver will not handle a phy anymore.
> -	 */
> -	usb3->phy = devm_phy_get(&pdev->dev, "usb");
> -	if (IS_ERR(usb3->phy))
> -		usb3->phy = NULL;
> -
>  	usb3->workaround_for_vbus = priv->workaround_for_vbus;
>  
>  	renesas_usb3_debugfs_init(usb3, &pdev->dev);
> -- 
> 1.9.1
> 
