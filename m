Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1491474955-25605-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1491474955-25605-1-git-send-email-jacopo+renesas@jmondi.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Apr 2017 12:11:37 +0200
Message-ID: <CACRpkdaik7T7vZx0meJUvLiJJe6Wq_PaOAh9eWB892NjMKX=4A@mail.gmail.com>
Subject: Re: [RFC] Documentation: pinctrl: Add "pinmux" property
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 6, 2017 at 12:35 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> Document "pinmux" property as part of generic pin controller
> documentation.
> Fix 2 minor typos in documentation while at there.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Patch applied. This is documenting what is already the case
and is as such very helpful.

> Sending this one as RFC to collect feedback.

I just applied it. It is already much better than what we have.

If more adjustments are needed, people can send additional patches.

> If the change is not rejected is it
> worth adding to pin controller core helper functions to parse the newly
> documented property, as this commit
> <https://patchwork.kernel.org/patch/9411231/>
> did for "pinctrl-pin-array" one?
>
> All drivers using "pinmux" exhibit the same behavior which is fine as long as
> "pinmux" only accepts a list of u32 parameters.
>
>         ...
>         pins = of_find_property(node, "pinmux", NULL);
>         ...
>         npins = pins->length / sizeof(u32);
>         ...
>         of_property_read_u32_index(node, "pinmux",
>                                    i, &pinfunc);
>         ...

It makes sense. Just make sure to move users over to use the helpers.

Yours,
Linus Walleij
