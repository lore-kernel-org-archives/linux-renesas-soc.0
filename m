Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:36539 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbeBSIm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:42:56 -0500
Received: by mail-qk0-f194.google.com with SMTP id 15so11294794qkl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 00:42:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180217020642.21375-2-marek.vasut+renesas@gmail.com>
References: <20180217020642.21375-1-marek.vasut+renesas@gmail.com> <20180217020642.21375-2-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:42:52 +0100
Message-ID: <CAMuHMdVu2LvxtvUYDOrW3Yhqujk4+=bN0sg-aJhxX_g0Kbpx6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Feb 17, 2018 at 3:06 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Porter needs the regulator quirk, just like the other boards,
> the DA9063 and DA9210 IRQ line is connected to CPU IRQ2 . But
> unlike the other boards, the DA9063 is at 0x5a on Porter.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> index 862f7757ef5d..7963f0eea9e1 100644
> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> @@ -132,11 +132,16 @@ static int __init rcar_gen2_regulator_quirk(void)
>         u32 mon;
>
>         if (!of_machine_is_compatible("renesas,koelsch") &&
> +           !of_machine_is_compatible("renesas,porter") &&
>             !of_machine_is_compatible("renesas,lager") &&
>             !of_machine_is_compatible("renesas,stout") &&
>             !of_machine_is_compatible("renesas,gose"))
>                 return -ENODEV;
>
> +       /* DA9063 on M2W Porter is at 0x5a */
> +       if (of_machine_is_compatible("renesas,porter"))
> +               da9xxx_msgs[0].addr = 0x5a;
> +
>         irqc = ioremap(IRQC_BASE, PAGE_SIZE);
>         if (!irqc)
>                 return -ENOMEM;

Doing the same of_machine_is_compatible() check again is an indicator that
you should switch to an of_device_id-based match interface...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
