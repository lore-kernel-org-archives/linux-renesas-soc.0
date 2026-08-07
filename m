Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F8446C1E;
	Fri,  7 Aug 2026 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083805; cv=none; b=tMfNRwJ0fBCRn5xMDPJ+MDhmRrwFU/HcKPCZPaCd86SE0R5ch4iMcUyI+6g2PkdBQYokmDZs8Zjd0gYw/pD3xhG6VyQo6lhUnTyonk3sQE7cdblfx7BjdsUhLNe2XlpmNDfQp5js7fxOvpf9ZsUU+GS3gRPRpZ5iPepVHkc1cs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083805; c=relaxed/simple;
	bh=GNRm1f++EMNxuXtAirdQUNyTJ/usU+c2RAa9LGCco/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aotBK2RUZBU+f8RE2Dl5M9iz3CklNkBpolY53XQ276E36+aZrR8xhOGxePjAiSTKdkU/PJaH5/w5fZr0lrHM1m9rs9l/q3+rmdmjoo0BqdSP8XJ/SlanKsDt9Br3tCx5kpKCz1v1i+/BqNQUn4L89M5Hb2Lex4tPQQuk8exiT8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=BojE0Cvr; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=BojE0Cvr; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=jDCr/odx; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="BojE0Cvr";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="BojE0Cvr";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="jDCr/odx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786083800;
	bh=GNRm1f++EMNxuXtAirdQUNyTJ/usU+c2RAa9LGCco/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BojE0CvrDeLiBD2huyeRDbLH+d94KauyDhVaDVvsJQeBlKhKjpwHHlSqBNXfH/mcG
	 cQOx2y0VW0y1glJFNxqfNo+AN+SfuEZITQIvhIP1qvZdlMDTNNRLQeK8c5ntY4sC+T
	 Uqyjx9Hx/myXZnlavu7SJ8SEXw4MDpCnV5W66TIGeFBXujG3VmnsvPuykDk6e/5pig
	 zoFoDliW48t67jvfP5SUFwFyk5FJmEozYNlFYJofQUluois4oeRs4HZ0nN7WJe2hQn
	 VWiMNcV53ey4TX2Fi9yGho+6jmJn9WWxN+mZJML90cUgCRXlt4suQ0VnGPRxA+yJTU
	 qPjsdRNHuFqNg==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 399CD1AEC4;
	Fri,  7 Aug 2026 08:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786083800;
	bh=GNRm1f++EMNxuXtAirdQUNyTJ/usU+c2RAa9LGCco/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BojE0CvrDeLiBD2huyeRDbLH+d94KauyDhVaDVvsJQeBlKhKjpwHHlSqBNXfH/mcG
	 cQOx2y0VW0y1glJFNxqfNo+AN+SfuEZITQIvhIP1qvZdlMDTNNRLQeK8c5ntY4sC+T
	 Uqyjx9Hx/myXZnlavu7SJ8SEXw4MDpCnV5W66TIGeFBXujG3VmnsvPuykDk6e/5pig
	 zoFoDliW48t67jvfP5SUFwFyk5FJmEozYNlFYJofQUluois4oeRs4HZ0nN7WJe2hQn
	 VWiMNcV53ey4TX2Fi9yGho+6jmJn9WWxN+mZJML90cUgCRXlt4suQ0VnGPRxA+yJTU
	 qPjsdRNHuFqNg==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 0B7911AF48; Fri,  7 Aug 2026 08:23:20 +0200 (CEST)
X-Spam-Level: 
X-Spam-Score: -1.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786083794;
	bh=GNRm1f++EMNxuXtAirdQUNyTJ/usU+c2RAa9LGCco/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jDCr/odxGynnrTMHvXdN1ykZ7/BQt6IBIPQX6vxafI0uifdDsq4uSHaQlq2yX6b7i
	 IRGo8zuTAdT9IUOCui9srZoUCS45F/z2NjHc+PNeDjNtWdFS5VVQP9TGHjZAdT4YWE
	 5KbGiC159zvABZ5+zYRAKMIO/2NNo1QjR4adzUYkTshHNpwlT66rRBBnKV9BCvMB41
	 4e7QIpQ6S4qVY84cX4xBnoHs3sAUSux0H179Gyv78KzptsAzzGXKlaL2HDAL5mcN/X
	 SpjCb1RdRaRSOU42/MB7l3MLbHlNxqjs6lzXSM2/o1qqvQXpXlMKbHArLFDvDuU/r+
	 QrLJduAKBrQVg==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 69B4A1AF43;
	Fri,  7 Aug 2026 08:23:14 +0200 (CEST)
Message-ID: <0ff405b3-31a2-4673-abb1-49293b137249@lysator.liu.se>
Date: Fri, 7 Aug 2026 08:23:13 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 peda@axentia.se, p.zabel@pengutronix.de, ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Ulf Hansson <ulfh@kernel.org>, Josua Mayer <josua@solid-run.com>,
 linux-kernel@vger.kernel.org
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi!

Sorry for the late reply.

