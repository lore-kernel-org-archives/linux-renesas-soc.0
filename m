Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753017AbdDDO3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 10:29:52 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVmwJYMzspVeDqToBrkfK+zGLMNhxGvEbqCA-vuCUXqoQ@mail.gmail.com>
References: <20170322142754.30888-1-chris.brandt@renesas.com>
 <20170322142754.30888-3-chris.brandt@renesas.com> <20170329012441.bxnkyqui24mymuvr@rob-hp-laptop>
 <CAMuHMdVmwJYMzspVeDqToBrkfK+zGLMNhxGvEbqCA-vuCUXqoQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Apr 2017 09:29:27 -0500
Message-ID: <CAL_JsqLLZsLzS4ONOexJADQXXXr9iquFUcVj8kX6AEVwM+x56A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] rtc: Add rtc-sh
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 1:49 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Rob,
>
> On Wed, Mar 29, 2017 at 3:24 AM, Rob Herring <robh@kernel.org> wrote:
>> On Wed, Mar 22, 2017 at 10:27:49AM -0400, Chris Brandt wrote:
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
>>> @@ -0,0 +1,29 @@
>>> +* Real Time Clock for Renesas SH and ARM SoCs
>>> +
>>> +Required properties:
>>> +- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
>>> +  fallback.
>>> +- reg: physical base address and length of memory mapped region.
>>> +- interrupts: 3 interrupts for alarm, period, and carry.
>>> +- interrupt-names: The interrupts should be labeled as "alarm", "period", and
>>> +  "carry".
>>> +- clocks: The functional clock source for the RTC controller must be listed
>>> +  first (if exists). Additionally, potential clock counting sources are to be
>>> +  listed.
>>> +- clock-names: The functional clock must be labeled as "fck". Other clocks
>>> +  may be named in accordance to the SoC hardware manuals.
>>> +
>>> +
>>> +Example:
>>> +rtc: rtc@fcff1000 {
>>> +     compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
>>> +     reg = <0xfcff1000 0x2e>;
>>> +     interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
>>> +                   GIC_SPI 277 IRQ_TYPE_EDGE_RISING
>>> +                   GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
>>> +     interrupt-names = "alarm", "period", "carry";
>>> +     clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
>>> +              <&rtc_x3_clk>, <&extal_clk>;
>>> +     clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
>>> +     power-domains = <&cpg_clocks>;
>>
>> Not documented.
>
> "power-domains" is a platform property.
>
> All hardware components need power.
> All synchronous hardware components need a clock.
> Most hardware components have a reset signal.

And we document clocks and reset for every binding.

> Whether these are exposed and can be controlled depends on the platform/SoC.
> So documenting them in each and every device binding looks overkill to me.
> I think this is something to be addressed by devicetree-specification (which
> doesn't handle clocks, power-domains, resets yet).

It's a question of validation. How do I validate power-domains is a
valid property for a given compatible? What if it is required, but not
present? Any node can have it? So it is valid for memory and chosen
nodes, an i2c device, an LCD panel, etc?

> If you prefer, the property can be removed from the example, though.

If it is valid, then I don't want it removed.

Rob
