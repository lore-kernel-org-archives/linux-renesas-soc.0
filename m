Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:34458 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751355AbcFXGgM convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 24 Jun 2016 02:36:12 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>,
	"linux-kernel@lists.codethink.co.uk"
	<linux-kernel@lists.codethink.co.uk>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] usb: renesas_usbhs: make usbhs_write32() static
Date: Fri, 24 Jun 2016 06:36:07 +0000
Message-ID: <SG2PR06MB091976885A718A8F89EC1AE9D82E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1466531574-3096-1-git-send-email-ben.dooks@codethink.co.uk>
In-Reply-To: <1466531574-3096-1-git-send-email-ben.dooks@codethink.co.uk>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Ben Dooks
> Sent: Wednesday, June 22, 2016 2:53 AM
> 
> The usbhs_write32 function is not used outside of the rcar3.c
> file, so fix the following sparse warning by making it static:
> 
> drivers/usb/renesas_usbhs/rcar3.c:26:6: warning: symbol 'usbhs_write32' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Thank you for the patch.

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/usb/renesas_usbhs/rcar3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
> index 38b01f2..1d70add 100644
> --- a/drivers/usb/renesas_usbhs/rcar3.c
> +++ b/drivers/usb/renesas_usbhs/rcar3.c
> @@ -23,7 +23,7 @@
>  #define UGCTRL2_RESERVED_3	0x00000001	/* bit[3:0] should be B'0001 */
>  #define UGCTRL2_USB0SEL_OTG	0x00000030
> 
> -void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
> +static void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
>  {
>  	iowrite32(data, priv->base + reg);
>  }
> --
> 2.8.1
