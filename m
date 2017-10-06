Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 6 Oct 2017 11:14:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] phy: rcar-gen3-usb2: add SoC-specific parameter
 for dedicated pins
Message-ID: <20171006091425.GB7734@verge.net.au>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504233685-17947-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504233685-17947-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 01, 2017 at 11:41:24AM +0900, Yoshihiro Shimoda wrote:
> This patch adds SoC-specific parameter to avoid reading/writing
> specific registers wrongly if this driver runs on a SoC which doesn't
> have dedicated pins (e.g. R-Car D3).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 4ea9902..15e095e 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -80,6 +81,8 @@
>  #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
>  #define USB2_ADPCTRL_DRVVBUS		BIT(4)
>  
> +#define RCAR_GEN3_PHY_HAS_DEDICATED_PINS	1
> +
>  struct rcar_gen3_chan {
>  	void __iomem *base;
>  	struct extcon_dev *extcon;
> @@ -400,9 +403,17 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
>  }
>  
>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
> -	{ .compatible = "renesas,usb2-phy-r8a7795" },
> -	{ .compatible = "renesas,usb2-phy-r8a7796" },
> -	{ .compatible = "renesas,rcar-gen3-usb2-phy" },
> +	{
> +		.compatible = "renesas,usb2-phy-r8a7795",
> +		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
> +	},
> +	{
> +		.compatible = "renesas,usb2-phy-r8a7796",
> +		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
> +	},
> +	{
> +		.compatible = "renesas,rcar-gen3-usb2-phy",
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
> @@ -446,9 +457,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	}
>  
>  	if (of_usb_get_dr_mode_by_phy(dev->of_node, 0) == USB_DR_MODE_OTG) {
> -		int ret;
> +		int ret, dedicated_pins;
> +		const struct of_device_id *of_id =
> +			of_match_device(rcar_gen3_phy_usb2_match_table, dev);
>  
> -		channel->has_otg = true;
> +		dedicated_pins = of_id ? (uintptr_t)of_id->data : 0;

Nit: I think you could use of_device_get_match_data() here.

> +		channel->has_otg = !!dedicated_pins;
>  		channel->can_role_swap = true;
>  		channel->extcon = devm_extcon_dev_allocate(dev,
>  							rcar_gen3_phy_cable);
> -- 
> 1.9.1
> 
