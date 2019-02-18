Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2A9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 20:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 922B820C01
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 20:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbfBRUl2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 15:41:28 -0500
Received: from sauhun.de ([88.99.104.3]:39362 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727682AbfBRUl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 15:41:27 -0500
Received: from localhost (p54B3327C.dip0.t-ipconnect.de [84.179.50.124])
        by pokefinder.org (Postfix) with ESMTPSA id 7E0BD2C7BF4;
        Mon, 18 Feb 2019 21:41:25 +0100 (CET)
Date:   Mon, 18 Feb 2019 21:41:22 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190218204122.j35itmqth3avo3a6@ninjato>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qwz2uwssdtpo7ey6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qwz2uwssdtpo7ey6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for this review, too!

> >
> > +Lost arbitration
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Here, we want to simulate the condition where the master under tests l=
oses the
>=20
> test

Ack.

> > +This file is write only and you need to write the duration of the arbi=
tration
> > +interference (in us). The calling process will then sleep and wait for=
 the
>=20
> =C2=B5s
>=20
> We do UTF-8 in documentation, don't we?

Dunno, I can change. Only 4 occcurences of '=C2=B5s' in Documentation/ so f=
ar.

> > +       wait_for_completion_interruptible(&priv->scl_irq_completion);
>=20
> Error checking/propagation (-ERESTARTSYS)?

Are you sure? ERESTARTSYS belongs to the "These should never be seen by
user programs." group.

>=20
> > +
> > +       free_irq(irq, priv);
> > + output:
> > +       ret =3D gpiod_direction_output(priv->scl, 1);
>=20
> This may overwrite the error code returned by request_irq().

Yeah. What do you think about this, is this too dense?

	ret =3D gpiod_direction_output(priv->scl, 1) ?: ret;

> > +       priv->scl_irq_data =3D duration;
>=20
> ... since calling udelay() with large numbers can be dangerous, perhaps y=
ou
> want to limit it to say 100 ms max anyway?

Yeah, good idea. Will apply it for both injectors.

Happy hacking,

   Wolfram


--qwz2uwssdtpo7ey6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxrGG4ACgkQFA3kzBSg
KbaKew/9HFm7a+yDzhhd2CEiwEN81gIJvJEAuMtgWMvbnD4Y2bydedJI1GVJQyef
qrvMOWpHzX+xELmUPCfdSAmYckZV+awQtxd1E1Dq4kl1wD1PH11nq37p2F6Bdg4z
/XYMSbos1DGm/xGQIydp5QbVDR6102Uu93GTHr/f8PJooX0Rg76BBMau3vhrNfUz
jTYukldXud91miWg4QUD2m89BX48xHPLoy5mUGUhumgA1YMcPrTJO4I2MI4MsD0K
ZvT2q0PpLzd9ZckM3ajH14FtzCf4KK2lNYapG+r/U+o0JmnJmy4ttTGlTcv8NkBr
V0I2WPrbg2dJUBPiBibu1fnp/LT9fpgznXdCFDcIzL7h82FChLaChhHzTK3dy9iZ
nY5RktiD5AfxTCBExcgsQhiPgJiuYb5QDMnpS0zVlj7YIUGbYpyRN7wxRt0tNLit
xgeDE5ziFRd5nD9vfVDltTpVMlfa3rvPrDTt49GLVDI/Sme99ZnBmDeNvxd0LZ26
S24G9SMa+BJfUrV38TYiRgRnvCZwo9VQi0b4Vd6k10a4RSjOX53uttmS+1WluebL
aZyZaf+oCZ44lpBVzOTRMmh7q4UPJt6uOG/DHkXTnoEa6AaDmXCCk5mRVO1NYGNS
oVa3wZ8c6Ad2o/dXky0QMCW66jxittD7H4W1mtyboTPYdxlEVgg=
=ZdBH
-----END PGP SIGNATURE-----

--qwz2uwssdtpo7ey6--
