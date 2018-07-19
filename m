Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:38278 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732015AbeGSSWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 14:22:17 -0400
Received: by mail-vk0-f66.google.com with SMTP id b77-v6so4791801vkb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 10:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
 <20180719125934.GA1432@bigcity.dyn.berto.se> <CANqRtoSSoenVr35wvEmxX5in+Mpt5A3-gkKyFDS0fMeTBiHczQ@mail.gmail.com>
In-Reply-To: <CANqRtoSSoenVr35wvEmxX5in+Mpt5A3-gkKyFDS0fMeTBiHczQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jul 2018 19:37:54 +0200
Message-ID: <CAMuHMdUuNDf73sxfK6LuNZCjM7-N849qBRHobvojTot8PexH1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI files
To: Magnus Damm <magnus.damm@gmail.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Jul 19, 2018 at 7:16 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> On Thu, Jul 19, 2018 at 9:59 PM, Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2018-07-19 20:19:50 +0900, Magnus Damm wrote:
> >> --- 0001/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> >> +++ work/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi 2018-07-19 20:04:10.900607110 +0900
> >> @@ -1,6 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  /*
> >> - * Device Tree Source for the r8a7795 ES1.x SoC
> >> + * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
> >
> > I'm just curies why do you append a extra 0 to the part number here and
> > for M3-W? Other then I think this change is good and will help me as
> > well to map part number to product name :-)
>
> Good question!
>
> I should probably have mentioned in the patch description that the
> names and part numbers come from the file
> Documentation/devicetree/bindings/arm/shmobile.txt.

To add to the confusion: R-Car H3 ES2.0 is actually R8A77951...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
