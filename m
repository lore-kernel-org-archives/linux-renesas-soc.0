Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Mon, 23 Jul 2018 19:50:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/1] i2c: rcar: handle RXDMA HW behaviour on Gen3
Message-ID: <20180723175047.2rie7zctuoyhfcys@ninjato>
References: <20180628204538.866-1-wsa+renesas@sang-engineering.com>
 <20180628204538.866-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWEce9+Se0b0pH2Uvma68ozSXxiPGUu__XFFX=yBtmKjw@mail.gmail.com>
 <20180629075404.ivnaauv2hdir32ig@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="etkrpj2vtdkmi6qi"
Content-Disposition: inline
In-Reply-To: <20180629075404.ivnaauv2hdir32ig@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--etkrpj2vtdkmi6qi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2018 at 09:54:04AM +0200, Wolfram Sang wrote:
>=20
> > > +       /* Gen3 needs a reset before allowing RXDMA once */
> > > +       if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
> >=20
> > So on R-Car Gen3 the device is always reset, even if no reads will be d=
one?
> > Or is that something you cannot check for at this point?
>=20
> You got a point. I copied the behaviour from the BSP to do this as early
> as possible. Still, it might be worthwhile to merge this into
> rcar_i2c_request_dma() and move the call to it to the front. Will check.

I will apply this patch as is because it is easier to backport to stable
this way.

You are still right, we can do better and not issue a reset any time. To
get there, though, I want two kinds of refactoring beforehand. And I
think it is best to do this on top of this patch and refactor it along.
BSP backporters can then decide if they want the refactored version or
not.


--etkrpj2vtdkmi6qi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltWFXMACgkQFA3kzBSg
KbbEhhAAn86pOX23DN9R+yBQt4tA4OtloaBaw77LmpQLA1+JoAR9mVRgExxipFUn
gA/GzVLOuZHLJSLt1t+phaVJOlK7pYnjLCIlOAnKc3obUv94zNSdiEEdXIpdW2gU
HtVymWVXlfUyi5CuozUhbkADwQvCfl+vsRSvpDRgEfTHDNbVkfaTxDRw2UBoBU6L
O03Bc6imPHyh4k1YUYUDiLaZDA4XR3i3Y7leY/QI+aZ+uqwcnmm+l6If03KaOW/u
kaEQm8oyL9XjypjR4KU80QP/KL6qxt/QH7buhqz1o/ZoPSdodoUpSGt0pdxcbmSi
5eOFhnu+JlKd4g5NfW2nMfM+MSGFQkpOlGLqC3L+9ruN484drXqifc+vrdL4m/rg
JWTeJqzRycMjJ639cO82WMKkK6L3MS0nMli9ia0iQJuGpvXHm8v6P77+B+N3Y8qR
O2aS18ZOUok5O/GnvXS4u3+/VuA3Vxa+yClW1Lm7rEWj4HxpNBmtE/1OPQx8s3mp
P5PSnYbKxaLGtWdHP98kTZwqOvFGkOdDxjv8PTCmBTIl9bMwFKzNLmgzztC0fXtj
wuGXQ7KvcuUwyQ8lbUjETx4C/gptY5t289OxcoKon9kNqdT447iHxChNt7aPUvfW
F83rh8388Fivo3spby4Z2RU5cmYrwhhsMgN3F2l7WSvHgYGg/b0=
=MTbf
-----END PGP SIGNATURE-----

--etkrpj2vtdkmi6qi--
