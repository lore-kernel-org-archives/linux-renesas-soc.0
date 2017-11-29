Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932189AbdK2NgP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 08:36:15 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXoDNt7j-hEZmDA2BFFPUAfsi1ukZWowJ3=kTswyYMk5Q@mail.gmail.com>
References: <20171124105234.25774-1-horms+renesas@verge.net.au>
 <CAMuHMdW9V6Bkh5uS9qNA7awtygEs=qRd7jigwSHmpV2VM3n9dA@mail.gmail.com>
 <20171127110430.ulgjrzgy3pdugs2s@verge.net.au> <CAMuHMdUm=PiGVWVg9pyNTR5z2WjLcoG1uecBNBeKsSxbAxBt8w@mail.gmail.com>
 <20171128085645.ofrk33bfqd736sip@verge.net.au> <CAMuHMdXoDNt7j-hEZmDA2BFFPUAfsi1ukZWowJ3=kTswyYMk5Q@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 29 Nov 2017 07:35:53 -0600
Message-ID: <CAL_JsqKffs+5s92kWFeDivdgk2mVBmHrKuNDCfR9Lb=te5k33A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Move nodes which have no
 reg property out of bus
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 3:04 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Simon,
>
> On Tue, Nov 28, 2017 at 9:56 AM, Simon Horman <horms@verge.net.au> wrote:
>> On Mon, Nov 27, 2017 at 12:15:39PM +0100, Geert Uytterhoeven wrote:
>>> On Mon, Nov 27, 2017 at 12:04 PM, Simon Horman <horms@verge.net.au> wrote:
>>> > I just noticed that with this patch applied I now see:
>>> >
>>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
>>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53
>>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
>>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
>>> >
>>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
>>>
>>> Right, the "interrupt-parent = <&gic>;" inside the /soc node applies to child
>>> nodes of the /soc node only.
>>>
>>> You can find this in two ways:
>
> s/find/fix/
>
>>>
>>>   1. Add "interrupt-parent = <&gic>;" to the /pmu_a57 and /pmu_a53 nodes.
>>>   2. Switch those nodes from "interrupt" to "interrupts-extended", e.g. turn
>>>
>>>         interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>>      into
>>>
>>>         interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>> The latter is what e.g. arch/arm/boot/dts/armada-375.dtsi does.
>>
>> Thanks, I took option 1 as it seems consistent with the rest of the
>> Renesas DT files. I also added it to the /timer node.
>
> Actually we recently had a discussion about this on IRC, triggered by a
> similar issue in board files (see e.g, Ethernet PHY interrupts).
>
> Given the following comment:
>
> drivers/of/irq.c:       /* Try the new-style interrupts-extended first */
> drivers/of/irq.c:       res = of_parse_phandle_with_args(device,
> "interrupts-extended",
>
> I think it would be better to use interrupts-extended for individual/isolated
> use outside the /soc node.

I disagree. There's no point to use interrupts-extended unless you
have 2 or more interrupt parents. Just set interrupt-parent in the
root node.

Rob
