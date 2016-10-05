Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34800 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751128AbcJELZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 07:25:14 -0400
Received: by mail-wm0-f68.google.com with SMTP id b201so18913069wmb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Oct 2016 04:25:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1475663291-4502-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475663291-4502-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Oct 2016 13:25:12 +0200
Message-ID: <CAMuHMdUwussH1Tvzrz3=cOmt0b-+fS5ybd7gvy2FdYRiVADO1g@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Remove unneeded check in SMP initialization
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Oct 5, 2016 at 12:28 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The SMP initialization function is only called if CONFIG_SMP is defined.
> Remove the duplicate check.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm/mach-shmobile/platsmp.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm/mach-shmobile/platsmp.c b/arch/arm/mach-shmobile/platsmp.c
> index 02e21bceb085..48595a397220 100644
> --- a/arch/arm/mach-shmobile/platsmp.c
> +++ b/arch/arm/mach-shmobile/platsmp.c
> @@ -39,9 +39,5 @@ bool shmobile_smp_cpu_can_disable(unsigned int cpu)
>
>  bool __init shmobile_smp_init_fallback_ops(void)
>  {
> -       /* fallback on PSCI/smp_ops if no other DT based method is detected */
> -       if (!IS_ENABLED(CONFIG_SMP))
> -               return false;
> -
>         return platform_can_secondary_boot() ? true : false;
>  }

This check was added recently, because the UP build was broken.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
