Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60764 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbeKZUcw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 15:32:52 -0500
Date: Mon, 26 Nov 2018 10:39:16 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "kishon@ti.com" <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: follow the hardware manual
 procedure
Message-ID: <20181126093911.npr3ktohqciuq5my@verge.net.au>
References: <1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 21, 2018 at 08:10:06AM +0000, Yoshihiro Shimoda wrote:
> This patch modifies rcar_gen3_init_otg() procedure to follow Figure
> 73.4 of "R-Car Series, 3rd Generation User's Manual: Hardware Rev.1.00".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the latest linux-phy / next branch
> (commit id = 0eb86fa77f0f0c81631a030f10679a45c05df33a).
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

I am wondering if as well as the above
USB2_LINECTRL1_DPRPD_EN should be set and
USB2_LINECTRL1_DP_RPD should be cleared.

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

I wonder if it is appropriate to write 0xffffffff to USB2_OBINTSTA 
and then USB2_OBINT_BITS to USB2_OBINTEN here.

> +
> +	rcar_gen3_control_otg_irq(ch, 1);
>  
>  	rcar_gen3_device_recognition(ch);
>  }
> -- 
> 1.9.1
> 
