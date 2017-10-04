Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171004163111.54600-3-chris.brandt@renesas.com>
References: <20171004163111.54600-1-chris.brandt@renesas.com> <20171004163111.54600-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Oct 2017 18:47:15 +0200
Message-ID: <CAMuHMdWy+sS1F1s0-E1MaeHQx4uLUtRdjL+PhwzAm60Wh5Xoww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: add support for RZ/A1M and RZ/A1L
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Oct 4, 2017 at 6:31 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Describe how to specify RZ/A1M and RZ/A1L devices.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Added description for RZ/A1M
> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> index 43e21474528a..f2fc86f8dbab 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> @@ -13,7 +13,9 @@ Pin controller node
>
>  Required properties:
>    - compatible
> -    this shall be "renesas,r7s72100-ports".
> +    this shall be "renesas,r7s72100-ports" for RZ/A1H, "renesas,r7s72101-ports"
> +    with a fallback of "renesas,r7s72100-ports" for RZ/A1M (as A1M is compatible
> +    with A1H), or "renesas,r7s72102-ports" for RZ/A1L

Sorry to bother you again, but having this in a single long sentence is hard
to read. What about splitting per SoC, like is done in other bindings?

For the actual content:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
