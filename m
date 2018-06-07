Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:39112 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753369AbeFGMra (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 08:47:30 -0400
Received: by mail-io0-f196.google.com with SMTP id f1-v6so11642412ioh.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 05:47:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1528211115-12334-1-git-send-email-geert+renesas@glider.be>
References: <1528211115-12334-1-git-send-email-geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 Jun 2018 14:47:29 +0200
Message-ID: <CAPDyKFoVkWPDB=_KEFfCMhYs5r+SZxTHkaUYRfyAW-C_mqgkog@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Make PM domain initialization
 more robust
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 June 2018 at 17:05, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> The quirk for R-Car E3 ES1.0 added in commit 086b399965a7ee7e ("soc:
> renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}") makes the 3DG-A
> PM domain a subdomain of the 3DG-B PM domain.  However, registering
> 3DG-A with its parent fails silently, as the 3DG-B PM domain hasn't been
> registered yet, and such failures are never reported.
>
> Fix this by:
>   1. Splitting PM Domain initialization in two steps, so all PM domains
>      are registered before any child-parent links are established,
>   2. Reporting any failures in establishing child-parent relations.
>
> Check for and report pm_genpd_init() failures, too, as that function
> gained a return value in commit 7eb231c337e00735 ("PM / Domains: Convert
> pm_genpd_init() to return an error code").
>
> Fixes: 086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/soc/renesas/rcar-sysc.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 4db53fa38abc5cf3..99e926f68299878d 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -379,11 +379,12 @@ static int rcar_sysc_pd_power_on(struct generic_pm_domain *genpd)
>
>  static bool has_cpg_mstp;
>
> -static void __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
> +static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
>  {
>         struct generic_pm_domain *genpd = &pd->genpd;
>         const char *name = pd->genpd.name;
>         struct dev_power_governor *gov = &simple_qos_governor;
> +       int error;
>
>         if (pd->flags & PD_CPU) {
>                 /*
> @@ -436,7 +437,11 @@ static void __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
>         rcar_sysc_power_up(&pd->ch);
>
>  finalize:
> -       pm_genpd_init(genpd, gov, false);
> +       error = pm_genpd_init(genpd, gov, false);
> +       if (error)
> +               pr_err("Failed to init PM domain %s: %d\n", name, error);
> +
> +       return error;
>  }
>
>  static const struct of_device_id rcar_sysc_matches[] __initconst = {
> @@ -560,6 +565,9 @@ static int __init rcar_sysc_pd_init(void)
>         pr_debug("%pOF: syscier = 0x%08x\n", np, syscier);
>         iowrite32(syscier, base + SYSCIER);
>
> +       /*
> +        * First, create all PM domains
> +        */
>         for (i = 0; i < info->num_areas; i++) {
>                 const struct rcar_sysc_area *area = &info->areas[i];
>                 struct rcar_sysc_pd *pd;
> @@ -582,14 +590,29 @@ static int __init rcar_sysc_pd_init(void)
>                 pd->ch.isr_bit = area->isr_bit;
>                 pd->flags = area->flags;
>
> -               rcar_sysc_pd_setup(pd);
> -               if (area->parent >= 0)
> -                       pm_genpd_add_subdomain(domains->domains[area->parent],
> -                                              &pd->genpd);
> +               error = rcar_sysc_pd_setup(pd);
> +               if (error)
> +                       goto out_put;
>
>                 domains->domains[area->isr_bit] = &pd->genpd;
>         }
>
> +       /*
> +        * Second, link all PM domains to their parents
> +        */
> +       for (i = 0; i < info->num_areas; i++) {
> +               const struct rcar_sysc_area *area = &info->areas[i];
> +
> +               if (!area->name || area->parent < 0)
> +                       continue;
> +
> +               error = pm_genpd_add_subdomain(domains->domains[area->parent],
> +                                              domains->domains[area->isr_bit]);
> +               if (error)
> +                       pr_warn("Failed to add PM subdomain %s to parent %u\n",
> +                               area->name, area->parent);
> +       }
> +
>         error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
>
>  out_put:
> --
> 2.7.4
>
