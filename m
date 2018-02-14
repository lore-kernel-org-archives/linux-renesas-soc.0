Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1518515162-23663-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org> <1518515162-23663-5-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 14:37:08 +0100
Message-ID: <CAMuHMdUpEjnNa4kru7mUnvhTu2YoofoopuCvUp=AGdRJqfaNEw@mail.gmail.com>
Subject: Re: [PATCH 04/15] pinctrl: sh-pfc: Initial R-Car M3-N support
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tue, Feb 13, 2018 at 10:45 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:
> Add initial PFC support for R-Car M3-N (r8a77965) SoC.
> No groups or functions defined, just pin and registers enumeration.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

Looks mostly OK to me.
You do want to compare with pfc-r8a7796.c: all differences not related to
SATA_DEVSL, FSCLK, DU_DOTCLKIN2/3, and PRESET are issues that were fixed
recently in pfc-r8a7796.c, and should apply to pfc-r8a77965.c, too.

That leaves us with very few differences only, but it won't be trivial to have
a combined M3-W/N PFC driver, I'm afraid.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
