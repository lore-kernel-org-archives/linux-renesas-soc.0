Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33814 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752703AbcH3PQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 11:16:00 -0400
Received: by mail-it0-f65.google.com with SMTP id e63so2307872ith.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2016 08:15:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160830145430.2182-1-wsa+renesas@sang-engineering.com>
References: <20160830145430.2182-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Aug 2016 17:15:58 +0200
Message-ID: <CAMuHMdWdtVAY=4WiJWQfWtb5P71seANESm8tjLKpBboRwwJBMw@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: fix regulator quirk for Gen2
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Aug 30, 2016 at 4:54 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The current implementation only works if the da9xxx devices are added
> before their drivers are registered. Only then it can apply the fixes to
> both devices. Otherwise, the driver for the first device gets probed
> before the fix for the second device can be applied. This is what
> fails when using the IP core switcher or when having the i2c master
> driver as a module.

Thanks a lot!
That could also happen when irqc is a victim of deferred probing.

> So, we need to disable both da9xxx once we detected one of them. We now
> use i2c_transfer with hardcoded i2c_messages and device addresses, so we
> don't need the da9xxx client devices to be instantiated. Because the
> fixup is used on specific boards only, the addresses are not going to
> change.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (r8a7791/koelsch)

> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> @@ -41,39 +41,25 @@
>
>  #define REGULATOR_IRQ_MASK     BIT(2)  /* IRQ2, active low */
>
> -static void __iomem *irqc;
> -
> -static const u8 da9063_mask_regs[] = {
> -       DA9063_REG_IRQ_MASK_A,
> -       DA9063_REG_IRQ_MASK_B,
> -       DA9063_REG_IRQ_MASK_C,
> -       DA9063_REG_IRQ_MASK_D,
> -};

At first I was puzzled by the removal of all the _B, _C, and _C registers...

> -
> -/* DA9210 System Control and Event Registers */
> +/* start of DA9210 System Control and Event Registers */
>  #define DA9210_REG_MASK_A              0x54
> -#define DA9210_REG_MASK_B              0x55
> -
> -static const u8 da9210_mask_regs[] = {
> -       DA9210_REG_MASK_A,
> -       DA9210_REG_MASK_B,
> -};

> +static u8 da9063_irq_clr[] = { DA9063_REG_IRQ_MASK_A, 0xff, 0xff, 0xff, 0xff };
> +static u8 da9210_irq_clr[] = { DA9210_REG_MASK_A, 0xff, 0xff };

... so you may want to add a comment that _A 'till _D resp. _A and _B are
cleared.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
