Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35375 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750704AbdAXHwK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 02:52:10 -0500
Received: by mail-io0-f193.google.com with SMTP id m98so17670812iod.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 23:52:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jan 2017 08:52:06 +0100
Message-ID: <CAMuHMdXj_5YX_9ndUMfohkk=PMOLbuYUF0N8yxfYC_zbCpGLBw@mail.gmail.com>
Subject: Re: [RFC] Runtime PM on the RZ/A series is never going to work right
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Mon, Jan 23, 2017 at 8:58 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> One difference between R-Car/RZG vs RZA is that there is no status bits for the MSTP clocks.
> This means even though you enable a clock by clearing the module-stop bit, you're not really guaranteed that the peripheral block is ready to be used.
>
> For the most part, the register interface is accessible, but usage of the HW might not be fully ready.
>
> Now that clock enable/disable has been fixed for RZ/A1 and actually works, you can start to see things break.
>
> For RZ/A1 (r7s72100) you can see this for the I2C driver (i2c-riic.c) and SPI driver (spi-rspi.c).
> Both of these drivers disable the clock in between EVERY TRANSFER as a means of runtime pm.
>
> Since SDHI (tmio) needs to keep the clock running for the card detect logic, it does not implement runtime pm, so it's OK.
>
>
> The only way to really fix this for RZ/A1 is to put an arbitrary delay in the clk-mstp.c driver:
>
>         spin_lock_irqsave(&group->lock, flags);
>
>         value = cpg_mstp_read(group, group->smstpcr);
>         if (enable)
>                 value &= ~bitmask;
>         else
>                 value |= bitmask;
>         cpg_mstp_write(group, value, group->smstpcr);
>
>         spin_unlock_irqrestore(&group->lock, flags);
>
> +       if (enable || !group->mstpsr)
> +               udelay(100);
> +
>         if (!enable || !group->mstpsr)
>                 return 0;
>
>
> Or, just remove runtime PM for RZ/A1.
>
> * i2c-riic.c: This driver is just for the RZ/A series, so just remove runtime pm completely
> * spi-rspi.c: Disable runtime pm just for RZ/A series parts
>
>
> Therefore, before I start firing off patches to remove runtime PM for RZ/A, does anyone have an opinion one way of the other????

Please have a look at Section 55.3.5 ("Module Standby Function"), which
I had never read myself, apparently...

Seems like there is some kind of status register, the STBCR register itself:

    Canceling Module Standby Function:
        1. Clear the MSTP bit to 0.
        2. After that, dummy-read the same register.

Does it help if you add the dummy read when enabling the clock?

However, that section reveals another complicating factor for some modules:
if the module has a bit in a STBREQn/STBACKn register, a module standy
request must be sent to the module before stopping the module clock.

Looks like you're gonna need a whole new RZ/A1-specific clock driver to
handle all these details...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
