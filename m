Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] phy: rcar-gen3-usb2: fix implementation for runtime PM
Date: Tue, 4 Apr 2017 11:36:34 +0000
Message-ID: <PS1PR06MB1692D44568A686A74DC7573AD80B0@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1489448261-4477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489448261-4477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kishon,

> From: Yoshihiro Shimoda, Sent: Tuesday, March 14, 2017 8:38 AM
>=20
> This patch fixes an issue that this driver doesn't take care of the runti=
me
> PM. This code assumed that devm_phy_create() called pm_runtime_enable(dev=
),
> but it misunderstood the dev_phy_create()'s specification.
> This driver should call its own pm_runtime_enable() before dev_phy_create=
().
>=20
> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver=
")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v2:
>   - revise the commit log (s/pm_runtime_pm/pm_runtime_enable)
>=20
>  Changes from v1:
>   - revise the commit log (s/the own/its own/)
>   - simplify return code in probe().

I'm afraid but would you review this patch?

Best regards,
Yoshihiro Shimoda

>  drivers/phy/phy-rcar-gen3-usb2.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3=
-usb2.c
> index afb4d04..54c3429 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_address.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/workqueue.h>
>=20
> @@ -395,7 +396,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	struct rcar_gen3_chan *channel;
>  	struct phy_provider *provider;
>  	struct resource *res;
> -	int irq;
> +	int irq, ret =3D 0;
>=20
>  	if (!dev->of_node) {
>  		dev_err(dev, "This driver needs device tree\n");
> @@ -434,17 +435,24 @@ static int rcar_gen3_phy_usb2_probe(struct platform=
_device *pdev)
>  		}
>  	}
>=20
> -	/* devm_phy_create() will call pm_runtime_enable(dev); */
> +	/*
> +	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
> +	 * And then, phy-core will manage runtime pm for this device.
> +	 */
> +	pm_runtime_enable(dev);
>  	channel->phy =3D devm_phy_create(dev, NULL, &rcar_gen3_phy_usb2_ops);
>  	if (IS_ERR(channel->phy)) {
>  		dev_err(dev, "Failed to create USB2 PHY\n");
> -		return PTR_ERR(channel->phy);
> +		ret =3D PTR_ERR(channel->phy);
> +		goto error;
>  	}
>=20
>  	channel->vbus =3D devm_regulator_get_optional(dev, "vbus");
>  	if (IS_ERR(channel->vbus)) {
> -		if (PTR_ERR(channel->vbus) =3D=3D -EPROBE_DEFER)
> -			return PTR_ERR(channel->vbus);
> +		if (PTR_ERR(channel->vbus) =3D=3D -EPROBE_DEFER) {
> +			ret =3D PTR_ERR(channel->vbus);
> +			goto error;
> +		}
>  		channel->vbus =3D NULL;
>  	}
>=20
> @@ -454,15 +462,22 @@ static int rcar_gen3_phy_usb2_probe(struct platform=
_device *pdev)
>  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(provider)) {
>  		dev_err(dev, "Failed to register PHY provider\n");
> +		ret =3D PTR_ERR(provider);
> +		goto error;
>  	} else if (channel->has_otg) {
>  		int ret;
>=20
>  		ret =3D device_create_file(dev, &dev_attr_role);
>  		if (ret < 0)
> -			return ret;
> +			goto error;
>  	}
>=20
> -	return PTR_ERR_OR_ZERO(provider);
> +	return 0;
> +
> +error:
> +	pm_runtime_disable(dev);
> +
> +	return ret;
>  }
>=20
>  static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
> @@ -472,6 +487,8 @@ static int rcar_gen3_phy_usb2_remove(struct platform_=
device *pdev)
>  	if (channel->has_otg)
>  		device_remove_file(&pdev->dev, &dev_attr_role);
>=20
> +	pm_runtime_disable(&pdev->dev);
> +
>  	return 0;
>  };
>=20
> --
> 1.9.1
