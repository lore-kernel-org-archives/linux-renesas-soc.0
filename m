Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171003073334.18917-3-chris.brandt@renesas.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com> <20171003073334.18917-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Oct 2017 15:58:12 +0200
Message-ID: <CAMuHMdVU_dmMvfSNQXOON1doW98EjRY9p8XT6XP7ccxa7414bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: add support for RZ/A1L
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

On Tue, Oct 3, 2017 at 9:33 AM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Compatible "r7s72102-ports" was added for RZ/A1L devices
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> index 43e21474528a..2a3366cee848 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> @@ -13,7 +13,8 @@ Pin controller node
>
>  Required properties:
>    - compatible
> -    this shall be "renesas,r7s72100-ports".
> +    this shall be "renesas,r7s72100-ports" for RZ/A1H and RZ/A1M or
> +    "renesas,r7s72102-ports" for RZ/A1L

Shouldn't you also document "renesas,r7s72101-ports" for RZ/A1M?
You could use "renesas,r7s72100-ports" as a fallback property for RZ/A1M,
though.

BTW, is there a way to distinguish the various RZ/A1 SoCs at runtime?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
