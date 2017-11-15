Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:53456 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758779AbdKOQVI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 11:21:08 -0500
MIME-Version: 1.0
In-Reply-To: <1017d8fb-e353-f212-09a9-a28bf07eddc2@cogentembedded.com>
References: <20171110200714.406365231@cogentembedded.com> <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
 <1017d8fb-e353-f212-09a9-a28bf07eddc2@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2017 17:21:07 +0100
Message-ID: <CAMuHMdX8j__iF5xP33Na9pVM1nRWvrE7e68-zg0oE0gE5MOHXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Nov 14, 2017 at 7:00 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 11/14/2017 11:44 AM, Geert Uytterhoeven wrote:
>>> Add the (previously omitted) EtherAVB pin data to the Eagle board's
>>> device tree.

>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>> @@ -34,6 +34,9 @@
>
> [...]
>>>
>>> @@ -53,6 +56,11 @@
>>>   };
>>>
>>>   &pfc {
>>> +       avb_pins: avb {
>>> +               groups = "avb0_mdio", "avb0_mii";
>>
>>
>> Oh no, its'called "avb0_mdio" here, but "avb(0)_mdc" on all other
>> R-Car Gen3 SoCs?
>
>
>    Can you remember the reason? I don;t want to follow the bad example. :-)

Sorry, I don't know.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
