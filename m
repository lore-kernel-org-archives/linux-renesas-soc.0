Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:38474 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750882AbdJFH5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 03:57:23 -0400
MIME-Version: 1.0
In-Reply-To: <1507108713-10686-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1507108713-10686-1-git-send-email-fabrizio.castro@bp.renesas.com> <1507108713-10686-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Oct 2017 09:57:21 +0200
Message-ID: <CAMuHMdW-Y7tK28YAGBRMqdgZK7vVqnUcud1FtzQd6wLrKii_AA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: iwg20d-q7: Rework DT architecture
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Wed, Oct 4, 2017 at 11:18 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Since the same carrier board may host RZ/G1M and RZ/G1N based
> Systems on Module, the DT architecture for iwg20d-q7 needs
> better decoupling. This patch provides:
> * iwg20d-q7-common.dtsi - its purpose is to define the carrier
>   board definitions, and its content is basically the same
>   as the previous version of r8a7743-iwg20d-q7.dts, only it
>   has no reference to the SoM .dtsi, and that's why the
>   filename doesn't mention the SoC name any more.
> * r8a7743-iwg20d-q7.dts - its new purpose is to put together
>   the SoM .dtsi (r8a7743-iwg20m.dtsi) and the carrier board
>   .dtsi defined by this very patch, along with "model" and
>   "compatible" properties.
> The final DT architecture to describe the board is now:
> r8a7743-iwg20d-q7.dts           # Carrier Board + SoM
> =E2=94=9C=E2=94=80=E2=94=80 r8a7743-iwg20m.dtsi         # SoM
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 r8a7743.dtsi            # SoC
> =E2=94=94=E2=94=80=E2=94=80 iwg20d-q7-common.dtsi       # Carrier Board
> and maximizes the reuse of the definitions for the carrier board
> and for the SoM.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi

> +&pfc {
> +       i2c2_pins: i2c2 {
> +               groups =3D "i2c2";
> +               function =3D "i2c2";
> +       };
> +
> +       scif0_pins: scif0 {
> +               groups =3D "scif0_data_d";
> +               function =3D "scif0";
> +       };
> +
> +       avb_pins: avb {
> +               groups =3D "avb_mdio", "avb_gmii";
> +               function =3D "avb";
> +       };

Perhaps you want to use this opportunity to restore alphabetical sort order=
?

> +&scif0 {

[...]

> +};
> +
> +&avb {

Likewise.

Can be a separate patch, though.

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
