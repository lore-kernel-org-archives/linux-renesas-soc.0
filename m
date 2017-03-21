Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34120 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755241AbdCUHRh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 03:17:37 -0400
Received: by mail-wm0-f47.google.com with SMTP id 196so1125461wmm.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2017 00:17:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWS7J8taujfNXZ6e-qNbw8xPi0Q4JyqNcAXobw6EvzzMg@mail.gmail.com>
References: <148999976116.21495.8298900753704826597.sendpatchset@little-apple> <CAMuHMdWS7J8taujfNXZ6e-qNbw8xPi0Q4JyqNcAXobw6EvzzMg@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 21 Mar 2017 16:17:34 +0900
Message-ID: <CANqRtoRNP8Hwo3YgbT7c=NOhrDr2NqABWg=0xRDDX=dD29CFJA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Correct SATA device size to 2MiB
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Mon, Mar 20, 2017 at 7:57 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Mon, Mar 20, 2017 at 9:49 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Update the r8a7795 SATA device node to use a 2MiB I/O space as specified
>> in the "72. Serial-ATA" section of R-Car-Gen3-rev0.52E.pdf
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks.

>> --- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi       2017-03-20 17:41:36.390607110 +0900
>> @@ -1209,7 +1209,7 @@
>>
>>                 sata: sata@ee300000 {
>>                         compatible = "renesas,sata-r8a7795";
>> -                       reg = <0 0xee300000 0 0x1fff>;
>> +                       reg = <0 0xee300000 0 0x200000>;
>
> While the datasheet does mention the 2 MiB area, it also says no (write)
> access should be made to registers not listed in the table, while these are
> all covered by the existing area?

That bit about not writing to non-listed registers seems like just
common sense to me, but perhaps there is more to the story than just
that? Like you say it is probably possible to use the driver with the
existing 8K-1 size, but in my mind we should use window sizes defined
in the data sheet for DT?

> BTW, what about the Reference Clock Source Select Register, which lies
> in a further undocumented area?

Yeah, no idea. This would be good task for the I/O or Core group to
figure out how to handle. I'm surprised that the SATA DT device nodes
with the strange and incorrect 0x1fff size got merged upstream without
anyone thinking about that register that you are mentioning. Seems
like supporting that should be part of SATA development for R-Car
Gen3?

Thanks,

/ magnus
