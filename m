Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:39456 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbdKWJtO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 04:49:14 -0500
MIME-Version: 1.0
In-Reply-To: <20171123094657.r2wjbmvrn24ohrn6@verge.net.au>
References: <20171120110125.12267-1-horms+renesas@verge.net.au>
 <CAMuHMdXqPqhiCZFseBGFDEh9R+_kFcrmjWWgCSudtnHkuXoFgw@mail.gmail.com> <20171123094657.r2wjbmvrn24ohrn6@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Nov 2017 10:49:13 +0100
Message-ID: <CAMuHMdX4voo+HOx69Wj7B+kDwyqb8KNSQVwWnUcCqLR_27aBiA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Move nodes which have no
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

On Thu, Nov 23, 2017 at 10:46 AM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Nov 23, 2017 at 10:27:55AM +0100, Geert Uytterhoeven wrote:
>> On Mon, Nov 20, 2017 at 12:01 PM, Simon Horman
>> <horms+renesas@verge.net.au> wrote:
>> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > @@ -126,6 +126,86 @@
>>
>> The node above is called "cpus".
>>
>> >                 };
>> >         };
>> >
>> > +       pmu_a57 {
>>
>> > +       };
>> > +
>> > +       pmu_a53 {
>>
>> > +       };
>> > +
>> > +       timer {
>>
>> > +       };
>> > +
>> > +       thermal-zones {
>>
>> > +       };
>> > +
>> >         extal_clk: extal {
>> >                 compatible = "fixed-clock";
>> >                 #clock-cells = <0>;
>>
>> Any sorting rules (alphabetically?) for nodes at the root level?
>
> Now would be a good time to decide on an alternate on an order as
> I plan to submit similar patches for several other SoCs.
>
> I took used order they were already present (with other nodes) in the
> cpu node. They appear to be sorted alphabetically. Should I keep that
> sort order relative to existing nodes present in the root node?

I think you should.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
