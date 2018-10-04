Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45653 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbeJDQe5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 12:34:57 -0400
Date: Thu, 4 Oct 2018 11:42:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: Fix b-device mode for
 "workaround"
Message-ID: <20181004094226.t2vymsup77s7kbmu@verge.net.au>
References: <1538481464-24766-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538481464-24766-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 02, 2018 at 08:57:44PM +0900, Yoshihiro Shimoda wrote:
> If the "workaround_for_vbus" is true, the driver will not call
> usb_disconnect(). So, since the controller keeps some registers'
> value, the driver doesn't re-enumarate suitable speed after
> the b-device mode is disabled. To fix the issue, this patch
> adds usb_disconnect() calling in renesas_usb3_b_device_write()
> if workaround_for_vbus is true.
> 
> Fixes: 43ba968b00ea ("usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode")
> Cc: <stable@vger.kernel.org> # v4.14+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index e1656f3..67d8a50 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2437,6 +2437,9 @@ static ssize_t renesas_usb3_b_device_write(struct file *file,
>  	else
>  		usb3->forced_b_device = false;
>  
> +	if (usb3->workaround_for_vbus)
> +		usb3_disconnect(usb3);
> +
>  	/* Let this driver call usb3_connect() anyway */
>  	usb3_check_id(usb3);
>  
> -- 
> 1.9.1
> 
