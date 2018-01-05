Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180104213108.24080-2-niklas.soderlund+renesas@ragnatech.se>
References: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se> <20180104213108.24080-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jan 2018 09:47:11 +0100
Message-ID: <CAMuHMdU97udtf4+vo_SaGyYaEk1eV4QEmeqWiGF4iVp045w=6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: update register size for thermal
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 4, 2018 at 10:31 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> To be able to read fused calibration values from hardware the size of
> the register resource of TSC1 needs to be incremented to cover one more
> register which holds the information if the calibration values have been
> fused or not.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -2385,7 +2385,7 @@
>
>                 tsc: thermal@e6198000 {
>                         compatible =3D "renesas,r8a7795-thermal";
> -                       reg =3D <0 0xe6198000 0 0x68>,
> +                       reg =3D <0 0xe6198000 0 0x6c>,

Perhaps we should just make it 0x100?
I'd be very surprised if that would be smaller than the granularity of the
address decoder circuitry.

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
