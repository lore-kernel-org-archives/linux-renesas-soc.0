Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45315 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbeKPCgw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 21:36:52 -0500
Received: by mail-oi1-f196.google.com with SMTP id b141so8208720oii.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Nov 2018 08:28:21 -0800 (PST)
MIME-Version: 1.0
References: <1540071055-27181-1-git-send-email-ykaneko0929@gmail.com> <CAMuHMdXLS8k8z1EUUujnnvBi+Yp8X0aPmOK3hdQdVQFhPnS3OQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXLS8k8z1EUUujnnvBi+Yp8X0aPmOK3hdQdVQFhPnS3OQ@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Fri, 16 Nov 2018 01:28:09 +0900
Message-ID: <CAH1o70JXoi9FV7X5FKsHuxSrOQdr3ceSP7f2ggANAW4iXN04yw@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add HSCIF pins, groups,
 and functions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

Thanks for your review!!

2018=E5=B9=B411=E6=9C=886=E6=97=A5(=E7=81=AB) 0:30 Geert Uytterhoeven <geer=
t@linux-m68k.org>:
>
> Hi Kaneko-san,
>
> On Sat, Oct 20, 2018 at 11:31 PM Yoshihiro Kaneko <ykaneko0929@gmail.com>=
 wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds HSCIF{0,1,2,3,4} pins, groups and functions to
> > the R8A77990 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
>
> > +static const unsigned int hscif3_data_d_pins[] =3D {
> > +       /* RX, TX */
> > +       RCAR_GP_PIN(1, 3), RCAR_GP_PIN(1, 0),
>
> These two pins are exchanged.
> According to the datasheet, it should be:
>
>         RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 3),

I will fix it in v2.

>
> > +};
> > +
> > +static const unsigned int hscif3_data_d_mux[] =3D {
> > +       HRX3_D_MARK, HTX3_D_MARK,
> > +};
>
> > @@ -2454,6 +2738,37 @@ enum {
> >                 SH_PFC_PIN_GROUP(du_disp_cde),
> >                 SH_PFC_PIN_GROUP(du_cde),
> >                 SH_PFC_PIN_GROUP(du_disp),
> > +               SH_PFC_PIN_GROUP(hscif0_data_a),
> > +               SH_PFC_PIN_GROUP(hscif0_clk_a),
> > +               SH_PFC_PIN_GROUP(hscif0_ctrl_a),
> > +               SH_PFC_PIN_GROUP(hscif0_data_b),
> > +               SH_PFC_PIN_GROUP(hscif0_clk_b),
> > +               SH_PFC_PIN_GROUP(hscif1_data_a),
> > +               SH_PFC_PIN_GROUP(hscif1_clk_a),
> > +               SH_PFC_PIN_GROUP(hscif1_data_b),
> > +               SH_PFC_PIN_GROUP(hscif1_clk_b),
> > +               SH_PFC_PIN_GROUP(hscif1_ctrl_b),
> > +               SH_PFC_PIN_GROUP(hscif2_data_a),
> > +               SH_PFC_PIN_GROUP(hscif2_clk_a),
> > +               SH_PFC_PIN_GROUP(hscif2_ctrl_a),
> > +               SH_PFC_PIN_GROUP(hscif2_data_b),
> > +               SH_PFC_PIN_GROUP(hscif3_data_a),
> > +               SH_PFC_PIN_GROUP(hscif3_data_b),
> > +               SH_PFC_PIN_GROUP(hscif3_clk_b),
> > +               SH_PFC_PIN_GROUP(hscif3_data_c),
> > +               SH_PFC_PIN_GROUP(hscif3_clk_c),
> > +               SH_PFC_PIN_GROUP(hscif3_ctrl_c),
> > +               SH_PFC_PIN_GROUP(hscif3_data_d),
> > +               SH_PFC_PIN_GROUP(hscif3_data_e),
> > +               SH_PFC_PIN_GROUP(hscif3_ctrl_e),
> > +               SH_PFC_PIN_GROUP(hscif4_data_a),
> > +               SH_PFC_PIN_GROUP(hscif4_clk_a),
> > +               SH_PFC_PIN_GROUP(hscif4_ctrl_a),
> > +               SH_PFC_PIN_GROUP(hscif4_data_b),
> > +               SH_PFC_PIN_GROUP(hscif4_clk_b),
> > +               SH_PFC_PIN_GROUP(hscif4_data_c),
> > +               SH_PFC_PIN_GROUP(hscif4_data_d),
> > +               SH_PFC_PIN_GROUP(hscif4_data_e),
> >                 SH_PFC_PIN_GROUP(i2c1_a),
> >                 SH_PFC_PIN_GROUP(i2c1_b),
> >                 SH_PFC_PIN_GROUP(i2c1_c),
>
> The above doesn't compile, as you forgot to update the size of the
> pinmux_groups.common[] array.

I will fix it.

>
> > @@ -2781,6 +3142,11 @@ enum {
> >         .common =3D {
> >                 SH_PFC_FUNCTION(avb),
> >                 SH_PFC_FUNCTION(du),
> > +               SH_PFC_FUNCTION(hscif0),
> > +               SH_PFC_FUNCTION(hscif1),
> > +               SH_PFC_FUNCTION(hscif2),
> > +               SH_PFC_FUNCTION(hscif3),
> > +               SH_PFC_FUNCTION(hscif4),
> >                 SH_PFC_FUNCTION(i2c1),
> >                 SH_PFC_FUNCTION(i2c2),
> >                 SH_PFC_FUNCTION(i2c4),
>
> The above doesn't compile, as you forgot to update the size of the
> pinmux_functions.common[] array.

I will fix it.


Best regards,
Kaneko

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
