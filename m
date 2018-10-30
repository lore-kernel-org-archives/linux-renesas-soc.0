Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39616 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbeJ3SQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 14:16:38 -0400
MIME-Version: 1.0
References: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Oct 2018 10:23:46 +0100
Message-ID: <CAMuHMdW5-04URYRRRgdSEK0_FNBxykGB-z=yxvH57fKYPnKjsA@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Fix does not have interrupts counting
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CC actual maintainer, developer, and subsystem

On Tue, Oct 30, 2018 at 10:10 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> This patch fixes thermal interrupts that did not happen when temprature changed.
> Add the function rcar_gen3_thermal_update_threshold(), this function is used to
> calculate the value written to the threshold registers REG_GEN3_IRQTEMP1 and
> REG_GEN3_IRQTEMP2.
>
> This patch is based on renesas-bsp/rcar-3.5.4.rc2 !
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 45 +++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..009c0db 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -185,37 +185,39 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>  static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
>                                               int mcelsius)
>  {
> -       int celsius, val1, val2;
> +       int val1, val2;
>
> -       celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
> -       val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
> -       val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
> +       val1 = (mcelsius * tsc->coef.a1)/1000 + tsc->coef.b1;
> +       val2 = (mcelsius * tsc->coef.a2)/1000 + tsc->coef.b2;
>
>         return INT_FIXPT((val1 + val2) / 2);
>  }
>
> -static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
> +static int rcar_gen3_thermal_update_threshold(struct rcar_gen3_thermal_tsc *tsc)
>  {
> -       struct rcar_gen3_thermal_tsc *tsc = devdata;
> -
> -       low = clamp_val(low, -40000, 120000);
> -       high = clamp_val(high, -40000, 120000);
> -
> -       rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1,
> -                               rcar_gen3_thermal_mcelsius_to_temp(tsc, low));
> +       u32 ctemp;
> +       int temp_code;
> +       int mcelsius, val1, val2;
>
> -       rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2,
> -                               rcar_gen3_thermal_mcelsius_to_temp(tsc, high));
> +       ctemp = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
> +       val1 = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b1, tsc->coef.a1);
> +       val2 = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b2, tsc->coef.a2);
> +       mcelsius = FIXPT_TO_MCELSIUS((val1 + val2) / 2);
>
> -       tsc->low = low;
> -       tsc->high = high;
> +       /* set the interrupts to exceed the temperature */
> +       temp_code = rcar_gen3_thermal_mcelsius_to_temp(tsc,
> +                       mcelsius + MCELSIUS(1));
> +       rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1, temp_code);
> +       /* set the interrupts to fall below the temperature */
> +       temp_code = rcar_gen3_thermal_mcelsius_to_temp(tsc,
> +                       mcelsius - MCELSIUS(1));
> +       rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2, temp_code);
>
>         return 0;
>  }
>
>  static const struct thermal_zone_of_device_ops rcar_gen3_tz_of_ops = {
>         .get_temp       = rcar_gen3_thermal_get_temp,
> -       .set_trips      = rcar_gen3_thermal_set_trips,
>  };
>
>  static void rcar_thermal_irq_set(struct rcar_gen3_thermal_priv *priv, bool on)
> @@ -256,8 +258,11 @@ static irqreturn_t rcar_gen3_thermal_irq_thread(int irq, void *data)
>         int i;
>
>         for (i = 0; i < priv->num_tscs; i++)
> +       {
> +               rcar_gen3_thermal_update_threshold(priv->tscs[i]);
>                 thermal_zone_device_update(priv->tscs[i]->zone,
>                                            THERMAL_EVENT_UNSPECIFIED);
> +       }
>
>         spin_lock_irqsave(&priv->lock, flags);
>         rcar_thermal_irq_set(priv, true);
> @@ -306,7 +311,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>
>         usleep_range(1000, 2000);
>
> -       rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
> +       rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
>         rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>         rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>
> @@ -414,6 +419,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>                 priv->thermal_init(tsc);
>                 rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
>
> +               rcar_gen3_thermal_update_threshold(tsc);
> +
>                 zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
>                                                             &rcar_gen3_tz_of_ops);
>                 if (IS_ERR(zone)) {
> @@ -465,7 +472,7 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
>                 struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
>
>                 priv->thermal_init(tsc);
> -               rcar_gen3_thermal_set_trips(tsc, tsc->low, tsc->high);
> +               rcar_gen3_thermal_update_threshold(tsc);
>         }
>
>         rcar_thermal_irq_set(priv, true);
