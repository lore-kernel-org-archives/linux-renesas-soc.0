Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35475 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753663AbeCVJzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Mar 2018 05:55:14 -0400
Received: by mail-qt0-f195.google.com with SMTP id s2so8249712qti.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Mar 2018 02:55:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWF7Y29o_hA3GNCXJVvDHSmT9=D_KqqKst8Z_gWaNN1mw@mail.gmail.com>
References: <152153402203.8610.10666108438721508284.sendpatchset@little-apple>
 <152153403990.8610.2910800250912629335.sendpatchset@little-apple> <CAMuHMdWF7Y29o_hA3GNCXJVvDHSmT9=D_KqqKst8Z_gWaNN1mw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Mar 2018 10:55:13 +0100
Message-ID: <CAMuHMdUSUHYtjK6pJbRvz09RGeF-0Rp4RuL342dPNSkfxdQKyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: sh73a0 KZM9 as unhandled IRQs on boot
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Wed, Mar 21, 2018 at 11:34 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Mar 20, 2018 at 9:20 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Booting sh73a0 KZM9G results in the following on the console:
>>
>> [    0.030000] renesas_intc_irqpin e6900000.interrupt-controller: driving 8 irqs
>> [    0.040000] random: crng init done
>> [    0.120000] irq 35: nobody cared (try booting with the "irqpoll" option)
>> [    0.120000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc5 #4
>> [    0.120000] Hardware name: Generic SH73A0 (Flattened Device Tree)
>> ...
>> [    0.120000] Disabling IRQ #35
>> [    0.120000] renesas_intc_irqpin e6900004.interrupt-controller: driving 8 irqs
>
> Thanks for bringing this to my attention again. I always assumed it was one of
> the IIO devices keeping an IRQ line asserted, but it turns out I was wrong...
>
>> Judging by the friendly board documentation there is nothing hooked up to
>> that IRQ line. I wish we had proper schematics and not a less detailed
>> board manual.
>
> Oh there is: PORT54/IRQ10/FSICCK is driven by the same 11.2896 MHz
> oscillator (OSC4) as FSIACK.
>
>> With this patch I've tried to extend the irqpin driver to mask all interrupts
>> on boot but it does not seem to help. Perhaps the PFC hardware needs to be
>> configured somehow. More effort is needed to solve this issue.
>
> That pin is part of the HDMI interface, cfr. section 5.27.
>
> I've tried the below, but it doesn't work, as the interrupt controller is probed
> before the pfc (it has to, due to dependencies from pfc on irqpin[0-3]).
>
> --- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
> @@ -331,6 +331,15 @@
>  };
>
>  &pfc {
> +       pinctrl-0 = <&fsic_pins>;
> +       pinctrl-names = "default";
> +
> +       fsic_pins: hdmi {
> +               /* FSICCK is driven by OSC4, causing interrupt storm */
> +               groups = "fsic_mclk_in";
> +               function = "fsic";
> +       };
> +
>         i2c3_pins: i2c3 {
>                 groups = "i2c3_1";
>                 function = "i2c3";
>
> So probably we need some early quirk in pfc-sh73a0.c, to configure the
> pin as fsicck on kzm9g.

That's done by switching PORT54 from FN0 to FN6, i.e. changing 0xe6051036
from 0xa0 to 0xa6.

I did that from U-Boot, and verified it's still that way when the PFC driver
initializes, but it doesn't help, with or without your patch.

So it seems more likely the intc-irqpin driver is not disabling interrupts that
are not requested?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
