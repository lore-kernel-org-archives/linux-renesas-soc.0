Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail1.bemta25.messagelabs.com ([195.245.230.3]:6861 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S967032AbeEXLs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:48:57 -0400
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
Subject: RE: [PATCH 6/6] mfd: da9063: Add DA9063L support
Date: Thu, 24 May 2018 11:48:54 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB701941A47F0@SW-EX-MBX02.diasemi.com>
References: <20180523114230.10109-1-marek.vasut+renesas@gmail.com>
 <20180523114230.10109-6-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180523114230.10109-6-marek.vasut+renesas@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thanks Marek,

> On 23 May 2018 12:43 Marek Vasut wrote,
>
> To: linux-kernel@vger.kernel.org
> Cc: Marek Vasut <marek.vasut+renesas@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>;
> Lee Jones <lee.jones@linaro.org>; Mark Brown <broonie@kernel.org>; Steve Twiss <stwiss.opensource@diasemi.com>;
> Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH 6/6] mfd: da9063: Add DA9063L support
>
> Add support for DA9063L, which is a reduced variant of the DA9063 with less regulators and without RTC.
>

There's potentially more to this file. Without an RTC the regmap access tables would change and the
usual DA9063 (BB silicon) tables would become invalid.
The tables for da9063_bb_readable_ranges, da9063_bb_writeable_ranges, da9063_bb_volatile_ranges,
would need to be updated for DA9063L, if a new chip model was needed.

The new ranges would be this (see below), and would remove any RTC accesses in the new chip model.

static const struct regmap_range da9063l_bb_readable_ranges[] = {
	{
		.range_min = DA9063_REG_PAGE_CON,
		.range_max = DA9063_REG_MON_A10_RES,
	}, {
		.range_min = DA9063_REG_SEQ,
		.range_max = DA9063_REG_ID_32_31,
	}, {
		.range_min = DA9063_REG_SEQ_A,
		.range_max = DA9063_REG_AUTO3_LOW,
	}, {
		.range_min = DA9063_REG_T_OFFSET,
		.range_max = DA9063_BB_REG_GP_ID_19,
	}, {
		.range_min = DA9063_REG_CHIP_ID,
		.range_max = DA9063_REG_CHIP_VARIANT,
	},
};

static const struct regmap_range da9063l_bb_writeable_ranges[] = {
	{
		.range_min = DA9063_REG_PAGE_CON,
		.range_max = DA9063_REG_PAGE_CON,
	}, {
		.range_min = DA9063_REG_FAULT_LOG,
		.range_max = DA9063_REG_VSYS_MON,
	}, {
		.range_min = DA9063_REG_SEQ,
		.range_max = DA9063_REG_ID_32_31,
	}, {
		.range_min = DA9063_REG_SEQ_A,
		.range_max = DA9063_REG_AUTO3_LOW,
	}, {
		.range_min = DA9063_REG_CONFIG_I,
		.range_max = DA9063_BB_REG_MON_REG_4,
	}, {
		.range_min = DA9063_BB_REG_GP_ID_0,
		.range_max = DA9063_BB_REG_GP_ID_19,
	},
};

static const struct regmap_range da9063l_bb_volatile_ranges[] = {
	{
		.range_min = DA9063_REG_PAGE_CON,
		.range_max = DA9063_REG_EVENT_D,
	}, {
		.range_min = DA9063_REG_CONTROL_A,
		.range_max = DA9063_REG_CONTROL_B,
	}, {
		.range_min = DA9063_REG_CONTROL_E,
		.range_max = DA9063_REG_CONTROL_F,
	}, {
		.range_min = DA9063_REG_BCORE2_CONT,
		.range_max = DA9063_REG_LDO11_CONT,
	}, {
		.range_min = DA9063_REG_DVC_1,
		.range_max = DA9063_REG_ADC_MAN,
	}, {
		.range_min = DA9063_REG_ADC_RES_L,
		.range_max = DA9063_REG_MON_A10_RES,
	}, {
		.range_min = DA9063_REG_SEQ,
		.range_max = DA9063_REG_SEQ,
	}, {
		.range_min = DA9063_REG_EN_32K,
		.range_max = DA9063_REG_EN_32K,
	}, {
		.range_min = DA9063_BB_REG_MON_REG_5,
		.range_max = DA9063_BB_REG_MON_REG_6,
	},
};

However this is a larger and more wide-ranging change compared to the one proposed by Marek,
and would require other alterations to fit this in. Also I'm undecided to what it would really add
apart from a new chip model: I have been told accessing the DA9063 RTC register locations has
no effect in the DA9063L.

If the maintainers are happy with this, and if a chip model addition is really needed in future
it can be added later if required.

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Regards,
Steve

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c index 5544ce8e3363..84bbd2bbcd2a 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -232,6 +232,7 @@ static struct regmap_config da9063_regmap_config = {
>  
>  static const struct of_device_id da9063_dt_ids[] = {
>  	{ .compatible = "dlg,da9063", },
> +	{ .compatible = "dlg,da9063l", },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, da9063_dt_ids); @@ -282,6 +283,7 @@ static int da9063_i2c_remove(struct i2c_client *i2c)
>  
>  static const struct i2c_device_id da9063_i2c_id[] = {
>  	{ "da9063", PMIC_TYPE_DA9063 },
> +	{ "da9063l", PMIC_TYPE_DA9063L },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, da9063_i2c_id);
> --
> 2.16.2
