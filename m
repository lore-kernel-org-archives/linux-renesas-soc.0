Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYsE1oeDp1HnYAFMKG2iPTg06cAtD41vxrmZPP70MJQdA@mail.gmail.com>
References: <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAMuHMdXK9VmghZy1RounHWn-HDqgeT_12V_9RVihiuiajn+RDg@mail.gmail.com> <CACRpkdYsE1oeDp1HnYAFMKG2iPTg06cAtD41vxrmZPP70MJQdA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2017 13:11:52 +0200
Message-ID: <CAMuHMdXK7YB2zN4fz9XiqTuydxp7VvVV+wSgXWUYBB0evkp8dw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
To: Linus Walleij <linus.walleij@linaro.org>
Cc: jmondi <jacopo@jmondi.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On Fri, May 12, 2017 at 11:04 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, May 9, 2017 at 12:54 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
> Oops missed this:
>
>> Hence I think we should not use generic pin properties, but consider these
>> settings to be part of pinmux configuration.
>> As having large tables in the driver is undesirable, I think storing the
>> settings in the "pinmux" property (by encoding them as flags passed to the
>> RZA1_PINMUX() macro) is our best option.
>
> I think it is better to have large tables in the driver in this case.

Jacopo, Chris: Would two bits per pin/function (none, input, output, bidir)
be sufficient?
That makes one u16 per pin. So roughtly 12 ports x 16 pins => 384 bytes.
Plus code to handle it. After all not that bad...

> It is the lesser evil.
>
> Having unintelligible and hard to grasp stuff in the device tree that
> no user will understand or dare to touch is not good, then it is better
> to have it with the code, where it is being used, so the developers of
> the driver can see it when they are dealing with this (quirky) hardware.
>
> As you say this is actually fixing hardware bugs, we can expect these
> quirky tables to be gone in the next hardware generation, right?

Let's hope so. Chris has a better crystal ball than I have ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
