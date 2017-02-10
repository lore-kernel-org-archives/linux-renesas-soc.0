Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36523 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdBJHJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 02:09:32 -0500
Received: by mail-io0-f194.google.com with SMTP id q20so5043605ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Feb 2017 23:09:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170209191259.29774-1-chris.brandt@renesas.com>
References: <20170209191259.29774-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Feb 2017 08:09:22 +0100
Message-ID: <CAMuHMdVhbpfsLEn3Ke5f93AhaOnS4TSJC+QpY8xdtT1MNejVJA@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: r7s72100: add restart handler
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Feb 9, 2017 at 8:12 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Add a simple restart handler which enables the watchdog timer with the
> device reset option enabled. This is the only way SW can cause a reset on
> this SoC.
>
> If someone has a board that needs more specific operations to be done
> first, they can override this function in another file.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> ---
>  arch/arm/mach-shmobile/setup-r7s72100.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/mach-shmobile/setup-r7s72100.c b/arch/arm/mach-shmobile/setup-r7s72100.c
> index d46639f..cc6237e 100644
> --- a/arch/arm/mach-shmobile/setup-r7s72100.c
> +++ b/arch/arm/mach-shmobile/setup-r7s72100.c
> @@ -15,11 +15,40 @@
>   */
>
>  #include <linux/kernel.h>
> +#include <linux/io.h>
>
>  #include <asm/mach/arch.h>
>
>  #include "common.h"
>
> +/*
> + * This function is declared weak so if you need to do some board specific stuff
> + * before the reset occurs, you can override this function.
> + *
> + * CAUTION: A reboot command doesn't 'sync' before this function
> + * is called. See function reboot() in kernel/reboot.c
> + */
> +extern void __attribute__ ((weak)) r7s72100_restart(enum reboot_mode mode,
> +                                                   const char *cmd)
> +{
> +#define WTCSR 0
> +#define WTCNT 2
> +#define WRCSR 4
> +       void *base = ioremap(0xFCFE0000, 0x10);

This base address should come from a watchdog device node in DT...

> +       /* Dummy read (must read WRCSR:WOVF at least once before clearing) */
> +       readw(base + WRCSR);
> +
> +       writew(0xA500, base + WRCSR);   /* Clear WOVF */
> +       writew(0x5A5F, base + WRCSR);   /* Reset Enable */
> +       writew(0x5A00, base + WTCNT);   /* Counter to 00 */
> +       writew(0xA578, base + WTCSR);   /* Start timer */
> +
> +       /* Wait for WDT overflow */
> +       while (1)
> +               ;
> +}
> +
>  static const char *const r7s72100_boards_compat_dt[] __initconst = {
>         "renesas,r7s72100",
>         NULL,
> @@ -29,4 +58,5 @@ DT_MACHINE_START(R7S72100_DT, "Generic R7S72100 (Flattened Device Tree)")
>         .init_early     = shmobile_init_delay,
>         .init_late      = shmobile_init_late,
>         .dt_compat      = r7s72100_boards_compat_dt,
> +       .restart        = r7s72100_restart,
>  MACHINE_END

Perhaps unsurprisingly, I'd recommend writing a watchdog driver instead.
drivers/watchdog/renesas_wdt.c (currently supporting R-Car Gen3 only) may
serve as an example.

>From an earlier discussion during development of that driver:

| The RWDT exists on various Renesas SoCs.
| From digging into the datasheets, I had discovered two variants a while go:
|   1. 32-bit registers
|        a. R-Car Gen2: using RST for restarting
|        b. R-Mobile APE6: using SYSC for restarting
|   2. 8-bit registers (SH-Mobile AP4/AG5, R-Mobile A1)
|
| The differences are small: the variant with 8-bit registers has a smaller
| maximum timeout, and no magic value to be stored in the upper bits.
|
| Wolfram discovered the third variant in RZ/A1H, which differs in
| register layout.

IIRC, apart from the different register layout, actual operation on RZ/A1H
is similar to other Renesas SoCs.  Depending on the differences, you may
decide to write a new driver instead, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
