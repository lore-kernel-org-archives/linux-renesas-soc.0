Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38240 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751778AbeDJJe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 05:34:29 -0400
Date: Tue, 10 Apr 2018 11:34:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 6/6] usb: gadget: udc: renesas_usb3: disable the
 controller's irqs for reconnecting
Message-ID: <20180410093424.ddumstqnsi4q3z6l@verge.net.au>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523338734-20474-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523338734-20474-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 10, 2018 at 02:38:54PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that reconnection is possible to fail
> because unexpected state handling happens by the irqs. To fix the issue,
> the driver disables the controller's irqs when disconnected.
> 
> Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
> Cc: <stable@vger.kernel.org> # v4.5+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Remarks:
>  - A new file in v2
> 
>  drivers/usb/gadget/udc/renesas_usb3.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index 0e70163..5caf78b 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -623,6 +623,13 @@ static void usb3_disconnect(struct renesas_usb3 *usb3)
>  	usb3_usb2_pullup(usb3, 0);
>  	usb3_clear_bit(usb3, USB30_CON_B3_CONNECT, USB3_USB30_CON);
>  	usb3_reset_epc(usb3);
> +	usb3_disable_irq_1(usb3, USB_INT_1_B2_RSUM | USB_INT_1_B3_PLLWKUP |
> +			   USB_INT_1_B3_LUPSUCS | USB_INT_1_B3_DISABLE |
> +			   USB_INT_1_SPEED | USB_INT_1_B3_WRMRST |
> +			   USB_INT_1_B3_HOTRST | USB_INT_1_B2_SPND |
> +			   USB_INT_1_B2_L1SPND | USB_INT_1_B2_USBRST);
> +	usb3_clear_bit(usb3, USB_COM_CON_SPD_MODE, USB3_USB_COM_CON);
> +	usb3_init_epc_registers(usb3);
>  
>  	if (usb3->driver)
>  		usb3->driver->disconnect(&usb3->gadget);
> -- 
> 1.9.1
> 
