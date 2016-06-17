Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33253 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753455AbcFQP5S (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 11:57:18 -0400
Received: by mail-oi0-f67.google.com with SMTP id e205so14473274oig.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2016 08:57:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466072862-28030-4-git-send-email-geert+renesas@glider.be>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be> <1466072862-28030-4-git-send-email-geert+renesas@glider.be>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Fri, 17 Jun 2016 17:57:16 +0200
Message-ID: <CAO3366zM=x5HSOMZ6WqEhTr5piQQdSV6vnr7qE48c=Bvm612LQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] soc: renesas: rcar-sysc: Make rcar_sysc_init()
 init the PM domains
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thanks for the patch.

On Thu, Jun 16, 2016 at 12:27 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Let rcar_sysc_init() trigger initialization of the SYSC PM domains from
> DT if called before the early_initcall.
> On failure, it falls back to mapping the passed register block, as
> before.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
> ---
>  drivers/soc/renesas/rcar-sysc.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 59a8152681a59a5c..68d6856c9d3cd192 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -164,15 +164,6 @@ static bool rcar_sysc_power_is_off(const struct rcar_sysc_ch *sysc_ch)
>         return false;
>  }
>
> -void __iomem *rcar_sysc_init(phys_addr_t base)
> -{
> -       rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
> -       if (!rcar_sysc_base)
> -               panic("unable to ioremap R-Car SYSC hardware block\n");

Is this check no longer necessary?

> -
> -       return rcar_sysc_base;
> -}
> -
>  struct rcar_sysc_pd {
>         struct generic_pm_domain genpd;
>         struct rcar_sysc_ch ch;
> @@ -328,6 +319,9 @@ static int __init rcar_sysc_pd_init(void)
>         unsigned int i;
>         int error;
>
> +       if (rcar_sysc_base)
> +               return 0;
> +
>         np = of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
>         if (!np)
>                 return -ENODEV;
> @@ -405,3 +399,11 @@ out_put:
>         return error;
>  }
>  early_initcall(rcar_sysc_pd_init);
> +
> +void __iomem * __init rcar_sysc_init(phys_addr_t base)
> +{
> +       if (rcar_sysc_pd_init())
> +               rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
> +
> +       return rcar_sysc_base;
> +}
> --
> 1.9.1
>

CU
Uli
