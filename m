Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1490026491-21742-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org> <1490026491-21742-4-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Mar 2017 11:35:35 +0100
Message-ID: <CAMuHMdUYZ0+468Djucy2NXXUq7LOZMUwm-3YmiFATVQa=M_CTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 20, 2017 at 5:14 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add dt-bindings for Renesas r7s72100 pin controller header file.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h
>
> diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> new file mode 100644
> index 0000000..98852d3
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> @@ -0,0 +1,36 @@
> +/*
> + * Defines macros and constants for Renesas RZ/A1 pin controller pin
> + * muxing functions.
> + */
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +
> +#define RZA1_PINS_PER_PORT     16
> +
> +/* Create the pin index from it's bank and position numbers */

its bank

> +#define PIN(b, p)              ((b) * RZA1_PINS_PER_PORT + (p))
> +
> +/*
> + * Flags to apply to alternate function configuration
> + * All of the following are mutually exclusive.
> + */
> +
> +/*
> + * Pin is bi-directional.
> + * Alternate function that need both input/outpu functionalities shall

An alternate function that needs ... output

> + * be configured as bidirectional.
> + * Eg. SDA/SCL pins of an I2c interface.
> + */
> +#define BI_DIR                 (1 << 3)
> +
> +/*
> + * Flags used to ask software drive the pin I/O direction overriding the

to drive

> + * alternate function configuration.
> + * Some alternate function requires software to force I/O direction of a pin,

functions require

> + * ovverriding the designated one.

overriding

> + * Reference to the HW manual to know when this flag shall be used.

Refer

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
