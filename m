Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:25289 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751849AbeFETrP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 15:47:15 -0400
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Marek Vasut <marek.vasut@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH v3 10/10] mfd: da9063: Add DA9063L support
Date: Tue, 5 Jun 2018 19:47:11 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB701941AD6AD@SW-EX-MBX02.diasemi.com>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-10-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180602101155.26375-10-marek.vasut+renesas@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02 June 2018 11:12, Marek Vasut wrote,

> Subject: [PATCH v3 10/10] mfd: da9063: Add DA9063L support
> 
> Add support for DA9063L, which is a reduced variant of the DA9063
> with less regulators and without RTC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V2: No change
> V3: No change
> ---
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index f0d92a37df6b..74a3b10a7208 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -319,6 +319,7 @@ static struct regmap_config da9063_regmap_config = {
> 
>  static const struct of_device_id da9063_dt_ids[] = {
>  	{ .compatible = "dlg,da9063", },
> +	{ .compatible = "dlg,da9063l", },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, da9063_dt_ids);
> @@ -373,6 +374,7 @@ static int da9063_i2c_remove(struct i2c_client *i2c)
> 
>  static const struct i2c_device_id da9063_i2c_id[] = {
>  	{ "da9063", PMIC_TYPE_DA9063 },
> +	{ "da9063l", PMIC_TYPE_DA9063L },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, da9063_i2c_id);
> --
> 2.16.2

Hi Marek,

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Regards,
Steve 
