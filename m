Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] phy: rcar-gen3-usb2: fix implementation for runtime PM
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, kishon@ti.com
References: <1489386258-31279-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5006ac8a-b989-fb74-77ee-d7f023c1d20f@cogentembedded.com>
Date: Mon, 13 Mar 2017 12:04:25 +0300
MIME-Version: 1.0
In-Reply-To: <1489386258-31279-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 3/13/2017 9:24 AM, Yoshihiro Shimoda wrote:

> This patch fixes an issue that this driver doesn't take care of the runtime
> PM. This code assumed that devm_phy_create() called pm_runtime_enable(dev),
> but it misunderstood the dev_phy_create()'s specification.
> This driver should call the own pm_runtime_pm() before dev_phy_create().

    Its own?

> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/phy-rcar-gen3-usb2.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
> index afb4d04..23c4e86 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
[...]
> @@ -454,15 +462,22 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(provider)) {
>  		dev_err(dev, "Failed to register PHY provider\n");
> +		ret = PTR_ERR(provider);
> +		goto error;
>  	} else if (channel->has_otg) {
>  		int ret;
>
>  		ret = device_create_file(dev, &dev_attr_role);
>  		if (ret < 0)
> -			return ret;
> +			goto error;
>  	}
>
>  	return PTR_ERR_OR_ZERO(provider);

    Here 'provider' can no longer contain error -- *return* 0 seems to fit better.

> +
> +error:
> +	pm_runtime_disable(dev);
> +
> +	return ret;
>  }
>
>  static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
[...]

MBR, Sergei
