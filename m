Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35989 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751197AbcFAG0y convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 02:26:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: host: xhci: rcar: fix the quirks setting of
 XHCI_NO_64BIT_SUPPORT
Date: Wed, 1 Jun 2016 06:26:47 +0000
Message-ID: <SG2PR06MB091960B5B2B52861270605E9D8470@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464748806-7932-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1464748806-7932-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1464748806-7932-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> From: Yoshihiro Shimoda
> Sent: Wednesday, June 01, 2016 11:40 AM
> 
> Since the commit b1c127ae (usb: host: xhci: plat: make use of new methods
> in xhci_plat_priv) changed the setting timing of xhci->quirks to

Oops, checkpatch.pl said this message should be revised.
So, I will submit v2 patch later.

Best regards,
Yoshihiro Shimoda

> So, this patch fixes the issue using a "quirks" of struct xhci_plat_priv.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/host/xhci-plat.c | 12 +++++++++++-
>  drivers/usb/host/xhci-plat.h |  1 +
>  drivers/usb/host/xhci-rcar.c | 21 ---------------------
>  3 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 676ea45..7f03608 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -57,12 +57,14 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
> 
>  static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
>  {
> +	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
> +
>  	/*
>  	 * As of now platform drivers don't provide MSI support so we ensure
>  	 * here that the generic code does not try to make a pci_dev from our
>  	 * dev struct in order to setup MSI
>  	 */
> -	xhci->quirks |= XHCI_PLAT;
> +	xhci->quirks |= XHCI_PLAT | priv->quirks;
>  }
> 
>  /* called during probe() after chip reset completes */
> @@ -89,16 +91,24 @@ static const struct xhci_plat_priv xhci_plat_marvell_armada = {
>  	.init_quirk = xhci_mvebu_mbus_init_quirk,
>  };
> 
> +/*
> + * On R-Car Gen2 and Gen3, the AC64 bit (bit 0) of HCCPARAMS1 is set to 1.
> + * However, these SoCs don't support 64-bit address memory pointers. So, this
> + * driver clears the AC64 bit of xhci->hcc_params to call
> + * dma_set_coherent_mask(dev, DMA_BIT_MASK(32)) in xhci_gen_setup().
> + */
>  static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
>  	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
>  	.init_quirk = xhci_rcar_init_quirk,
>  	.plat_start = xhci_rcar_start,
> +	.quirks = XHCI_NO_64BIT_SUPPORT,
>  };
> 
>  static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
>  	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V2,
>  	.init_quirk = xhci_rcar_init_quirk,
>  	.plat_start = xhci_rcar_start,
> +	.quirks = XHCI_NO_64BIT_SUPPORT,
>  };
> 
>  static const struct of_device_id usb_xhci_of_match[] = {
> diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
> index c652f33..15144c9 100644
> --- a/drivers/usb/host/xhci-plat.h
> +++ b/drivers/usb/host/xhci-plat.h
> @@ -20,5 +20,6 @@ struct xhci_plat_priv {
>  	unsigned int quirks;
>  };
> 
> +#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
>  #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
>  #endif	/* _XHCI_PLAT_H */
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index 0e4535e..2617cd7 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -87,14 +87,6 @@ static int xhci_rcar_is_gen2(struct device *dev)
>  		of_device_is_compatible(node, "renensas,rcar-gen2-xhci");
>  }
> 
> -static int xhci_rcar_is_gen3(struct device *dev)
> -{
> -	struct device_node *node = dev->of_node;
> -
> -	return of_device_is_compatible(node, "renesas,xhci-r8a7795") ||
> -		of_device_is_compatible(node, "renesas,rcar-gen3-xhci");
> -}
> -
>  void xhci_rcar_start(struct usb_hcd *hcd)
>  {
>  	u32 temp;
> @@ -175,22 +167,9 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  /* This function needs to initialize a "phy" of usb before */
>  int xhci_rcar_init_quirk(struct usb_hcd *hcd)
>  {
> -	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> -
>  	/* If hcd->regs is NULL, we don't just call the following function */
>  	if (!hcd->regs)
>  		return 0;
> 
> -	/*
> -	 * On R-Car Gen2 and Gen3, the AC64 bit (bit 0) of HCCPARAMS1 is set
> -	 * to 1. However, these SoCs don't support 64-bit address memory
> -	 * pointers. So, this driver clears the AC64 bit of xhci->hcc_params
> -	 * to call dma_set_coherent_mask(dev, DMA_BIT_MASK(32)) in
> -	 * xhci_gen_setup().
> -	 */
> -	if (xhci_rcar_is_gen2(hcd->self.controller) ||
> -			xhci_rcar_is_gen3(hcd->self.controller))
> -		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> -
>  	return xhci_rcar_download_firmware(hcd);
>  }
> --
> 1.9.1
