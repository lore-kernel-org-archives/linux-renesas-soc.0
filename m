Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180131161811.12699-5-niklas.soderlund@ragnatech.se>
References: <20180131161811.12699-1-niklas.soderlund@ragnatech.se> <20180131161811.12699-5-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jan 2018 19:34:32 +0100
Message-ID: <CAMuHMdUcqRcGr+n=VqbeNiuGddNww1U+Pe1dy=-kwyGNqxrrMw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77970: add the LVDS instance
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Wed, Jan 31, 2018 at 5:18 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> Add the LVDS device to r8a77970.dtsi in a disabled state. Also connect
> the it to the LVDS output of the DU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

FWIW, Sergei sent the exact same patch before...

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77970.dtsi
> index e1d8aa0fbc1e4f90..3945a34550d17321 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -655,6 +655,31 @@
>                                 port@1 {
>                                         reg =3D <1>;
>                                         du_out_lvds0: endpoint {
> +                                               remote-endpoint =3D <&lvd=
s0_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               lvds0: lvds@feb90000 {
> +                       compatible =3D "renesas,r8a77970-lvds";
> +                       reg =3D <0 0xfeb90000 0 0x14>;
> +                       clocks =3D <&cpg CPG_MOD 727>;

... also with missing power-domains and resets properties.

> +                       status =3D "disabled";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
