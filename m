Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33874 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753508AbeCTM7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 08:59:02 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: architt@codeaurora.org, a.hajda@samsung.com, airlied@linux.ie,
        horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] drm: bridge: Add thc63lvd1024 LVDS decoder driver
Date: Tue, 20 Mar 2018 15:00:06 +0200
Message-ID: <2013431.yq1szSm9OZ@avalon>
In-Reply-To: <1521213399-31947-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1521213399-31947-1-git-send-email-jacopo+renesas@jmondi.org> <1521213399-31947-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Friday, 16 March 2018 17:16:38 EET Jacopo Mondi wrote:
> Add DRM bridge driver for Thine THC63LVD1024 LVDS to digital parallel
> output converter.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/gpu/drm/bridge/Kconfig        |   6 +
>  drivers/gpu/drm/bridge/Makefile       |   1 +
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 255 ++++++++++++++++++++++++++++=
+++
>  3 files changed, 262 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/thc63lvd1024.c

I'm aware that you started with a generic driver and then moved to a chip-
specific driver and that it caused issues. I however believe it was a good=
=20
design, but we can make the driver generic later when a second similar chip=
=20
will need to be supported.

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 3b99d5a..5815a20 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -92,6 +92,12 @@ config DRM_SII9234
>  	  It is an I2C driver, that detects connection of MHL bridge
>  	  and starts encapsulation of HDMI signal.
>=20
> +config DRM_THINE_THC63LVD1024
> +	tristate "Thine THC63LVD1024 LVDS decoder bridge"
> +	depends on OF
> +	---help---
> +	  Thine THC63LVD1024 LVDS/parallel converter driver.
> +
>  config DRM_TOSHIBA_TC358767
>  	tristate "Toshiba TC358767 eDP bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile
> b/drivers/gpu/drm/bridge/Makefile index 373eb28..fd90b16 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PARADE_PS8622) +=3D parade-ps8622.o
>  obj-$(CONFIG_DRM_SIL_SII8620) +=3D sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) +=3D sii902x.o
>  obj-$(CONFIG_DRM_SII9234) +=3D sii9234.o
> +obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358767) +=3D tc358767.o
>  obj-$(CONFIG_DRM_ANALOGIX_DP) +=3D analogix/
>  obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c
> b/drivers/gpu/drm/bridge/thc63lvd1024.c new file mode 100644
> index 0000000..02a54c2
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * THC63LVD1024 LVDS to parallel data DRM bridge driver.
> + *
> + * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +enum {

Please name the enumeration.

> +	THC63_LVDS_IN0,
> +	THC63_LVDS_IN1,
> +	THC63_DIGITAL_OUT0,
> +	THC63_DIGITAL_OUT1,

Strictly speaking LVDS is digital too. Maybe THC63_RGB_OUT* ?

> +};
> +
> +static const char * const thc63_reg_names[] =3D {
> +	"vcc", "lvcc", "pvcc", "cvcc",
> +};
> +
> +struct thc63_dev {
> +	struct device *dev;
> +
> +	struct regulator *vccs[ARRAY_SIZE(thc63_reg_names)];
> +
> +	struct gpio_desc *pdwn;
> +	struct gpio_desc *oe;
> +
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next;
> +};
> +
> +static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct thc63_dev, bridge);
> +}
> +
> +static int thc63_attach(struct drm_bridge *bridge)
> +{
> +	struct thc63_dev *thc63 =3D to_thc63(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, thc63->next, bridge);
> +}
> +
> +static void thc63_enable(struct drm_bridge *bridge)
> +{
> +	struct thc63_dev *thc63 =3D to_thc63(bridge);
> +	struct regulator *vcc;
> +	int i;
> +=20
> +	for (i =3D 0; i < ARRAY_SIZE(thc63->vccs); i++) {
> +		vcc =3D thc63->vccs[i];
> +		if (!vcc)
> +			continue;
> +
> +		if (regulator_enable(vcc))

You can operate on thc63->vccs[i] directly without a local variable, here a=
nd=20
below in the functions that handle regulators.

> +			goto error_vcc_enable;
> +	}

I thought about proposing usage of the regulators bulk API but it doesn't=20
support optional regulators :-( If you agree with my proposal to make all=20
regulators mandatory, please consider the bulk API to simplify power supply=
=20
handling. If on the other hand you agree with my proposal to keep the vcc=20
supply only, it won't matter.

> +	if (thc63->pdwn)
> +		gpiod_set_value(thc63->pdwn, 0);
> +
> +	if (thc63->oe)
> +		gpiod_set_value(thc63->oe, 1);
> +
> +	return;
> +
> +error_vcc_enable:
> +	dev_err(thc63->dev, "Failed to enable regulator %s\n",
> +		thc63_reg_names[i]);

I'd move the error message right before the goto.

> +	for (i =3D i - 1; i >=3D 0; i--) {
> +		vcc =3D thc63->vccs[i];
> +		if (!vcc)
> +			continue;
> +
> +		regulator_disable(vcc);
> +	}
> +}
> +
> +static void thc63_disable(struct drm_bridge *bridge)
> +{
> +	struct thc63_dev *thc63 =3D to_thc63(bridge);
> +	struct regulator *vcc;
> +	int i;
> +
> +	if (thc63->oe)
> +		gpiod_set_value(thc63->oe, 0);
> +
> +	if (thc63->pdwn)
> +		gpiod_set_value(thc63->pdwn, 1);
> +
> +	for (i =3D ARRAY_SIZE(thc63->vccs) - 1; i >=3D 0; i--) {
> +		vcc =3D thc63->vccs[i];
> +		if (!vcc)
> +			continue;
> +
> +		if (regulator_disable(vcc))
> +			dev_dbg(thc63->dev,
> +				"Failed to disable regulator %s\n",
> +				thc63_reg_names[i]);
> +	}
> +}
> +
> +struct drm_bridge_funcs thc63_bridge_func =3D {

static const

> +	.attach	=3D thc63_attach,
> +	.enable =3D thc63_enable,
> +	.disable =3D thc63_disable,
> +};
> +
> +static int thc63_parse_dt(struct thc63_dev *thc63)
> +{
> +	struct device_node *thc63_out;
> +	struct device_node *remote;
> +	int ret =3D 0;
> +
> +	thc63_out =3D of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						  THC63_DIGITAL_OUT0, -1);
> +	if (!thc63_out) {
> +		dev_err(thc63->dev, "Missing endpoint in Port@%u\n",
> +			THC63_DIGITAL_OUT0);
> +		return -ENODEV;
> +	}
> +
> +	remote =3D of_graph_get_remote_port_parent(thc63_out);

	of_node_put(thc63_out);

here, it will simplify error handling.

> +	if (!remote) {
> +		dev_err(thc63->dev, "Endpoint in Port@%u unconnected\n",
> +			THC63_DIGITAL_OUT0);
> +		ret =3D -ENODEV;
> +		goto error_put_out_node;
> +	}
> +
> +	if (!of_device_is_available(remote)) {
> +		dev_err(thc63->dev, "Port@%u remote endpoint is disabled\n",
> +			THC63_DIGITAL_OUT0);
> +		ret =3D -ENODEV;
> +		goto error_put_remote_node;
> +	}
> +
> +	thc63->next =3D of_drm_find_bridge(remote);
> +	if (!thc63->next)
> +		ret =3D -EPROBE_DEFER;

You can add a return 0 here (and a goto in the previous check. Going throug=
h=20
error labels in the non-error case is confusing. As a result you can avoid=
=20
initializing ret to 0.

> +error_put_remote_node:
> +	of_node_put(remote);
> +error_put_out_node:
> +	of_node_put(thc63_out);
> +
> +	return ret;
> +}
> +
> +static int thc63_gpio_init(struct thc63_dev *thc63)
> +{
> +	thc63->oe =3D devm_gpiod_get_optional(thc63->dev, "oe", GPIOD_OUT_LOW);
> +	if (IS_ERR(thc63->oe)) {
> +		dev_err(thc63->dev, "Unable to get \"oe-gpios\"\n");

You can add the error code to the message, it could be helpful.

> +		return PTR_ERR(thc63->oe);
> +	}
> +
> +	thc63->pdwn =3D devm_gpiod_get_optional(thc63->dev, "pdwn",
> +					      GPIOD_OUT_HIGH);
> +	if (IS_ERR(thc63->pdwn)) {
> +		dev_err(thc63->dev, "Unable to get \"pdwn-gpios\"\n");

Same here.

> +		return PTR_ERR(thc63->pdwn);
> +	}
> +
> +	return 0;
> +}
> +
> +static int thc63_regulator_init(struct thc63_dev *thc63)
> +{
> +	struct regulator **reg;
> +	int i;

i is never negative, you can make it an unsigned int.

> +	reg =3D &thc63->vccs[0];
> +	for (i =3D 0; i < ARRAY_SIZE(thc63->vccs); i++, reg++) {
> +		*reg =3D devm_regulator_get_optional(thc63->dev,
> +						   thc63_reg_names[i]);
> +		if (IS_ERR(*reg)) {
> +			if (PTR_ERR(*reg) =3D=3D -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			*reg =3D NULL;
> +		}
> +	}

Wouldn't the following be simpler ?

	for (i =3D 0; i < ARRAY_SIZE(thc63->vccs); i++) {
		struct regulator *reg;

		reg =3D devm_regulator_get_optional(thc63->dev,
						   thc63_reg_names[i]);
		if (IS_ERR(reg)) {
			if (PTR_ERR(reg) =3D=3D -EPROBE_DEFER)
				return -EPROBE_DEFER;
			reg =3D NULL;
		}

		thc63->vccs[i] =3D reg;
	}

> +	return 0;
> +}
> +
> +static int thc63_probe(struct platform_device *pdev)
> +{
> +	struct thc63_dev *thc63;
> +	int ret;
> +
> +	thc63 =3D devm_kzalloc(&pdev->dev, sizeof(*thc63), GFP_KERNEL);
> +	if (!thc63)
> +		return -ENOMEM;
> +
> +	thc63->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, thc63);
> +
> +	ret =3D thc63_regulator_init(thc63);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D thc63_gpio_init(thc63);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D thc63_parse_dt(thc63);
> +	if (ret)
> +		return ret;
> +
> +	thc63->bridge.driver_private =3D thc63;
> +	thc63->bridge.of_node =3D pdev->dev.of_node;
> +	thc63->bridge.funcs =3D &thc63_bridge_func;
> +
> +	drm_bridge_add(&thc63->bridge);
> +
> +	return 0;
> +}
> +
> +static int thc63_remove(struct platform_device *pdev)
> +{
> +	struct thc63_dev *thc63 =3D platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&thc63->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id thc63_match[] =3D {
> +	{ .compatible =3D "thine,thc63lvd1024", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, thc63_match);
> +
> +static struct platform_driver thc63_driver =3D {
> +	.probe	=3D thc63_probe,
> +	.remove	=3D thc63_remove,
> +	.driver	=3D {
> +		.name		=3D "thc63lvd1024",
> +		.of_match_table	=3D thc63_match,
> +	},
> +};
> +module_platform_driver(thc63_driver);
> +
> +MODULE_AUTHOR("Jacopo Mondi <jacopo@jmondi.org>");
> +MODULE_DESCRIPTION("Thine THC63LVD1024 LVDS decoder DRM bridge driver");
> +MODULE_LICENSE("GPL v2");

=2D-=20
Regards,

Laurent Pinchart
