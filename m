Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org> <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Mar 2017 15:22:23 +0200
Message-ID: <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> Add dt-bindings for Renesas r7s72100 pin controller header file.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> +/*
> + * Pin is bi-directional.
> + * An alternate function that needs both input/output functionalities shall
> + * be configured as bidirectional.
> + * Eg. SDA/SCL pins of an I2c interface.
> + */
> +#define BI_DIR                 (1 << 3)

Any specific reason why this should not simply be added to
include/linux/pinctrl/pinconf-generic.h
as PIN_CONFIG_BIDIRECTIONAL and parsed in
drivers/pinctrl/pinconf-generic.c
from the (new) DT property "bidirectional" simply?

> +/*
> + * Flags used to ask software to drive the pin I/O direction overriding the
> + * alternate function configuration.
> + * Some alternate functions require software to force I/O direction of a pin,
> + * overriding the designated one.
> + * Refer to the HW manual to know when this flag shall be used.
> + */
> +#define SWIO_IN                        (1 << 4)
> +#define SWIO_OUT               (1 << 5)

What is wrong in doing this with generic pin config using
PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT
(ignoring the argument)?

In the device tree use input-enable and add a new output-enable
(with unspecified value) with proper description and DT bindings?

And if you think these have no general applicability, by the end
of the day they are *still* pin config, not magic flags we can choose to
toss in with the muxing, so you can do what the Qualcomm driver
does and add custom pin configurations extending the generic
pin config, see drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
qcom,pull-up-strength etc.

Yours,
Linus Walleij
