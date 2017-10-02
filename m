Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Oct 2017 10:20:03 +0200
Message-ID: <CAMuHMdUGU-6c=QoekksFfpoP1x15vUmFu272wd5YqqnQe-RwmA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 USB2.0 phy channel 3
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Mon, Oct 2, 2017 at 8:29 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch enables the USB2.0 phy channel 3. R-Car H3 ES2.0 has
> this channel and we can use it on the Salvator-XS.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> @@ -99,6 +99,11 @@
>                 groups = "usb2";
>                 function = "usb2";
>         };
> +
> +       usb2_ch3_pins: usb2_ch3 {
> +               groups = "usb2_ch3";
> +               function = "usb2_ch3";
> +       };
>  };

Using these pins requires changing SW31, disabling the interrupt capabilities
of the ADV7482? Does the ADV7482 still work after that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
