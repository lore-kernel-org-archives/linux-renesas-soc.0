Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34239 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751422AbdFHJ0q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 05:26:46 -0400
Received: by mail-it0-f65.google.com with SMTP id 201so1484060itu.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jun 2017 02:26:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB07020A244304230FD27FB68FB7C90@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1496908117-19368-1-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdUg2Ox7ATSBKMiCua=VekEaoPZLpyQXGg=45XWV+12imA@mail.gmail.com> <TY1PR06MB07020A244304230FD27FB68FB7C90@TY1PR06MB0702.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jun 2017 11:26:39 +0200
Message-ID: <CAMuHMdXDGpb5Vb8f_cN=O2WNswqQMdxWc4e_X2C1D07mm4ODxQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: debug-ll: Add support for r8a7743
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Jun 8, 2017 at 10:50 AM, Chris Paterson
<Chris.Paterson2@renesas.com> wrote:
>> > --- a/arch/arm/Kconfig.debug
>> > +++ b/arch/arm/Kconfig.debug
>> > @@ -895,12 +895,13 @@ choice
>> >                   via SCIF2 on Renesas R-Car H1 (R8A7779).
>> >
>> >         config DEBUG_RCAR_GEN2_SCIF0
>> > -               bool "Kernel low-level debugging messages via SCIF0 on
>> R8A7790/R8A7791/R8A7792/R8A7793"
>> > -               depends on ARCH_R8A7790 || ARCH_R8A7791 || ARCH_R8A7792
>> || ARCH_R8A7793
>> > +               bool "Kernel low-level debugging messages via SCIF0 on
>> R8A7743/R8A7790/R8A7791/R8A7792/R8A7793"
>>
>> This line is becoming a bit long, and it'll only become worse in the future.
>> What about "Kernel low-level debugging messages via SCIF0 on R-Car Gen2"?
>
> What about "Kernel low-level debugging messages via SCIF0 on R-Car Gen2 and RZ/G1"?

Oops, of course. That's what I intended to type ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
