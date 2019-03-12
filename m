Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89DBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8651E2147C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfCLM6X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 08:58:23 -0400
Received: from sauhun.de ([88.99.104.3]:39046 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfCLM6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 08:58:23 -0400
Received: from localhost (p54B335FE.dip0.t-ipconnect.de [84.179.53.254])
        by pokefinder.org (Postfix) with ESMTPSA id C6C7D2C282F;
        Tue, 12 Mar 2019 13:58:20 +0100 (CET)
Date:   Tue, 12 Mar 2019 13:58:20 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/3] i2c: rcar: sanity check for minimal DMA length
Message-ID: <20190312125820.fusrrfq6levuci6y@ninjato>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWsChk1i36u_dDAxMV3j64sHputH5jmGyLxsfjAbeK6sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vnuey4dykloaimeg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWsChk1i36u_dDAxMV3j64sHputH5jmGyLxsfjAbeK6sw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vnuey4dykloaimeg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 11:08:13AM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Tue, Mar 5, 2019 at 7:52 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Use a macro for the hardcoded value and apply a build check. If it is
> > not met, the driver logic will not work anymore.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/i2c/busses/i2c-rcar.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rca=
r.c
> > index 3ce74edcd70c..925858915569 100644
> > --- a/drivers/i2c/busses/i2c-rcar.c
> > +++ b/drivers/i2c/busses/i2c-rcar.c
>=20
> > @@ -921,6 +922,9 @@ static int rcar_i2c_probe(struct platform_device *p=
dev)
> >         struct i2c_timings i2c_t;
> >         int irq, ret;
> >
> > +       /* Otherwise logic will break because some bytes must always us=
e PIO */
> > +       BUILD_BUG_ON_MSG(RCAR_MIN_DMA_LEN < 3, "Invalid min DMA length"=
);
>=20
> Given patch 3/3, it should still work with RCAR_MIN_DMA_LEN =3D=3D 2, rig=
ht?

Nope. It is not that we transfer one byte more with PIO now. The change
in patch 3 is that we explicitly wait for an interrupt when the (already
existing) PIO transfer ended. Before that patch, we assumed DMA would
take over on its own once the data register is empty again. Should I
update the commit message to make this more clear?

Also, it is the _read_ case which needs the minimum lenght of 3. This is
fixing the _write_ code path :)


--vnuey4dykloaimeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyHrOwACgkQFA3kzBSg
KbZc6BAAqpe5Mgj12AA5d82y0T5seoVsUBKbRM/AklT/LiACxivrLX65tZ0ADSKN
kzh0OrKOUkM7+PGDYbQRrph+pgS6QIdxLqmNVM63y2q61tTE7xEgh4IEuohsjkzf
1mgKolrqSXv+LzcbVQt4z5wX17f3CuCU+QytT/m/I0tOrw9lTxoCZ30EdJxGek79
dMDLud5im7MF2qMQla/u2BNOr37slVi98rTImV2No0b5+ePGFQMYoJcC2/lktA0x
VVI5orHCz/8/OBvs8X06Nu9qsBz3wBgTTuWglmCafzFTOUSzxuYd/frrWnmrPMas
tdkS4wydF0nH20o91zDLXrc+wJl2njTNBCNH1Nxi2tmmZt8vOhqmVA5Tk5IrhFNO
Q/7GnsBpcxabsq/EyBWNOdtiknYmms5Wppnu1HMqP5TNKzswe/Fggtgjs02KBSsu
VZ13G3Dzq2yNqBuMjwdq3gwbFUwuG1464NlopcN04CS8/Et8jIibLhCnc787h63V
Eb4BNMQOkCON+xAc+o2doFHgmfoTnYxWZLBxXRCU/0ZJdt+slEe3PVX/S86/NwxR
NWfuAjoiL0J0s6XbViXA+qSX9JDk6JIDPMMxTYwpza19Wi8T1Sz4u+3XQA+ea6bS
42mlFGriZ4+VTa8d/mky1uKEXx7oSePkcEAtJhsNAidlKjiBG9U=
=Wmfs
-----END PGP SIGNATURE-----

--vnuey4dykloaimeg--
