Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35334 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753718AbcJGHoN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 03:44:13 -0400
Received: by mail-it0-f68.google.com with SMTP id l13so624151itl.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Oct 2016 00:43:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1475663489-4789-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475663489-4789-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Oct 2016 09:43:53 +0200
Message-ID: <CAMuHMdVVE2N20zmCddy6Y2mMBf4zk0u=WfQ3Sa1e_ASOf5zO_Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Consolidate R8A779[234] machine definitions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Oct 5, 2016 at 12:31 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The three SoCs use the exact same machine definition, consolidate them
> into a single one.

Thanks for your patch!

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm wondering if we can improve upon...

> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c

> @@ -203,3 +204,22 @@ void __init rcar_gen2_reserve(void)
>         }
>  #endif
>  }
> +
> +static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
> +       /*
> +        * R8A7790 and R8A7791 can't be handled here as long as they need SMP
> +        * initialization fallback.
> +        */
> +       "renesas,r8a7792",
> +       "renesas,r8a7793",
> +       "renesas,r8a7794",
> +       NULL,
> +};
> +
> +DT_MACHINE_START(RCAR_GEN2_DT, "Generic Gen2 (Flattened Device Tree)")
> +       .init_early     = shmobile_init_delay,

shmobile_init_delay() is not really Renesas-specific, but ARM-specific.
This is just to avoid calibrating the delay loop?

> +       .init_late      = shmobile_init_late,

This calls only into shmobile_suspend_init(), which is also not
Renesas-specific.

> +       .init_time      = rcar_gen2_timer_init,

This is about fixing up the ARM Arch timer, and initializing clocks as we
need to pass the mode pin state (ugh, will hopefully go away soon).

> +       .reserve        = rcar_gen2_reserve,

Reserving a block for CMA DMA is also not really Renesas-specific.

> +       .dt_compat      = rcar_gen2_boards_compat_dt,
> +MACHINE_END

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
