Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:39299 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751221AbeAENDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 08:03:31 -0500
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11653DA8D7101215AECE3B698A1C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20180104200150.11352-1-chris.brandt@renesas.com>
 <20180104200150.11352-4-chris.brandt@renesas.com> <CAMuHMdWmoi3D9-XGXjefCsB2SgNjAH_G6uteSaTiWAN_krXhng@mail.gmail.com>
 <SG2PR06MB11653DA8D7101215AECE3B698A1C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jan 2018 14:03:29 +0100
Message-ID: <CAMuHMdVq6FcCE0G5c3fm-GvAfORyNy9zwO5j-Ph-4oTN9+wsvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: r7s72100: add USB device to device tree
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 5, 2018 at 1:54 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, January 05, 2018, Geert Uytterhoeven wrote:
>> > +               interrupts = <GIC_SPI (73-32) IRQ_TYPE_LEVEL_HIGH>;
>>
>> "41", all other interrupt properties already have the SPI offset
>> subtracted?
>
> The actual HW vector number in the hardware manual is '73'.
> As you know, you need to subtract 32 for the number you use in the
> device tree.
> But then...the number goes back to '73' when you look at it in
> /proc/interrupts.

Having an identical number in /proc/interrupts is a coincidence.
These numbers are virtual, and may change even across reboots.

> So it was confusing to people on what number you needed to use.
>
> Therefore in the RZ/A1 BSP, I was doing (xx-32) so at least people could
> see the relationship between what's in the hardware manual and what
> gets put into the device tree.
>
> So, if doing (73-32) looks wrong, I can change it back to '41' for the
> upstream version.
>
> Any opinions????

Not really, except that no single .dts(i) file seems to have "- 32".

Note that e.g. the R-Car Gen3 manuals do list both "interrupt ID"
and "SGI, PPI, or SPI No" in the documentation for INTC-AP.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
