Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37197 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbeH1Mei (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 08:34:38 -0400
Date: Tue, 28 Aug 2018 10:43:55 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [RFT 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and
 functions
Message-ID: <20180828084355.GD3566@w540>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
 <1534760202-20114-6-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdXrdgryGaKRvg39snrDrWEDzgAyDS27Sz1pd-yHk=yJ6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXrdgryGaKRvg39snrDrWEDzgAyDS27Sz1pd-yHk=yJ6g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Tue, Aug 28, 2018 at 09:46:57AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Mon, Aug 20, 2018 at 12:17 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!

Thanks for review.

>
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > @@ -1982,6 +1982,446 @@ static const unsigned int usb30_id_mux[] = {
> >         USB3HS0_ID_MARK,
> >  };
> >
> > +/* - VIN4 ------------------------------------------------------------------- */
> > +static const unsigned int vin4_data8_a_pins[] = {
> > +       RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> > +       RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> > +       RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> > +       RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> > +};
> > +
> > +static const unsigned int vin4_data8_a_mux[] = {
> > +       VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> > +       VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> > +       VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> > +       VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> > +};
> > +
> > +static const unsigned int vin4_data10_a_pins[] = {
> > +       RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> > +       RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> > +       RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> > +       RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> > +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> > +};
> > +
> > +static const unsigned int vin4_data10_a_mux[] = {
> > +       VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> > +       VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> > +       VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> > +       VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> > +       VI4_DATA8_MARK,   VI4_DATA9_MARK,
> > +};
>
> Can you please use union vin_data and VIN_DATA_PIN_GROUP(), to reduce
> redundancies, cfr. commit 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795:
> Deduplicate VIN4 pin definitions")?
> Or do you want to do that in a follow-up patch (which means more
> review work)?

I will have to resend anyhow, so I can make this change in v2.

>
> > +static const unsigned int vin4_data8_sft8_pins[] = {
> > +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> > +       RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> > +       RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> > +       RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> > +};
>
> R-Car H3 and M3-W don't have the data8_sft8 groups yet (the BSP has).
> IIRC, that's due to rcar-vin not yet supporting that mode. Niklas?

Not sure what SFT mode is. The only registers naming this are related
to "Shift Down Volume" and RGB->YCrCb conversion. I'll wait for
Niklas, and eventually remove the pin group.
>
> > +static const unsigned int vin5_sync_a_pins[] = {
> > +       /* HSYNC_N, VSYNC_N */
> > +       RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
> > +};
> > +
> > +static const unsigned int vin5_sync_a_mux[] = {
> > +       VI5_HSYNC_N_A_MARK, VI5_VSYNC_N_A_MARK,
> > +};
> > +
> > +static const unsigned int vin5_field_a_pins[] = {
> > +       RCAR_GP_PIN(1, 10),
> > +};
> > +
> > +static const unsigned int vin5_field_a_mux[] = {
> > +       VI5_FIELD_A_MARK,
> > +};
> > +
> > +static const unsigned int vin5_clkenb_a_pins[] = {
> > +       RCAR_GP_PIN(0, 1),
> > +};
> > +
> > +static const unsigned int vin5_clkenb_a_mux[] = {
> > +       VI5_CLKENB_A_MARK,
> > +};
>
> "A" groups without "B" groups? Usually we drop the "_A" suffix in that case.
>
> They're actually named like that in hardware user manual rev. 1.00 (and no
> update in the errata)?

It's true, the sync signal pins of VI4 do not have any "_a" or "_b"
mark, while the VI5 ones do. Eg. we have "VI5_VSYNC#_A" and
"VI4_VSYNC#". This might be an error in the chip manual or a
suggestion that VIN5_DATA.*_B pins do not support synchronism signals
and can only work with embedded synchronization. This seems unlikely
to me, and checking Table 26.20.3 that lists the supported input format
for each channel, I don't see anything like that mentioned.

Morimoto-san, Shimoda-san, could you please verify why those pins,
have a different naming scheme?

Thanks
   j

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbhQtKAAoJEHI0Bo8WoVY8aOwP/iOfquA0JGXeFO1n3+y+TMmT
LtJzFgCCpUUni4iXDAJNU+pNdR0D3/lDqjvybgfiqAM8mStDpuHDpOFGpIOKu1tD
eV6c5h53RZEzNqXj0Upzm0SkAmvI6188l6oSGpv20DFgVg26qiaCCPtgHaSw9b5y
2+2/zG77DZmzn6HqzPkxFEX9kIzUVTGuRpt9U6UMFjFrTcdo3+z7260Jcbh+K9so
Nghv2wSjSEOgwXUnRy/YN6cg07435z4T6XeZ6zHBWFytyJFlkdcq7GwdlkJT9k8O
XNDqDhetN7Uqzxf1jDzWUfN8dKyMDGjO13IFm4d7+rYp6y9dVDZXjGpU3wNvCnCJ
SfxXSs8ubntPK8wmK5IuXzP0I9RxKN07k9uGTFiBw7MwQfDxqIo4LMfrngmZn87s
Ff8XW7rKF1yUyXgi4VQhlAW2v13yvOMTHIoUxIDeO9eIFP3LIuSYE26ADj+mMN/I
8PESm63+fKsPYceou8my/byurjbHgYbLHmENr+i0wovG9sQ7HwjE7YqnT+tA6K0p
qwAlulCA4eYnJZiGeJESAFY2mzwLVX4efZIeshF4HRgCb6I15nwDZ9fyBpEpgEpc
4abkM4SO6iRlG8+PLxMK73QIhbTBclP4DmMTIv8QW+xUn0JOQbq2X2DGr8EgnWj3
uk2E99vp2jTkO64YhCIf
=djHv
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
