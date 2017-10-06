Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <9635bb2d-8695-a168-d49e-0bd51807cc19@cogentembedded.com>
Date: Fri, 6 Oct 2017 05:47:25 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon, Geert,

Do you need extra actions from my side to accept this patch?

On 20.09.2017 15:32, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> [CC Pantelis]
>
> On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> Add the initial device tree for the M3ULCB with Kingfisher extension
>> infotainment board.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> ---
>> Changes in version 2:
>> - added own compatible value "shimafuji,kingfisher"
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Some food for thought below...
>
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
>> @@ -0,0 +1,19 @@
>> +/*
>> + * Device Tree Source for the M3ULCB Kingfisher board
>> + *
>> + * Copyright (C) 2017 Renesas Electronics Corp.
>> + * Copyright (C) 2017 Cogent Embedded, Inc.
>> + *
>> + * This file is licensed under the terms of the GNU General Public License
>> + * version 2.  This program is licensed "as is" without any warranty of any
>> + * kind, whether express or implied.
>> + */
>> +
>> +#include "r8a7796-m3ulcb.dts"
> Ideally, we don't include *.dts files, only *.dtsi.
> But I don't see a better immediate solution.
>
>> +#include "ulcb-kf.dtsi"
> As the Kingfisher is actually an expansion board for H3ULCB (with R-Car H3
> ES1.1 and ES2.0) and M3ULCB (with R-Car M3-W), turning ulcb-kf.dtsi into a
> DT overlay would make sense.
> That would also solve the issue of the 3 extra DTSes needed for all possible
> combinations of ULCB and Kingfisher (r8a7795-es1-h3ulcb-kf.dts,
> r8a7795-h3ulcb-kf.dts, r8a7796-h3ulcb-kf.dts (perhaps more to follow?)).
>
> But that's too premature, without upstream support for the easy loading of
> DT overlays.
>
>> +/ {
>> +       model = "Renesas M3ULCB Kingfisher board based on r8a7796";
>> +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
>> +                    "renesas,r8a7796";
>> +};
> And how to support from an overlay the addition of "shimafuji,kingfisher" to
> (not replacement of!) the main compatible value?
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


-- 
Regards,
Vladimir

