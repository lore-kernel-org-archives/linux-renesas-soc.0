Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:41949 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755852AbeAHICR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 03:02:17 -0500
MIME-Version: 1.0
In-Reply-To: <20180108065911.dz2z4a4aaqjw6qfd@verge.net.au>
References: <20180105155447.10071-1-niklas.soderlund+renesas@ragnatech.se> <20180108065911.dz2z4a4aaqjw6qfd@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jan 2018 09:02:16 +0100
Message-ID: <CAMuHMdUNMoiEQS+Tk3o-FTz0_AKt+8GL3ju8_w174GJiCNoytw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: r8a779[56]: update register size for thermal
To: Simon Horman <horms@verge.net.au>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Jan 8, 2018 at 7:59 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 05, 2018 at 04:54:45PM +0100, Niklas S=C3=B6derlund wrote:
>> This series updates the register size for the thermal hardware. In later
>> versions of the datasheet one additional register is documented. This
>> register is needed to be able to determine if calibration data should be
>> read from register or if static values from the driver should be used.
>>
>> There is already a posted RFC patch which make use of this additional
>> register (THSCP) if the register size described in DT covers it.
>> Currently no hardware where the calibration value is fused have been
>> found so that patch is not tested and therefore kept back until such a
>> system is found. In the mean time there is no harm in getting the
>> correct register size described in DT now that it's documented in the
>> datasheet (Rev 0.80).
>>
>> * Changes since v1
>> - Increase size from just covering the new register in TSC1 to
>>   increasing the size of all TSC's to 0x100 which is the smallest
>>   granularity of the address decoder circuitry. Suggested by Geert.
>>
>> Niklas S=C3=B6derlund (2):
>>   arm64: dts: r8a7795: update register size for thermal
>>   arm64: dts: r8a7796: update register size for thermal
>
> Applied, but this seems to go in the opposite direction of:
>
> 846106d9d973 ("ARM: dts: r8a7793: Reduce size of thermal registers")
> 1af62038f499 ("ARM: dts: r8a7791: Reduce size of thermal registers")
> d0191d85a237 ("ARM: dts: r8a7790: Reduce size of thermal registers")
>
> Should those patches be dropped and the register areas grown to 0x100
> instead?

There are two "policies" to specify register block lengths:
  1. Cover all registers documented in the datasheet, and nothing more (at =
the
   low/high end),
  2. Use a power-of-two that covers all registers, which is most probably
    what matches the actual address decoder in the hardware.

Of course, we all know datasheets are volatile, and registers may appear or
disappear any time ;-)

In reality, ioremap() granularity is PAGE_SIZE, which is also a power-of-tw=
o.

So personally, I'm more leaning towards policy #2.

The 3 commits you refer to use policy #1, but covered a register not
documented in the datasheet.

Note that some drivers (SD?) use the register block lengths to check if a
feature is available or not. Ideally they should use the compatible value
instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
