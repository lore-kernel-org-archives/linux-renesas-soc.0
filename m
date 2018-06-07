Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36413 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753068AbeFGIH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 04:07:58 -0400
Subject: Re: [PATCH v5 01/14] mfd: da9063: Replace regmap_add_irq_chip with
 devm counterpart
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
Message-ID: <019675f0-13ff-d381-87d1-891316cbfd83@gmail.com>
Date: Thu, 7 Jun 2018 10:04:31 +0200
MIME-Version: 1.0
In-Reply-To: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/06/2018 11:59 AM, Marek Vasut wrote:
> Use devm_regmap_add_irq_chip() instead of plain regmap_add_irq_chip(),
> which removes the need for da9063_irq_exit() altogether and also
> fixes a bug in da9063_device_init() where the da9063_irq_exit() was
> not called in a failpath.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org

So it's just this one patch that's missing AB/RB and the series should
be good?

> ---
> V5: New patch
> ---
>  drivers/mfd/da9063-core.c       | 1 -
>  drivers/mfd/da9063-irq.c        | 8 ++------
>  include/linux/mfd/da9063/core.h | 1 -
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> index 6c2870d4e754..2647bb371d86 100644
> --- a/drivers/mfd/da9063-core.c
> +++ b/drivers/mfd/da9063-core.c
> @@ -238,7 +238,6 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
>  void da9063_device_exit(struct da9063 *da9063)
>  {
>  	mfd_remove_devices(da9063->dev);
> -	da9063_irq_exit(da9063);
>  }
>  
>  MODULE_DESCRIPTION("PMIC driver for Dialog DA9063");
> diff --git a/drivers/mfd/da9063-irq.c b/drivers/mfd/da9063-irq.c
> index 207bbfe55449..da6ceb41f0d1 100644
> --- a/drivers/mfd/da9063-irq.c
> +++ b/drivers/mfd/da9063-irq.c
> @@ -170,7 +170,8 @@ int da9063_irq_init(struct da9063 *da9063)
>  		return -EINVAL;
>  	}
>  
> -	ret = regmap_add_irq_chip(da9063->regmap, da9063->chip_irq,
> +	ret = devm_regmap_add_irq_chip(da9063->dev, da9063->regmap,
> +			da9063->chip_irq,
>  			IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_SHARED,
>  			da9063->irq_base, &da9063_irq_chip,
>  			&da9063->regmap_irq);
> @@ -182,8 +183,3 @@ int da9063_irq_init(struct da9063 *da9063)
>  
>  	return 0;
>  }
> -
> -void da9063_irq_exit(struct da9063 *da9063)
> -{
> -	regmap_del_irq_chip(da9063->chip_irq, da9063->regmap_irq);
> -}
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index f3ae65db4c86..9ab7049977aa 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -95,6 +95,5 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq);
>  int da9063_irq_init(struct da9063 *da9063);
>  
>  void da9063_device_exit(struct da9063 *da9063);
> -void da9063_irq_exit(struct da9063 *da9063);
>  
>  #endif /* __MFD_DA9063_CORE_H__ */
> 


-- 
Best regards,
Marek Vasut
