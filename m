Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:44434 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbeGPLfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 07:35:41 -0400
MIME-Version: 1.0
In-Reply-To: <1530614818-7634-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1530614818-7634-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Mon, 16 Jul 2018 13:08:46 +0200
Message-ID: <CAO3366yejRNmhzOHpuzwDhdLG_hRynT4tsAciDJuQ8Dz9MkXFg@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: host: xhci-rcar: Add a condition check about PLL active
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 3, 2018 at 12:46 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds a condition check about the PLL acvice of this
> controller. Otherwise, the controller might cause hang when
> any USB clocks are not supplied yet and accesses the xHCI registers.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/host/xhci-rcar.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index 4a22f25..a6e4637 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -29,6 +29,7 @@
>  MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
>
>  /*** Register Offset ***/
> +#define RCAR_USB3_AXH_STA      0x104   /* AXI Host Control Status */
>  #define RCAR_USB3_INT_ENA      0x224   /* Interrupt Enable */
>  #define RCAR_USB3_DL_CTRL      0x250   /* FW Download Control & Status */
>  #define RCAR_USB3_FW_DATA0     0x258   /* FW Data0 */
> @@ -41,6 +42,12 @@
>  #define RCAR_USB3_TX_POL       0xab8   /* USB3.0 TX Polarity */
>
>  /*** Register Settings ***/
> +/* AXI Host Control Status */
> +#define RCAR_USB3_AXH_STA_B3_PLL_ACTIVE                0x00010000
> +#define RCAR_USB3_AXH_STA_B2_PLL_ACTIVE                0x00000001

Maybe use BIT() here?

> +#define RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK (RCAR_USB3_AXH_STA_B3_PLL_ACTIVE | \
> +                                          RCAR_USB3_AXH_STA_B2_PLL_ACTIVE)
> +
>  /* Interrupt Enable */
>  #define RCAR_USB3_INT_XHC_ENA  0x00000001
>  #define RCAR_USB3_INT_PME_ENA  0x00000002
> @@ -200,6 +207,22 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>         return retval;
>  }
>
> +static bool xhci_rcar_wait_for_pll_active(struct usb_hcd *hcd)
> +{
> +       int timeout = 1000;
> +       u32 val, mask = RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK;
> +
> +       while (timeout > 0) {
> +               val = readl(hcd->regs + RCAR_USB3_AXH_STA);
> +               if ((val & mask) == mask)
> +                       return true;
> +               udelay(1);
> +               timeout--;
> +       }
> +
> +       return false;
> +}
> +
>  /* This function needs to initialize a "phy" of usb before */
>  int xhci_rcar_init_quirk(struct usb_hcd *hcd)
>  {
> @@ -220,6 +243,9 @@ int xhci_rcar_init_quirk(struct usb_hcd *hcd)
>                         xhci_rcar_is_gen3(hcd->self.controller))
>                 xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
>
> +       if (!xhci_rcar_wait_for_pll_active(hcd))
> +               return -ETIMEDOUT;
> +
>         return xhci_rcar_download_firmware(hcd);
>  }
>
> --
> 1.9.1
>

Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

CU
Uli
