Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42917 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731971AbeKWXm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:42:59 -0500
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com> <71808cdc-c95b-8ba2-10aa-01f6a6af7cf1@cogentembedded.com>
In-Reply-To: <71808cdc-c95b-8ba2-10aa-01f6a6af7cf1@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 13:58:40 +0100
Message-ID: <CAMuHMdXiUomHV_3+DFuD64dFFjD5fABZVDOi3RXqZzw9YH5caw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: rcar-gen3-cpg: add RPCD2 clock
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Nov 22, 2018 at 7:43 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the RPCD2 clock for the R-Car gen3 SoCs -- this clock is en/disabled
> via the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970)
> and has a fixed divisor of 2 (applied to the RPC clock).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -524,6 +524,89 @@ static struct clk * __init cpg_rpc_clk_r
>         return clk;
>  }
>
> +static int cpg_rpcd2_clock_enable(struct clk_hw *hw)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +
> +       cpg_reg_modify(clock->reg, CPG_RPC_CKSTP2, 0);
> +
> +       return 0;
> +}
> +
> +static void cpg_rpcd2_clock_disable(struct clk_hw *hw)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +
> +       cpg_reg_modify(clock->reg, 0, CPG_RPC_CKSTP2);
> +}
> +
> +static int cpg_rpcd2_clock_is_enabled(struct clk_hw *hw)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +
> +       return !(readl(clock->reg) & CPG_RPC_CKSTP2);
> +}

As the above 3 functions are identical to their rpc_*() counterparts,
except for the bit touched, would it make sense to share them, e.g. by
storing the bit number in struct rpc_clock?

> +static long cpg_rpcd2_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                unsigned long *parent_rate)
> +{
> +       return *parent_rate / 2;

Given you set CLK_SET_RATE_PARENT, shouldn't you propagate up,
cfr. drivers/clk/clk-fixed-factor.c:clk_factor_round_rate()?

> +}

> +static struct clk * __init cpg_rpcd2_clk_register(const struct cpg_core_clk *core,
> +                                               void __iomem *base,
> +                                               const char *parent_name)
> +{
> +       struct clk_init_data init;
> +       struct rpc_clock *clock;
> +       struct clk *clk;
> +
> +       clock = kzalloc(sizeof(*clock), GFP_KERNEL);
> +       if (!clock)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = core->name;
> +       init.ops = &cpg_rpcd2_clock_ops;
> +       init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;

I don't think CLK_IS_BASIC is appropriate?

#define CLK_IS_BASIC            BIT(5) /* Basic clk, can't do a to_clk_foo() */

Given RPCD2 is the combination of a gate and fixed-divider clock, would
it make sense to use clk_composite?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
