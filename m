Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:36958 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754721AbdBPNvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2017 08:51:41 -0500
MIME-Version: 1.0
In-Reply-To: <PS1PR06MB1162A82F35F00D18D5D22FC08A5B0@PS1PR06MB1162.apcprd06.prod.outlook.com>
References: <20170213182532.4042-1-chris.brandt@renesas.com>
 <20170213182532.4042-3-chris.brandt@renesas.com> <CAMuHMdWdiosERjUm3ZxZiZL90_4j+CrNm9RU9GaPft7AXbN8kA@mail.gmail.com>
 <PS1PR06MB1162A82F35F00D18D5D22FC08A5B0@PS1PR06MB1162.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Feb 2017 14:51:40 +0100
Message-ID: <CAMuHMdVUdU4J+cg7V-rMK63TkEKJp_Nyxh=+34rdtuo1wGUNRw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: power: reset: add document for
 renesas-reset driver
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Feb 15, 2017 at 6:33 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, February 14, 2017, Geert Uytterhoeven wrote:
>> > +Required properties:
>> > +  - compatible: must be one or more of the following:
>> > +    - "renesas,r7s72100-reset" for the r7s72100 SoC
>> > +    - "renesas,wdt-reset"
>> > +                This is a fallback for the above renesas,*-reset
>> > +entries
>>
>> Please use "renesas,r7s72100-wdt". DT describes the hardware (watchdog),
>> not the software policy (use it for reset only, as a max. timeout of 125
>> ms is too short for a usable watchdog).
>
> I had a look at:
>
>   Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
>
> Which has:
>
> Required properties:
> - compatible : Should be "renesas,<soctype>-wdt", and
>                "renesas,rcar-gen3-wdt" as fallback.
>                Examples with soctypes are:
>                  - "renesas,r8a7795-wdt" (R-Car H3)
>                  - "renesas,r8a7796-wdt" (R-Car M3-W)
>
>
> So in my 'renesas-reset.txt' should I do:

As "reset" is software policy, perhaps you should instead extend the existing
binding document Documentation/devicetree/bindings/watchdog/renesas-wdt.txt?

Nothing says you have to use the same Linux driver for R-Car Gen3 and
RZ/A1.

> A. "renesas,r7s72100-wdt", "renesas,rz-wdt"

Please don't use plain "rz", as RZ/A, RZ/G, and RZ/T are completely different
beasts.

>
>   or just:
>
> B. "renesas,r7s72100-wdt"   (no fallback, change the driver to add new SoCs)

Do you know if future RZ/A SoCs will use the exact same type of WDT?
If yes, you can document both "renesas,r7s72100-wdt" and "renesas,rza-wdt",
and let the driver match against the latter.
Else I'd just document and match against "renesas,r7s72100-wdt".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
