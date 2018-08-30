Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:36698 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727203AbeH3Ltd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 07:49:33 -0400
Received: by mail-ua1-f67.google.com with SMTP id c12-v6so4933092uan.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 00:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <1535596744-16598-1-git-send-email-na-hoan@jinso.co.jp> <1535596744-16598-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535596744-16598-2-git-send-email-na-hoan@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 09:48:30 +0200
Message-ID: <CAMuHMdVxT7qjim7-zG9M1Zdt=BQmUs7izbjhxajgy59xs04cnQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar: reduce inaccuracy in calculate rounding
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@sang-engineering.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan,

On Thu, Aug 30, 2018 at 4:39 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> About the formula for temperature calculation
> [reg] = [temp] * a + b <=> [temp] = ([reg] - b) / a
>
> Using "(mcelsius * tsc-> coef.aX) / 1000" instead of "DIV_ROUND_CLOSEST(mcelsius, 1000) * tsc-> coef.aX"
> to avoid and reduce inaccuracy due to rounding the integer division.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch!

> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -185,11 +185,10 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
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

No rounding anymoe?

    val1 = DIV_ROUND_CLOSEST(mcelsius * tsc->coef.a1, 1000) + tsc->coef.b1;
    val2 = DIV_ROUND_CLOSEST(mcelsius * tsc->coef.a2, 1000) + tsc->coef.b2;

Can the multiplication overflow?

I know mcelsius = -40000..120000/
What is the range of a1 and a2?

>
>         return INT_FIXPT((val1 + val2) / 2);

BTW, do we want to introduce rounding here, too?
(for INT_FIXPT(), it doesn't matter much for /2)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
