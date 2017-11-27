Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:33446 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751292AbdK0LPk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 06:15:40 -0500
MIME-Version: 1.0
In-Reply-To: <20171127110430.ulgjrzgy3pdugs2s@verge.net.au>
References: <20171124105234.25774-1-horms+renesas@verge.net.au>
 <CAMuHMdW9V6Bkh5uS9qNA7awtygEs=qRd7jigwSHmpV2VM3n9dA@mail.gmail.com> <20171127110430.ulgjrzgy3pdugs2s@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2017 12:15:39 +0100
Message-ID: <CAMuHMdUm=PiGVWVg9pyNTR5z2WjLcoG1uecBNBeKsSxbAxBt8w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Move nodes which have no
 reg property out of bus
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Nov 27, 2017 at 12:04 PM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Nov 24, 2017 at 12:09:47PM +0100, Geert Uytterhoeven wrote:
>> On Fri, Nov 24, 2017 at 11:52 AM, Simon Horman
>> <horms+renesas@verge.net.au> wrote:
>> > Move pmu_a5[73], timer and thermal-zones nodes from soc node to root node.
>> > The nodes that have been moved do not have any register properties and thus
>> > shouldn't be placed on the bus.
>> >
>> > This problem is flagged by the compiler as follows:
>> > $ make
>> > ...
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
>> >
>> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> > ---
>> > v2
>> > * Preserve alphabetical order of nodes present in root node.
>>
>> Thanks for the update!
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I just noticed that with this patch applied I now see:
>
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53
> arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
> arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
>
> arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer

Right, the "interrupt-parent = <&gic>;" inside the /soc node applies to child
nodes of the /soc node only.

You can find this in two ways:

  1. Add "interrupt-parent = <&gic>;" to the /pmu_a57 and /pmu_a53 nodes.
  2. Switch those nodes from "interrupt" to "interrupts-extended", e.g. turn

        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,

     into

        interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,

The latter is what e.g. arch/arm/boot/dts/armada-375.dtsi does.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
