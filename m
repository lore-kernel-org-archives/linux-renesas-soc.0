Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38998 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbeLDN0g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 08:26:36 -0500
Received: by mail-vk1-f194.google.com with SMTP id q80so3752907vka.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 05:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 14:26:22 +0100
Message-ID: <CAMuHMdWquKgVuji=Sdain+ZMifkz5j-Ma-09X6t6UCS3x=hjrg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: set state when registering SD clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Nov 29, 2018 at 1:16 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The driver tries to figure out which state a SD clock is in when the
> clock is register instead of setting a known state. This can be
> problematic for two reasons.
>
> 1. If the clock driver can't figure out the state of the clock
>    registration of the clock fails and setting of a known state by a
>    clock user is not possible.
>
> 2. The state of the clock depends on if and how the bootloader
>    configured it. The driver only checks that the rate is known not if
>    the clock is stopped or not for example.
>
> Fix this by setting a known state and make sure the clock is stopped.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One minor nit below.

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -360,7 +360,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
>         struct sd_clock *clock;
>         struct clk *clk;
>         unsigned int i;
> -       u32 sd_fc;
> +       u32 val;
>
>         clock = kzalloc(sizeof(*clock), GFP_KERNEL);
>         if (!clock)
> @@ -377,17 +377,11 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
>         clock->div_table = cpg_sd_div_table;
>         clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
>
> -       sd_fc = readl(clock->csn.reg) & CPG_SD_FC_MASK;
> -       for (i = 0; i < clock->div_num; i++)
> -               if (sd_fc == (clock->div_table[i].val & CPG_SD_FC_MASK))
> -                       break;
> -
> -       if (WARN_ON(i >= clock->div_num)) {
> -               kfree(clock);
> -               return ERR_PTR(-EINVAL);
> -       }
> +       val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
> +       val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
> +       writel(val, clock->csn.reg);
>
> -       clock->cur_div_idx = i;
> +       clock->cur_div_idx = 0;

I think this line can just be dropped, as the object was allocated using
kzalloc().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
