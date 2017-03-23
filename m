Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:36703 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdCWIxA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 04:53:00 -0400
Received: by mail-io0-f175.google.com with SMTP id l7so78275852ioe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Mar 2017 01:52:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoSKHLsgaFtbZzEKESyM+SE6c6u3QkAFtGOiWCts2vqetQ@mail.gmail.com>
References: <148999976116.21495.8298900753704826597.sendpatchset@little-apple>
 <CAMuHMdWS7J8taujfNXZ6e-qNbw8xPi0Q4JyqNcAXobw6EvzzMg@mail.gmail.com>
 <CANqRtoRNP8Hwo3YgbT7c=NOhrDr2NqABWg=0xRDDX=dD29CFJA@mail.gmail.com>
 <CAMuHMdVb9Zm3UcPm5Xn=upLHiiMNj0pYkHGSJFN8i-3ttJ0cvw@mail.gmail.com> <CANqRtoSKHLsgaFtbZzEKESyM+SE6c6u3QkAFtGOiWCts2vqetQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2017 09:52:57 +0100
Message-ID: <CAMuHMdXYs3PfPEnqv3=2MbhW_BK2ywS_KVyNPWoEcKoyF0GwnA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Correct SATA device size to 2MiB
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Mar 23, 2017 at 9:30 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Tue, Mar 21, 2017 at 6:30 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Mar 21, 2017 at 8:17 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>> On Mon, Mar 20, 2017 at 7:57 PM, Geert Uytterhoeven
>>> <geert@linux-m68k.org> wrote:
>>>> On Mon, Mar 20, 2017 at 9:49 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>>>> --- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>>>> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi       2017-03-20 17:41:36.390607110 +0900
>>>>> @@ -1209,7 +1209,7 @@
>>>>>
>>>>>                 sata: sata@ee300000 {
>>>>>                         compatible = "renesas,sata-r8a7795";
>>>>> -                       reg = <0 0xee300000 0 0x1fff>;
>>>>> +                       reg = <0 0xee300000 0 0x200000>;
>>>>
>>>> While the datasheet does mention the 2 MiB area, it also says no (write)
>>>> access should be made to registers not listed in the table, while these are
>>>> all covered by the existing area?
>>>
>>> That bit about not writing to non-listed registers seems like just
>>> common sense to me, but perhaps there is more to the story than just
>>
>> Sure.
>>
>>> that? Like you say it is probably possible to use the driver with the
>>> existing 8K-1 size, but in my mind we should use window sizes defined
>>> in the data sheet for DT?
>>
>> The 2 MiB window size is a lot larger than needed to cover all documented
>> rregisters. Either there are more undocumented registers, or the hardware
>> engineers were lazy and just decoded the full 2 MiB block.
>
> Yeah, and on top of that it looks to me like the size is not aligned
> to the offset either. I would expect a 2MiB block to be aligned to a
> 2MiB boundary...

The base address was aligned to 2 miB on R-Car H1.
As of R-Car Gen2, it's no longer aligned. Too much copy-'n-paste...

>>>> BTW, what about the Reference Clock Source Select Register, which lies
>>>> in a further undocumented area?
>>>
>>> Yeah, no idea. This would be good task for the I/O or Core group to
>>
>> SATA is I/O.
>
> For sure, however I wonder how the external clock register REFSEL is
> supposed to be handled. It looks like an external hardware block
> somehow.

It's a single bit to select between internal and external clock.
No documention about which external clock.

>>> figure out how to handle. I'm surprised that the SATA DT device nodes
>>> with the strange and incorrect 0x1fff size got merged upstream without
>>> anyone thinking about that register that you are mentioning. Seems
>>> like supporting that should be part of SATA development for R-Car
>>> Gen3?
>>
>> Probably it was just an oversight. I almost missed it myself when
>> reviewing your patch.
>
> Probably yes.

It was up-ported from a patch in the BSP, which may predate the datasheet
revision that documented REFSEL.

>> The register is not present (not documented) on R-Car H1 and Gen2.
>> The IP core is derived from SH-Navi2G (sh7775), but no datasheet.
>
> On R-Car Gen3 there seem to be a chance that random glue hardware for
> other devices may also be present in the 0xe65exxxx range however
> documentations seem to be lacking...

And without documentation...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
