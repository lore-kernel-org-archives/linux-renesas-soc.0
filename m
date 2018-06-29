Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Fri, 29 Jun 2018 09:54:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/1] i2c: rcar: handle RXDMA HW behaviour on Gen3
Message-ID: <20180629075404.ivnaauv2hdir32ig@ninjato>
References: <20180628204538.866-1-wsa+renesas@sang-engineering.com>
 <20180628204538.866-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWEce9+Se0b0pH2Uvma68ozSXxiPGUu__XFFX=yBtmKjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zo52uacn4npqaxah"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWEce9+Se0b0pH2Uvma68ozSXxiPGUu__XFFX=yBtmKjw@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zo52uacn4npqaxah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       /* Gen3 needs a reset before allowing RXDMA once */
> > +       if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
>=20
> So on R-Car Gen3 the device is always reset, even if no reads will be don=
e?
> Or is that something you cannot check for at this point?

You got a point. I copied the behaviour from the BSP to do this as early
as possible. Still, it might be worthwhile to merge this into
rcar_i2c_request_dma() and move the call to it to the front. Will check.

> > +       if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
> > +               priv->rstc =3D devm_reset_control_get_exclusive(&pdev->=
dev, NULL);
> > +               if (!IS_ERR(priv->rstc)) {
> > +                       ret =3D reset_control_status(priv->rstc);
>=20
> Why this call and check? To check if .status() is implemented (it always =
is
> on R-Car Gen3, if CONFIG_RESET_CONTROLLER is enabled), and to avoid the
> timeout in rcar_i2c_do_reset() on every transfer?

Yes. We can save all the hazzle if it is not implemented. And I didn't
want to implicitly assume that it will be implemented anywhere forever.
That could be a very subtle bug later.

Thanks,

   Wolfram


--zo52uacn4npqaxah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls15ZgACgkQFA3kzBSg
KbaiVRAAn5Wi37NK4TQVOkJTgQQ7Z3vQUZV2DmciJ6LGfL0A7ansiICbaJXEn5mc
DjwJ/+FxfYdTkYIjPu7kCkvuphLlChONjnZTbDpZzsIew8f0nPMh/2+1Fq2N62Ht
FzW5XD9bwJs3My/BuZ6tKWrkUZuMFKgz7X3HepnokT7/8j4SNwldLnUpt8sx2Jv/
ZUbexfw5Z89xaN67DYDKSBtXF6mMi45MB6rfXM8rXCQaPiegkNzWNNpO9B5rZGhS
YhKWjU6ySjMw9m9b0qIrYjt7q9soJFzzfgViw6V70DslJZCfVf0ba0nb0VVC9PdB
OnLjnBljOwHEaZMGu7/Iz6/uLCNXTVaiqzdzN/4i1sSJ3V7V+WPA0AEd5HSXlmNJ
yO/iaSx274yklxw6iaxW12Hs76Scy5FB68XpI6GT0lH03yj3a3j1GRbgUu+Iro3I
phws+Vb18TmbklwfyBkdkUV0v7UDy6lW9yha/Dy8DtmHCtpYBv8N30AHpfRRD2mW
UiG31+PwjLCuL6qzvEzuz+3GcLq7GBqTNtF+e8sHm6XiWjXVaLgKhlSd19mXagy5
hPfEy9lNyox3AARoPQI0yMmEaCAGhLI1ro2LgPhFLZ/fHp6o/2tH/otD4/n+R+uY
ps8J5EbKxmZMTEymefsL3aTDAkx/nq2aRfKXLnPYrE01dSTJl+s=
=5+3O
-----END PGP SIGNATURE-----

--zo52uacn4npqaxah--
