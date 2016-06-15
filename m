Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:34856 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753137AbcFOGYs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 02:24:48 -0400
Date: Wed, 15 Jun 2016 08:24:38 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: r8a7790: lager: use demuxer for
 IIC3/I2C3
Message-ID: <20160615062438.GA1344@tetsubishi>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
 <20160613143521.GD1603@katana>
 <20160615042943.GC29110@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20160615042943.GC29110@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 01:29:43PM +0900, Simon Horman wrote:
> On Mon, Jun 13, 2016 at 04:35:21PM +0200, Wolfram Sang wrote:
> >=20
> > >  		i2c9 =3D "i2cexio1";
> > >  		i2c10 =3D "i2chdmi";
> > >  		i2c11 =3D "gpioi2c";
> > > +		i2c12 =3D "i2cpwr";
> >=20
> > To make it easier for users, we should maybe group them?
> >=20
> > i2c8+9: additional gpio busses
> > i2c10-13: i2cexioX
>=20
> Should we also group gpioi2cX?

That's what I meant with "additional gpio busses" :) I assume we only
need 2 on lager.


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYPSmAAoJEBQN5MwUoCm2NnAQALEjg+TZTsC6e43CCCDrtbO4
1USHfe9zX0WAwzNAmriydZB55m2fVH+0YnnbA21pXPFxVhFdMAJy/u8iWX7C8MDr
gZ6QbDzSp2Wpa0l0Ss20yDuao671qzATyaPwgB2u2STVHB+Sjvt/v4nHUkeYbnpl
d6iylEZqCqzhSdCJ0hUgzgezSOXEdWy8plZH4yxfkvqCqQssSl/je2OiYygL1lNl
8863ohd2DBoDt423w/V++b4iMP38ePGgVCYaQJPVmxLxDpn2AREJuyFOtWVRKPL1
BiXa53CttBvaBxbTm4TuaoDNMDm30EJ/5H9YRN1ApSqFT+vpresVn8qsHnKND334
/6JTGt//OPy+7eToWytBSB66HPvAv3EH2QTVevNGMKJvF5cDw2E5BYViAiMvx+ZX
cDtODsy++VJIq8Bwy+VlJ/aN+RaSoVRACegnl7wJMmhJRKPqXrozTEu6Rzj3KoME
5berZPsDHvLBiK09E9OvBcGCL1qCGVR75475L+gBE94ptqoO4ZnT4LZO5/isBir+
UrgVXAhxutQHSb8TiXUDo0+GU2X4/hcvWWK6JvOI5XgWBX9YAjFtS6c0dTT3hgez
H2Iv84nifcZE+zXPSP3UnxHepTynKHFn0pGrXsGLuTLSCwEFcH5M7+Ln1UYx61jH
zSgViwIHMFKYEHsA61fm
=FpBT
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
