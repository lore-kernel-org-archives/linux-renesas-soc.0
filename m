Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:39954 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbeEQNMY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 09:12:24 -0400
Received: by mail-vk0-f66.google.com with SMTP id e67-v6so2644490vke.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 May 2018 06:12:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180517090438.pqggltzkcdhzktsp@verge.net.au>
References: <1526387370-17142-1-git-send-email-gilad@benyossef.com>
 <1526387370-17142-4-git-send-email-gilad@benyossef.com> <CAMuHMdWzeNqsho1V6ezZb81T3_HcRzrtuQpmGXsjtFgt9BtZDQ@mail.gmail.com>
 <20180516074333.i2672u435ymwffk3@verge.net.au> <CAOtvUMfFjokOLCg6aHNQESJ_q4Jiok3izrPtae5wR+cND=XL6g@mail.gmail.com>
 <20180517090438.pqggltzkcdhzktsp@verge.net.au>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Thu, 17 May 2018 16:12:23 +0300
Message-ID: <CAOtvUMcnrPnkx35Sgru+3EUxYn+FY9FmDSYSNnZEaVUODHA7+w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a7795: add ccree binding
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Ofir Drang <ofir.drang@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 17, 2018 at 12:04 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, May 17, 2018 at 11:01:57AM +0300, Gilad Ben-Yossef wrote:
>> On Wed, May 16, 2018 at 10:43 AM, Simon Horman <horms@verge.net.au> wrote:
>> > On Tue, May 15, 2018 at 04:50:44PM +0200, Geert Uytterhoeven wrote:
>> >> Hi Gilad,
>> >>
>> >> On Tue, May 15, 2018 at 2:29 PM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
>> >> > Add bindings for CryptoCell instance in the SoC.
>> >> >
>> >> > Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
>> >>
>> >> Thanks for your patch!
>> >>
>> >> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> >> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> >> > @@ -528,6 +528,14 @@
>> >> >                         status = "disabled";
>> >> >                 };
>> >> >
>> >> > +               arm_cc630p: crypto@e6601000 {
>> >> > +                       compatible = "arm,cryptocell-630p-ree";
>> >> > +                       interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
>> >> > +                       #interrupt-cells = <2>;
>> >>
>> >> I believe the #interrupt-cells property is not needed.
>> >>
>> >> > +                       reg = <0x0 0xe6601000 0 0x1000>;
>> >> > +                       clocks = <&cpg CPG_MOD 229>;
>> >> > +               };
>> >>
>> >> The rest looks good, but I cannot verify the register block.
>> >>
>> >> > +
>> >> >                 i2c3: i2c@e66d0000 {
>> >> >                         #address-cells = <1>;
>> >> >                         #size-cells = <0>;
>> >
>> > Thanks, I have applied this after dropping the #interrupt-cells property.
>>
>> Thanks you!
>>
>> Alas, it will not work without the clk patch (the previous one in the
>> series) so they need to be
>> taken or dropped together.
>
> I think its fine if it does not yet work.
> But not if its causes things that previously worked to stop working.

Based on the further discussion with Geert my recommendation is to
drop my patch for now,
take Geert CR clock  patch and I will follow up next week with a v2
that fixes the clock
handing as discussed with Geert.

Many thanks,
Gilad



-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru
