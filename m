Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51483 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731035AbeGTDvK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 23:51:10 -0400
Received: by mail-wm0-f66.google.com with SMTP id h3-v6so7572593wmb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 20:05:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUuNDf73sxfK6LuNZCjM7-N849qBRHobvojTot8PexH1w@mail.gmail.com>
References: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
 <20180719125934.GA1432@bigcity.dyn.berto.se> <CANqRtoSSoenVr35wvEmxX5in+Mpt5A3-gkKyFDS0fMeTBiHczQ@mail.gmail.com>
 <CAMuHMdUuNDf73sxfK6LuNZCjM7-N849qBRHobvojTot8PexH1w@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 20 Jul 2018 12:05:04 +0900
Message-ID: <CANqRtoRzqnhCnjLipFTnv9DcA9ehaf4d06WrqEJgOPyAR7XrFg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI files
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Fri, Jul 20, 2018 at 2:37 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Jul 19, 2018 at 7:16 PM Magnus Damm <magnus.damm@gmail.com> wrote=
:
>> On Thu, Jul 19, 2018 at 9:59 PM, Niklas S=C3=B6derlund
>> <niklas.soderlund@ragnatech.se> wrote:
>> > On 2018-07-19 20:19:50 +0900, Magnus Damm wrote:
>> >> --- 0001/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
>> >> +++ work/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi 2018-07-19 20:0=
4:10.900607110 +0900
>> >> @@ -1,6 +1,6 @@
>> >>  // SPDX-License-Identifier: GPL-2.0
>> >>  /*
>> >> - * Device Tree Source for the r8a7795 ES1.x SoC
>> >> + * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
>> >
>> > I'm just curies why do you append a extra 0 to the part number here an=
d
>> > for M3-W? Other then I think this change is good and will help me as
>> > well to map part number to product name :-)
>>
>> Good question!
>>
>> I should probably have mentioned in the patch description that the
>> names and part numbers come from the file
>> Documentation/devicetree/bindings/arm/shmobile.txt.
>
> To add to the confusion: R-Car H3 ES2.0 is actually R8A77951...

What a mess! I wonder what ES3.0 is?

Cheers,

/ magnus
