Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34226 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433AbcELRqB (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 13:46:01 -0400
Received: by mail-io0-f194.google.com with SMTP id d62so200371iof.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:46:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463041641-27485-4-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
	<1463041641-27485-4-git-send-email-dirk.behme@de.bosch.com>
Date: Thu, 12 May 2016 19:46:00 +0200
Message-ID: <CAMuHMdX8=jatucacG9ikEx55zu+oZXHYnkc35MXuKPcWEeV3pg@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: renesas: rcar-gen3: Obtain MD pin values using syscon/regmap
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 12, 2016 at 10:27 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -15,6 +15,9 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
>
>  #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
>
> @@ -294,7 +297,17 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
>  static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  {
>         const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
> -       u32 cpg_mode = rcar_gen3_read_mode_pins();
> +       struct device_node *np = dev->of_node;
> +       struct regmap *regmap;
> +       u32 cpg_mode, reg;
> +
> +       regmap = syscon_regmap_lookup_by_phandle(np, "renesas,modemr");
> +       if (IS_ERR(regmap) ||
> +           of_property_read_u32_index(np, "renesas,modemr", 1, &reg) ||
> +           regmap_read(regmap, reg, &cpg_mode)) {
> +               dev_err(dev, "Failed to parse renesas,modemr\n");
> +               return -EINVAL;
> +       }

I would not add this to each and ...

> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -16,6 +16,9 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
>
>  #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
>
> @@ -159,7 +162,17 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
>  static int __init r8a7796_cpg_mssr_init(struct device *dev)
>  {
>         const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
> -       u32 cpg_mode = rcar_gen3_read_mode_pins();
> +       struct device_node *np = dev->of_node;
> +       struct regmap *regmap;
> +       u32 cpg_mode, reg;
> +
> +       regmap = syscon_regmap_lookup_by_phandle(np, "renesas,modemr");
> +       if (IS_ERR(regmap) ||
> +           of_property_read_u32_index(np, "renesas,modemr", 1, &reg) ||
> +           regmap_read(regmap, reg, &cpg_mode)) {
> +               dev_err(dev, "Failed to parse renesas,modemr\n");
> +               return -EINVAL;
> +       }

... every subdriver for all SoCs that need it...

> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index bb4f2f9..9d76076 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -333,23 +333,6 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                                          __clk_get_name(parent), 0, mult, div);
>  }
>
> -/*
> - * Reset register definitions.
> - */
> -#define MODEMR 0xe6160060
> -
> -u32 __init rcar_gen3_read_mode_pins(void)
> -{
> -       void __iomem *modemr = ioremap_nocache(MODEMR, 4);
> -       u32 mode;
> -
> -       BUG_ON(!modemr);
> -       mode = ioread32(modemr);
> -       iounmap(modemr);
> -
> -       return mode;
> -}

... but add it here.
Or perhaps just in renesas-cpg-mssr.c, as we're gonna need it for R-Car Gen2
too, if/when that is converted to cpg-mssr.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
