Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35969 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758578AbcLAJOH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 04:14:07 -0500
Received: by mail-wm0-f65.google.com with SMTP id m203so33072369wma.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2016 01:13:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161128114614.11979-1-niklas.soderlund+renesas@ragnatech.se>
References: <20161128114614.11979-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2016 10:13:56 +0100
Message-ID: <CAMuHMdV5thEHBGTbESB00WvohH-t5Cu59soYPQ8d6YzuoEDSPg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: salvator-x: Set drive-strength for
 ravb pins
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Mon, Nov 28, 2016 at 12:46 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The EthernetAVB should not depend on the bootloader to setup correct
> drive-strength values. Values for drive-strength where found by examine

examining

> the registers after the bootloader have configured the registers and

has

> successfully used the EthernetAVB.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 28 ++++++++++++++++=
++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/ar=
m64/boot/dts/renesas/r8a7795-salvator-x.dts
> index b1eab68..7f49d19 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -225,8 +225,32 @@
>         };
>
>         avb_pins: avb {
> -               groups =3D "avb_mdc";
> -               function =3D "avb";
> +               mux {
> +                       groups =3D "avb_mdc", "avb_mii";
> +                       function =3D "avb";
> +               };
> +
> +               pins_mdc {
> +                       groups =3D "avb_mdc";
> +                       drive-strength =3D <24>;
> +               };
> +
> +               pins_mii_tx {
> +                       pins =3D "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AV=
B_TD0",
> +                              "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3=
";
> +                       drive-strength =3D <12>;
> +               };
> +
> +               pins_mii_rx {
> +                       pins =3D "PIN_AVB_RX_CTL", "PIN_AVB_RXC", "PIN_AV=
B_RD0",
> +                              "PIN_AVB_RD1", "PIN_AVB_RD2", "PIN_AVB_RD3=
";
> +                       drive-strength =3D <24>;
> +               };
> +
> +               pins_mii_clk {
> +                       pins =3D "PIN_AVB_TXCREFCLK";
> +                       drive-strength =3D <24>;
> +               };
>         };
>
>         du_pins: du {

What about AVB_PHY_INT and AVB_LINK?
Or don't you need to specify their drive strengths, as they are input signa=
ls?
Then what about pins_mii_rx, they're also input signals?

BTW, the latest public U-Boot seems to configure just AVB_TX_CTL, AVB_TXC,
and AVB_TXD[0-3] for 12 mA, cfr.
https://github.com/renesas-rcar/u-boot/blob/v2015.04/rcar-3.4.0/board/renes=
as/salvator-x/salvator-x.c#L158

According to the datasheet, the reset values of all signals are 15 mA on H3=
 ES1,
and 24 mA on M3-W and H3 ES2.0.

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