On 2026-07-15 12:12, Tommaso Merciai wrote:
> As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> bit of the VBENCTL Control Register. This register is mapped in the
> reset framework. The reset driver expose this register as mux-controller
> and instantiates this driver. The consumer will use the mux API to
> control the VBUS_SEL bit.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v11->v12
>  - No changes, just rebased on top of next-20260714
> 
> v10->v11:
>  - No changes.
> 
> v9->v10:
>  - No changes.
> 
> v8->v9:
>  - Fixed driver comment year (2025 -> 2026)
>  - Switch from devm_regmap_init_mmio() to dev_get_regmap().
>  - Drop unnecessasry include bitops.h, of.h, property.h and
>    drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
>  - Collected PZabel tag.
> 
> v7->v8:
>  - No changes.
> 
> v6->v7:
>  - No changes.
> 
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - Changed file name to rzv2h-usb-vbenctl.c and Fixed
>    Makefile, Kconfig, function names accordingly.
>  - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
>  - Updated commit msg.
> 
> v3->v4:
>  - Removed mux_chip->dev.of_node not needed.
> 
> v2->v3:
>  - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
>    is an internal node.
>  - Fixed auxiliary_device_id name.
>  - Get rdev using from platform_data.
>  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
>    as it is needed.
>  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
> 
> v1->v2:
>  - New patch
> 
>  drivers/mux/Kconfig             | 11 +++++
>  drivers/mux/Makefile            |  2 +
>  drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
> 
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index 6d17dfa25dad..7f334540c189 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -70,6 +70,17 @@ config MUX_MMIO
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-mmio.
>  
> +config MUX_RZV2H_USB_VBENCTL

Do we really need such a long name? Can we skip at least some part
of it, e.g. "USB_"? I see little in this driver that relates to
USB. And then propagate the shorter name to the file name and
various identifiers of course. Please?

> +	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
> +	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
> +	depends on OF

Why OF?

> +	select REGMAP
> +	select AUXILIARY_BUS
> +	default RESET_RZV2H_USB2PHY
> +	help
> +	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
> +	  RZ/V2H SoCs.

All the other drivers have a boilerplate "module paragraph" here:

	  To compile the driver as a module, choose M here: the module will
	  be called mux-<gazonk>.

I see no reason to exclude it here.

> +
>  endmenu
>  
>  endif # MULTIPLEXER
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index 6e9fa47daf56..3bd9b3846835 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
>  mux-adgs1408-objs		:= adgs1408.o
>  mux-gpio-objs			:= gpio.o
>  mux-mmio-objs			:= mmio.o
> +mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
>  
>  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
>  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
>  obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
>  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
>  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> +obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
> diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
> new file mode 100644
> index 000000000000..79197fddbf74
> --- /dev/null
> +++ b/drivers/mux/rzv2h-usb-vbenctl.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/regmap.h>
> +
> +#define RZV2H_VBENCTL		0xf0c
> +
> +struct mux_rzv2h_usb_vbenctl_priv {
> +	struct regmap_field *field;
> +};
> +
> +static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
> +{
> +	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
> +
> +	return regmap_field_write(priv->field, state);
> +}
> +
> +static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
> +	.set = mux_rzv2h_usb_vbenctl_set,
> +};
> +
> +static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
> +				       const struct auxiliary_device_id *id)
> +{
> +	struct mux_rzv2h_usb_vbenctl_priv *priv;
> +	struct device *dev = &adev->dev;
> +	struct mux_chip *mux_chip;
> +	struct regmap *regmap;
> +	struct reg_field reg_field = {
> +		.reg = RZV2H_VBENCTL,
> +		.lsb = 0,
> +		.msb = 0,
> +	};

Perhaps

	struct reg_field reg_field = REG_FIELD(RZV2H_VBENCTL, 0, 0);

> +	int ret;
> +
> +	regmap = dev_get_regmap(adev->dev.parent, NULL);

Perhaps

	regmap = dev_get_regmap(dev->parent, NULL);

> +	if (!regmap)
> +		return -ENODEV;
> +
> +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	priv = mux_chip_priv(mux_chip);
> +
> +	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
> +	if (IS_ERR(priv->field))
> +		return PTR_ERR(priv->field);
> +
> +	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
> +	mux_chip->mux[0].states = 2;
> +	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
> +
> +	ret = devm_mux_chip_register(dev, mux_chip);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
> +
> +	return 0;
> +}
> +
> +static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
> +	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
> +
> +static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
> +	.name		= "vbenctl",
> +	.probe		= mux_rzv2h_usb_vbenctl_probe,
> +	.id_table	= mux_rzv2h_usb_vbenctl_ids,
> +};
> +module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
> +

I'm not previously familiar with the auxiliary bus. When I read about
it I find this:

	"A key requirement for utilizing the auxiliary bus is that
	there is no dependency on a physical bus, device, register
	accesses or regmap support."

That seems to contradict this driver with its dependency on regmap,
thus violating the above key requirement?

Cheers,
Peter

> +MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
> +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> +MODULE_LICENSE("GPL");

