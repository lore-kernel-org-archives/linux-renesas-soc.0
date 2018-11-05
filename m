Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40880 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbeKEUCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 15:02:42 -0500
Received: by mail-vk1-f194.google.com with SMTP id v70so1881854vkv.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 02:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se> <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 11:43:24 +0100
Message-ID: <CAMuHMdWcqX5Ai3PnMK5F+1gDXrR84FzYV496zR96QHH7xmsWVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thanks for your patch!

On Thu, Nov 1, 2018 at 12:26 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> On H3 (ES1.0,ES2.0) and M3-W (ES1.0,ES1.1) the clock setting for HS400

H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1)

> needs a quirk to function properly. The reason for the quirk is that
> there are two settings which produces same divider vale for the SDn
> clock. On the effected boards the one currently selected results in HS00

HS200 or HS400?

> not working.
>
> This change uses the same method as the Gen2 CPG driver and simply
> ignores the first clock setting as this is the offending one when
> selecting the settings. Which of the two possible settings is used have
> no effect for SDR104.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index ff56ac6134111c38..8cc524a29c855dd2 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -227,6 +227,7 @@ struct sd_clock {
>         unsigned int div_min;
>         unsigned int div_max;
>         unsigned int cur_div_idx;
> +       bool skip_first;

I think you can do without adding this field...

>  };
>
>  /* SDn divider
> @@ -243,6 +244,10 @@ struct sd_clock {
>   *  1         0         2 (4)      0 (2)      8
>   *  1         0         3 (8)      0 (2)     16
>   *  1         0         4 (16)     0 (2)     32
> + *
> + *  NOTE: There is a quirk option to ignore the first row of the dividers
> + *  table when searching for suitable settings. This is because HS400 on
> + *  early ES versions of H3 and M3-W requires a specific setting to work.
>   */
>  static const struct sd_div_table cpg_sd_div_table[] = {
>  /*     CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
> @@ -327,7 +332,7 @@ static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
>         u32 val;
>         unsigned int i;
>
> -       for (i = 0; i < clock->div_num; i++)
> +       for (i = clock->skip_first ? 1 : 0; i < clock->div_num; i++)

... and without this change (see below)

>                 if (div == clock->div_table[i].div)
>                         break;
>
> @@ -355,7 +360,7 @@ static const struct clk_ops cpg_sd_clock_ops = {
>
>  static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
>         void __iomem *base, const char *parent_name,
> -       struct raw_notifier_head *notifiers)
> +       struct raw_notifier_head *notifiers, bool skip_first)

I think you can do without adding this parameter.

>  {
>         struct clk_init_data init;
>         struct sd_clock *clock;
> @@ -377,6 +382,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
>         clock->hw.init = &init;
>         clock->div_table = cpg_sd_div_table;
>         clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
> +       clock->skip_first = skip_first;

What about

    if (cpg_quirks & SD_SKIP_FIRST) {
            clock->div_table++;
            clock->div_num--;
    }

instead?

It does require moving cpg_quirks and the quirk definitions up, but reduces
the actual code change, and makes the code easier to follow.

>
>         sd_fc = readl(clock->csn.reg) & CPG_SD_FC_MASK;
>         for (i = 0; i < clock->div_num; i++)
> @@ -417,19 +423,28 @@ static u32 cpg_quirks __initdata;
>
>  #define PLL_ERRATA     BIT(0)          /* Missing PLL0/2/4 post-divider */
>  #define RCKCR_CKSEL    BIT(1)          /* Manual RCLK parent selection */
> +#define SD_SKIP_FIRST  BIT(2)          /* Skip first clock in SD table */
>
>  static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
>         {
>                 .soc_id = "r8a7795", .revision = "ES1.0",
> -               .data = (void *)(PLL_ERRATA | RCKCR_CKSEL),
> +               .data = (void *)(PLL_ERRATA | RCKCR_CKSEL | SD_SKIP_FIRST),
>         },
>         {
>                 .soc_id = "r8a7795", .revision = "ES1.*",
> -               .data = (void *)RCKCR_CKSEL,
> +               .data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
> +       },
> +       {
> +               .soc_id = "r8a7795", .revision = "ES2.0",
> +               .data = (void *)SD_SKIP_FIRST,
>         },
>         {
>                 .soc_id = "r8a7796", .revision = "ES1.0",
> -               .data = (void *)RCKCR_CKSEL,
> +               .data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
> +       },
> +       {
> +               .soc_id = "r8a7796", .revision = "ES1.1",
> +               .data = (void *)SD_SKIP_FIRST,
>         },
>         { /* sentinel */ }
>  };
> @@ -504,7 +519,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>
>         case CLK_TYPE_GEN3_SD:
>                 return cpg_sd_clk_register(core, base, __clk_get_name(parent),
> -                                          notifiers);
> +                                          notifiers,
> +                                          cpg_quirks & SD_SKIP_FIRST);
>
>         case CLK_TYPE_GEN3_R:
>                 if (cpg_quirks & RCKCR_CKSEL) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
