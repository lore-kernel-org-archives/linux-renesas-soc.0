Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Wed, 23 May 2018 10:54:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: mux: demux-pinctrl: add symlinks to the
 demux device in sysfs
Message-ID: <20180523085429.wywudkeo44wavyvv@ninjato>
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
 <20180523084820.cdebd2kxritr5rm2@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rc24vz6iw3ppnm7o"
Content-Disposition: inline
In-Reply-To: <20180523084820.cdebd2kxritr5rm2@verge.net.au>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--rc24vz6iw3ppnm7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	WARN(sysfs_create_link(&priv->cur_adap.dev.kobj, &priv->dev->kobj,
> > +			       "demux_device"),
> > +	     "can't create symlink to mux device\n");
> > +	WARN(sysfs_create_link(&priv->dev->kobj, &priv->cur_adap.dev.kobj,
> > +			       "channel-0"),
> > +	     "can't create symlink to channel 0\n");
> > +
>=20
> Personally I'd rather not rely on side-effects from WARN statements,
> but perhaps thats just me.

It's a way to satisfy the __must_check from sysfs_create_link().


--rc24vz6iw3ppnm7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsFLEEACgkQFA3kzBSg
KbYAXxAAovSk+IqtFaxXU3ZuTZ99ARSmd4b5ThbG3Fk3eMdQa+epRZmGeRfevxks
TpsMH3b+HSPYE8SosEY/lML5/lnAe3CQA0A23c+/2IUuV2iLyTvjmeA/nvahpE8N
9Hk10FzTmFTmMmih7S3TVFRIFGfN9TjP0WK9RI7CSdst5G1T+/6RFN+e7k7mAY/3
SDmbM+6hyYUBIvoHHFPhPBBK8boHBG3J5jU8mi3/KukNn7Z0NW/2UFbtw2mjfsSk
AS26bJsYiZDYVVy1EBSPO86FPOCA0sIXKJoPHJGw+/a4zugioRfy7w7yIl3wC6dc
oQzM4e0ic0OexBlxcXXhQRAGe2OAeDIRVJOGdx/0+whHTQSxeWSVofOhIp7PZsYt
5ys2PBYMbY1Tl2t5kE1zaH91Anof8DeJEwDIVrX/nqPJ6+0PwttUSh5r+eL4Yv/K
/F5+vbT8DSiwRbcFo6TWsYMAYTI+1BbVK/DEbcZolhwcgcNdmES8TyIUoTgJLaJT
Gr+E3C+jtIkzAVbZZe2ZuZjPkuveu6HmvT6dBwucyJN2Gu8ATA/K8MQXfeWDvhD8
3KNuyJNyaZ7RmGTaeelk0m4gKt5X7Iw4xpFCNamohqB4sR8LWFuqrcDYg3URnQ/+
IVWo1qspeHazmvXKkrF/vMn1oqq1HrPvCZUBwAgU8+2fMe+NDnk=
=F+Vf
-----END PGP SIGNATURE-----

--rc24vz6iw3ppnm7o--
