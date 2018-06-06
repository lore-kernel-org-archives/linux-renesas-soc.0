Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:40839 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932312AbeFFJ2x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 05:28:53 -0400
Received: by mail-vk0-f65.google.com with SMTP id o71-v6so112674vke.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 02:28:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180606092725.GX17671@n2100.armlinux.org.uk>
References: <1528275154-5164-1-git-send-email-geert+renesas@glider.be>
 <20180606090953.GW17671@n2100.armlinux.org.uk> <CAMuHMdVq0Mwui6jrnX4sd2=L+p3Ta4qM2PxQ2HLQ0btajTV6hw@mail.gmail.com>
 <20180606092725.GX17671@n2100.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 11:28:51 +0200
Message-ID: <CAMuHMdUC-B9KLjioUvANzd0U0fMiy+48+zBHvZg=nX+o69RvEw@mail.gmail.com>
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

On Wed, Jun 6, 2018 at 11:27 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Wed, Jun 06, 2018 at 11:22:41AM +0200, Geert Uytterhoeven wrote:
>> On Wed, Jun 6, 2018 at 11:09 AM, Russell King - ARM Linux
>> <linux@armlinux.org.uk> wrote:
>> >> Fixes: cad160ed0a94927e ("ARM: shmobile: Convert file to use cntvoff")
>> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >
>> > This doesn't look right to me, but I don't have secure_cntvoff in any
>> > tree here that I can look at to check.  What if secure_cntvoff contains
>> > instructions only available on ARMv7 CPUs, and not ARMv4?
>>
>> Compiled != called.
>
> That makes little difference when the assembler validates that the
> instructions are possible on the target architecture and errors out
> if not.

The file does have ".arch armv7-a".

> That's why I qualified my reply by saying that I didn't have the
> contents of secure_cntvoff to reference - there's no clue whether
> it's a .c or .S file from just this patch, and there's no visibility
> what it contains.

https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?id=7c607944bc657616
https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?id=cad160ed0a94927e

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
