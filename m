Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36763 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbdIOTAO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 15:00:14 -0400
MIME-Version: 1.0
In-Reply-To: <323063a2-1256-fa25-b91c-4c726ab277a2@cogentembedded.com>
References: <20170912210543.810219167@cogentembedded.com> <d6f9d5ef-4864-3ffb-9406-acd65bff10aa@cogentembedded.com>
 <5c680bad-39c8-a6c7-ee2a-6a2e72c33026@cogentembedded.com> <CAMuHMdU+DYBCu1bKLh_VjuSR-cSfjwPQuAxTsaU2JW-3d-5QUw@mail.gmail.com>
 <323063a2-1256-fa25-b91c-4c726ab277a2@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Sep 2017 21:00:13 +0200
Message-ID: <CAMuHMdVUJb+QXtBqSX4La-GFS60dj2S2WkSte_kiDm7NXVxEoA@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: initial Eagle board device tree
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Sep 15, 2017 at 8:53 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 09/15/2017 09:44 PM, Geert Uytterhoeven wrote:
>>>>      Forgot to specify SCIF_CLK -- it's populated.
>>>
>>>     Unfortunately, the kernel hangs after ttySC0 is registered if I
>>> specify
>>> this frequency...
>>
>> Is the crystal populated?
>
>    It should be, with 14.7456MHz chrystal. But it's connected to SCIF_CLK_B
> pin -- perhaps that's the problem...
>
>> When doing initial bringup of the remote Eagle I have access to, the SCIF
>> registers didn't indicate SCIF_CLK was being used from U-Boot, while it
>> is used on R-Car Gen2 boards that have it populated.
>
>    Perhaps PFC is just not configured properly?

Plausible.
As there's no PFC driver yet (at least I haven't seen one ;-), you can try
configuring the PFC to use SCIF_CLK_B by writing to the registers
from the U-Boot prompt...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
