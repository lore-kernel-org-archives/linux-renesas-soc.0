Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57506 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbeHTMNj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 08:13:39 -0400
Date: Mon, 20 Aug 2018 10:58:50 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <uli@fpond.eu>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH 2/2] i2c: rcar: implement STOP and REP_START according to
 docs
Message-ID: <20180820085850.x37gxfvxzjswaqzl@ninjato>
References: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
 <20180808075928.31107-3-wsa+renesas@sang-engineering.com>
 <687887330.263004.1534439737368@webmail.strato.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p5drgu4geizlc6zb"
Content-Disposition: inline
In-Reply-To: <687887330.263004.1534439737368@webmail.strato.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--p5drgu4geizlc6zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -	if (priv->pos + 1 >=3D msg->len)
> > -		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
> > +	/* If next received data is the _LAST_, go to new phase. */
> > +	if (priv->pos + 1 =3D=3D msg->len) {
> > +		if (priv->flags & ID_LAST_MSG) {
> > +			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
> > +		} else {
> > +			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
> > +			priv->flags |=3D ID_P_REP_AFTER_RD;
> > +		}
> > +	}
>=20
> So "priv->pos + 1 <=3D msg->len" is an invariant? (The current code seems=
 to imply that it isn't.)

I think it is, we increment pos by 1 right before this 'if'. Do you
agree? IIRC the old '>=3D' came from a 'well, won't hurt' attitude. It was
not precise, sadly.

> If it is,
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks.


--p5drgu4geizlc6zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt6gsoACgkQFA3kzBSg
KbbPAQ//QFamVLtYVN261ZiVUrOWpQ1IclEUdH0r/nqfh03glgD5mmMOBmZFOCHe
EE9xkjDPRKdCN8cWuR7xn91uYjL8wRXiMkvuxN0EGjutpeCtrs2WJtMhZAiz2knN
F+uRH8PAxxOE9lb0PvfNImHO/AKt8ky+c7JYjP9/Is8rmdV7dPvC5ojkqsG8M2kg
Q6aZZdlQ/DczJcKqZryqtkZQgc/zHILaFp0B3c7YTJ2igckilTD/PocFgwpctXGt
l+YwWaG+IEyolkSpQDlE7UhwhqD6OMvweRQDzyStnzw4Jr79jULR22avfEtvq800
RwR6dauesNMovi/cLj5/ddB+DMtiQpJSFpkV91iCSBIO/pvb+xz1DAR3cQY6Oqmo
l51OPEYrquuz6igoHmHHQw6IWLwvqc3ECAx/4CeChOxQ//O786uLI65QDH6H9Gmd
6aMqnOSkRHH83LPiw7g7eklzSb1gLUEF1fInSnqBjbdVAExDm5jL2UDUsXuma4Pd
RxwCRAIblkmcnJT4EZd5ZTUjmvCSjj2amRHINpO6TfYry+47kQfqQEEqf6C5HnqR
HEPyfVO3+Y7Li35RRi/F6znWGljXprXGAFiHbv5hY1RHgtfKiAB+jbLnct6GRV38
cIqcn6LIp6uX4HLkw5OTnPCHF6ZB3XWlNn246O4eotw4FRzGE4s=
=ng6C
-----END PGP SIGNATURE-----

--p5drgu4geizlc6zb--
