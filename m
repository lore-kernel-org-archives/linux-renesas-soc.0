Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail1.bemta25.messagelabs.com ([195.245.230.129]:5495 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S969636AbeEXMDP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 08:03:15 -0400
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Marek Vasut <marek.vasut@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/6] mfd: da9063: Rename PMIC_DA9063 to
 PMIC_CHIP_ID_DA9063
Date: Thu, 24 May 2018 12:03:12 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB701941A482F@SW-EX-MBX02.diasemi.com>
References: <20180523114230.10109-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180523114230.10109-1-marek.vasut+renesas@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On 23 May 2018 12:42 Marek Vasut wrote:

> To: linux-kernel@vger.kernel.org
> Cc: Marek Vasut <marek.vasut+renesas@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>; Lee Jones <lee.jones@linaro.org>; Mark Brown <broonie@kernel.org>; Steve Twiss <stwiss.opensource@diasemi.com>; Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH 1/6] mfd: da9063: Rename PMIC_DA9063 to PMIC_CHIP_ID_DA9063
>
> The PMIC_DA9063 is a complete misnomer, it denotes the value of the
> DA9063 chip ID register, so rename it as such. It is also the value of chip ID register of DA9063L though, so drop the enum as all the
> DA9063 "models" share the same chip ID and thus the distinction will have to be made using DT or otherwise.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/mfd/da9063-core.c            | 2 +-
>  drivers/mfd/da9063-i2c.c             | 2 +-
>  drivers/regulator/da9063-regulator.c | 2 +-
>  include/linux/mfd/da9063/core.h      | 4 +---
>  4 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c index 6c2870d4e754..00b3caee4e21 100644
> --- a/drivers/mfd/da9063-core.c
> +++ b/drivers/mfd/da9063-core.c
> @@ -192,7 +192,7 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
>  		dev_err(da9063->dev, "Cannot read chip model id.\n");
>  		return -EIO;
>  	}
> -	if (model != PMIC_DA9063) {
> +	if (model != PMIC_CHIP_ID_DA9063) {
>  		dev_err(da9063->dev, "Invalid chip model id: 0x%02x\n", model);
>  		return -ENODEV;
>  	}
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c index 981805a2c521..7f84030c8d53 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -280,7 +280,7 @@ static int da9063_i2c_remove(struct i2c_client *i2c)  }
>  
>  static const struct i2c_device_id da9063_i2c_id[] = {
> -	{"da9063", PMIC_DA9063},
> +	{ "da9063", PMIC_CHIP_ID_DA9063 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, da9063_i2c_id); diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
> index 6a8f9cd69f52..87c884ae0064 100644
> --- a/drivers/regulator/da9063-regulator.c
> +++ b/drivers/regulator/da9063-regulator.c
> @@ -585,7 +585,7 @@ static struct da9063_dev_model regulators_models[] = {
>  	{
>  		.regulator_info = da9063_regulator_info,
>  		.n_regulators = ARRAY_SIZE(da9063_regulator_info),
> -		.dev_model = PMIC_DA9063,
> +		.dev_model = PMIC_CHIP_ID_DA9063,
>  	},
>  	{ }
>  };
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h index f3ae65db4c86..664f650d0086 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -29,9 +29,7 @@
>  #define DA9063_DRVNAME_RTC		"da9063-rtc"
>  #define DA9063_DRVNAME_VIBRATION	"da9063-vibration"
>  
> -enum da9063_models {
> -	PMIC_DA9063 = 0x61,
> -};
> +#define PMIC_CHIP_ID_DA9063		0x61
>  
>  enum da9063_variant_codes {
>  	PMIC_DA9063_AD = 0x3,
> --
> 2.16.2

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Regards,
Steve
