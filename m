Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49854 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbeLEUqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 15:46:31 -0500
Date: Wed, 5 Dec 2018 21:46:28 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20181205204628.wvc2d4zfynbrztgq@ninjato>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai>
 <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elicf7xccoc2scyn"
Content-Disposition: inline
In-Reply-To: <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--elicf7xccoc2scyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 02, 2018 at 12:57:19PM +0100, Simon Horman wrote:
> On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> >=20
> > > This patch have quiet a few dependencies I'm afraid, let me know if y=
ou=20
> > > wish to be notified once they all upstream. I don't think it's a good=
=20
> > > idea to pick this up before all dependencies are resolved.
> >=20
> > Yes, we should do that. Ping Simon once all dependencies are in next. It
> > is still fine to have this patch here in case people want to test. BTW
> > did you mention your branch somewhere where you collected all these
> > patches to make HS400 working/enabled?
> >=20
> > For this patch already:
> >=20
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thanks, I am marking this as deferred.
>=20
> Please repost or ping me once the dependencies are present in
> an rc release.

Niklas, are we done now, so we can ask Simon to pick up the DTS change?


--elicf7xccoc2scyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwIOSQACgkQFA3kzBSg
KbamMw//Ym2h2ezaoaGXC8k0/fqKSyH29mksXZrY5yp/aaj+uDIgmkSMtOviIMKF
ut8Nmp86vT7V2Di7J1bnIjvQeeuYDdWv0fdYbkxWx3vOsZO0SnK9voeyNacUabxX
e0gIFl6OchzMzNkhRQkK1oxtKkzP/jst4rwIEyNjxDxpvkejtGnEKf1J3Uj0iJpD
zRLQui/kq/mcVTFeW7Pg3CN8PUEIm4bxK6c9aIznY2o7cY/sKFDP2z051lX3Azvr
ArDPBs0WM+IJR7fFDgNSpa6XYNybtWPiRwnhs4w76PFrS5n19KULNIJ0hSYXhnIh
Bf6rQpEgVCNutIUSxzvDmN3ClbizOqVvxs6ZjIlKuqP1nVaXiPjXY7Q9Cw+CltRW
RPdxe3ot/yJBUYQ3qDqBOuCGHIxovW5UmNY5KCd6RhjoJXCUTLn2jgr/d1DVq+Ck
tE/o6HcV1Fa6pzD6BL1DqYe5Hxg6FUjKkt1a2shm3tNAKKYg1g6iqj2m2GQZv90k
RCuDnj6U8NYfZ2jqAjB0C7zFsbuAhlamaU+IedRnI+Lg5/bySUN7mwKeyRQL5yke
nSeLWYDm4FZrAKdmWeZGPaIf1kjHitWS4rj/X1Hifijz+wZSz9xa4afTsTlFQWi4
nnvddFRgTZ+5Unq1G2CUpJGyg2nmE0ddQ9vm1AGmpZ+0nP9Y+Qk=
=kcqC
-----END PGP SIGNATURE-----

--elicf7xccoc2scyn--
