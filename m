Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1491401247-7030-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org> <1491401247-7030-5-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Apr 2017 16:27:16 +0200
Message-ID: <CAMuHMdUZYCsUaAsEpDtTDoHThJza2sQUtcXP5T+h6vH4QVbRCg@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] arm: dts: dt-bindings: Add Renesas RZ/A1 pinctrl header
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> @@ -0,0 +1,16 @@
> +/*
> + * Defines macros and constants for Renesas RZ/A1 pin controller pin
> + * muxing functions.
> + */
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +
> +#define RZA1_PINS_PER_PORT     16
> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 16 bits the alternate function identifier
> + */
> +#define RZA1_PINMUX(b, p, f)   ((b) * RZA1_PINS_PER_PORT + (p) | (f << 16))

... | (f) << 16)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
