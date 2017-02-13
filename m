Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36004 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752157AbdBMKly (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 05:41:54 -0500
Received: by mail-it0-f65.google.com with SMTP id f200so12673915itf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2017 02:41:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11654A11A81D46A70DB1D1BF8A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209191259.29774-1-chris.brandt@renesas.com>
 <CAMuHMdVhbpfsLEn3Ke5f93AhaOnS4TSJC+QpY8xdtT1MNejVJA@mail.gmail.com>
 <SG2PR06MB11657431F033ABBDE1D750F38A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com> <SG2PR06MB11654A11A81D46A70DB1D1BF8A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2017 11:41:47 +0100
Message-ID: <CAMuHMdUJjdhg1j=sgxGLoLh-h91hS6peKJC_eA0wHJx8NbdBZA@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: r7s72100: add restart handler
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Feb 10, 2017 at 8:46 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, February 10, 2017, Geert Uytterhoeven wrote:
>> Alternatively, you can write a restart driver (cfr.
>> drivers/power/reset/rmobile-reset.c) that binds against a
>> "renesas,r7s72100-wdt" device node, but doesn't implement watchdog
>> functionality.
>> You're gonna need DT bindings anyway.
>
> I like that idea. That should take me no time at all.
> Thank you.
>
> Do you think I can still keep my 'weak function' idea in there??
>
>
> extern void __attribute__ ((weak)) prepare_for_restart(void)
> {
>         /* override to do board specific stuff */
> }
>
> static int renesas_wdt_reset_handler(struct notifier_block *this,
>                                  unsigned long mode, void *cmd)
> {
>         pr_debug("%s %lu\n", __func__, mode);
>
>         prepare_for_restart();
>
>         /* set WDT for reset */
>         . . .
>
>         return NOTIFY_DONE;
> }

What do you want to use the board-specific function for?
Have a board-specific reset handler, or do some preparatory cleanup?

In case of the former, please write a separate driver that registers  a
reset handler with a higher priority.
In case of the latter, please use register_reboot_notifier() in the driver
that needs it.

> Or...do you think I can just use the rmobile-reset.c driver and
> just add WDT to it?
>
> Honestly, the only thing different will be rmobile_reset_handler().
> I could make a rmobile_wdt_reset_handler() and I could just pass in
> a different notifier_block depending on the DT.
>
> What do you think?

Given the small amount of code to add to the existing driver, and the sheer
amount of boilerplate for writing a new driver, I'm inclined to say yes.
But in the end, it's up to the subsystem maintainer to decide.

> static const struct of_device_id rmobile_reset_of_match[] = {
>         { .compatible = "renesas,sysc-rmobile", },
>         { .compatible = "renesas,wdt-rmobile", },

renesas,r7s72100-wdt

>         { /* sentinel */ }
> };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
