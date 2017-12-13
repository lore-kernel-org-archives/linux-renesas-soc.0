Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1513146460-20326-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1513146460-20326-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2017 09:55:16 +0100
Message-ID: <CAMuHMdU2YhLC3VPV8=KDw7U2=eudk35TmW7VfLYBDXrooQbx-g@mail.gmail.com>
Subject: Re: [PATCH 5/5] phy: renesas: rcar-gen3-usb2: add gpio handling
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Wed, Dec 13, 2017 at 7:27 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Some R-Car SoCs (e.g. R-Car D3) doesn't have dedicated pins of VBUS
> and ID. So, they may be connected to gpio pins. To handle the gpio
> pins, this patch adds the handling of VBUS and ID pins instead of
> dedicated pins.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 77 ++++++++++++++++++++--
>  2 files changed, 72 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index 99b651b..851582f 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -27,6 +27,8 @@ channel as USB OTG:
>  - interrupts: interrupt specifier for the PHY.
>  - vbus-supply: Phandle to a regulator that provides power to the VBUS. This
>                regulator will be managed during the PHY power on/off sequence.
> +- renesas,vbus-gpios: use gpio to control vbus instead of dedicated pin.
> +- renesas,id-gpios: use gpio to detect id instead of dedicated pin.

Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt already uses
"vbus-gpios" and "id-gpios" without vendor-specific prefixes, so perhaps
the "renesas," can be dropped?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
