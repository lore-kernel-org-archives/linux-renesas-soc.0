Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:45083 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932349AbeFFJWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 05:22:43 -0400
Received: by mail-ua0-f193.google.com with SMTP id k14-v6so3597989uao.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 02:22:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180606090953.GW17671@n2100.armlinux.org.uk>
References: <1528275154-5164-1-git-send-email-geert+renesas@glider.be> <20180606090953.GW17671@n2100.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 11:22:41 +0200
Message-ID: <CAMuHMdVq0Mwui6jrnX4sd2=L+p3Ta4qM2PxQ2HLQ0btajTV6hw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Build secure_cntvoff.S unconditionally to fix
 shmobile !SMP build
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,

On Wed, Jun 6, 2018 at 11:09 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Wed, Jun 06, 2018 at 10:52:34AM +0200, Geert Uytterhoeven wrote:
>> If CONFIG_SMP=n, building a kernel for R-Car Gen2 fails with:
>>
>>     arch/arm/mach-shmobile/setup-rcar-gen2.o: In function `rcar_gen2_timer_init':
>>     setup-rcar-gen2.c:(.init.text+0x30): undefined reference to `secure_cntvoff_init'
>>
>> Indeed, on R-Car Gen2 SoCs, secure_cntvoff_init() is not only needed for
>> secondary CPUs, but also for the boot CPU.  This is most visible on SoCs
>> with Cortex A7 cores (e.g. R-Car E2, cfr. commit 9ce3fa6816c2fb59 ("ARM:
>> shmobile: rcar-gen2: Add CA7 arch_timer initialization for r8a7794")),
>> but Cortex A15 is affected, too.
>>
>> Fix this by always providing secure_cntvoff_init().
>>
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> Fixes: 7c607944bc657616 ("ARM: smp: Add initialization of CNTVOFF")

Interestingly, the commit description says:

   "It should be done by the bootloader but it is currently not the case,
    even for boot CPU because this SoC is booting in secure mode."
    ^^^^^^^^^^^^^^^^^

So it should be called for !SMP on sunxi, too?

>> Fixes: cad160ed0a94927e ("ARM: shmobile: Convert file to use cntvoff")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This doesn't look right to me, but I don't have secure_cntvoff in any
> tree here that I can look at to check.  What if secure_cntvoff contains
> instructions only available on ARMv7 CPUs, and not ARMv4?

Compiled != called.

> It makes no sense (to me) to always build this.

But you're right, making it depend on CPU_V7 is better.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
