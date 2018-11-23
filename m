Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37008 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387556AbeKWSif (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 13:38:35 -0500
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: follow the hardware manual
 procedure
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <f9a22d1d-6b40-0182-0be2-976494c95063@ti.com>
Date: Fri, 23 Nov 2018 13:25:19 +0530
MIME-Version: 1.0
In-Reply-To: <1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 21/11/18 1:40 PM, Yoshihiro Shimoda wrote:
> This patch modifies rcar_gen3_init_otg() procedure to follow Figure
> 73.4 of "R-Car Series, 3rd Generation User's Manual: Hardware Rev.1.00".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the latest linux-phy / next branch
> (commit id = 0eb86fa77f0f0c81631a030f10679a45c05df33a).

This patch has some weird characters which I saw while applying.

You can see "=20", =3D in the raw format
https://lore.kernel.org/lkml/1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/raw

Please fix and repost the patch.

Thanks
Kishon
> 
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index d0f412c..a9e53e8 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -307,16 +307,21 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
>  	void __iomem *usb2_base = ch->base;
>  	u32 val;
>  
> +	rcar_gen3_set_linectrl(ch, 0, 1);
> +	val = readl(usb2_base + USB2_LINECTRL1);
> +	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
> +	       usb2_base + USB2_LINECTRL1);
> +
>  	val = readl(usb2_base + USB2_VBCTRL);
>  	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
> -	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
> -	rcar_gen3_control_otg_irq(ch, 1);
>  	val = readl(usb2_base + USB2_ADPCTRL);
>  	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
> -	val = readl(usb2_base + USB2_LINECTRL1);
> -	rcar_gen3_set_linectrl(ch, 0, 0);
> -	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
> -	       usb2_base + USB2_LINECTRL1);
> +
> +	msleep(20);
> +
> +	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
> +
> +	rcar_gen3_control_otg_irq(ch, 1);
>  
>  	rcar_gen3_device_recognition(ch);
>  }
> 
