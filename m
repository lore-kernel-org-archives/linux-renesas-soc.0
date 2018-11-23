Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:34962 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436515AbeKWXju (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:39:50 -0500
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com> <5aa01cae-28ff-efb5-bf4d-1994760ecb79@cogentembedded.com>
In-Reply-To: <5aa01cae-28ff-efb5-bf4d-1994760ecb79@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 13:55:32 +0100
Message-ID: <CAMuHMdX4cDC1ML8Wp8oT45YkjHux+uk5NMYX2BAvs=nNgm_oAw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
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

On Thu, Nov 22, 2018 at 7:41 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the RPC clock for the R-Car gen3 SoCs -- this clock is controlled by
> the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -409,6 +409,121 @@ free_clock:
>         return clk;
>  }
>
> +#define CPG_RPC_CKSTP2         BIT(9)

This bit is for RPCD2, so technically it should be part of patch 3/4.
Perhaps you can merge both patches, and absorb the non-SoC-specific
parts from patch 4/4?

> +#define CPG_RPC_CKSTP          BIT(8)
> +#define CPG_RPC_DIV_4_3_MASK   GENMASK(4, 3)

Unused

> +#define CPG_RPC_DIV_2_0_MASK   GENMASK(2, 0)
> +
> +struct rpc_clock {
> +       struct clk_hw hw;
> +       void __iomem *reg;

As this register should be saved/restore during system suspend/resume,
you should add

    struct cpg_simple_notifier csn;

> +};

> +static long cpg_rpc_clock_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                    unsigned long *parent_rate)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +       unsigned int div = cpg_rpc_clock_calc_div(clock, rate, *parent_rate);
> +
> +       return DIV_ROUND_CLOSEST(*parent_rate, div);

Given you set CLK_SET_RATE_PARENT, shouldn't you propagate up,
cfr. drivers/clk/clk-fixed-factor.c:clk_factor_round_rate()?

> +}

> +static struct clk * __init cpg_rpc_clk_register(const struct cpg_core_clk *core,
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
> +       init.ops = &cpg_rpc_clock_ops;
> +       init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;

I don't think CLK_IS_BASIC is appropriate?

#define CLK_IS_BASIC            BIT(5) /* Basic clk, can't do a to_clk_foo() */

> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       clock->reg = base + CPG_RPCCKCR;
> +       clock->hw.init = &init;
> +
> +       clk = clk_register(NULL, &clock->hw);
> +       if (IS_ERR(clk))
> +               kfree(clock);
> +

For save/restore during system suspend/resume:

    cpg_simple_notifier_register(notifiers, &clock->csn);

Hmm, looks like I missed that during review of commit 381081ffc2948e1e
("clk: renesas: r8a77970: Add SD0H/SD0 clocks for SDHI"), too.

> +       return clk;
> +}
> +
>
>  static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
>  static unsigned int cpg_clk_extalr __initdata;
> @@ -583,6 +698,9 @@ struct clk * __init rcar_gen3_cpg_clk_re
>                 }
>                 break;
>
> +       case CLK_TYPE_GEN3_RPC:
> +               return cpg_rpc_clk_register(core, base, __clk_get_name(parent));
> +
>         default:
>                 return ERR_PTR(-EINVAL);
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
