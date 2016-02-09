Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 9 Feb 2016 14:06:57 -0800
From: Eduardo Valentin <edubezval@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Wolfram Sang <wsa@the-dreams.de>, Simon <horms@verge.net.au>,
	Magnus <magnus.damm@gmail.com>,
	Linux-Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4][RESEND] thermal: rcar: use thermal-zone on DT
Message-ID: <20160209220656.GB28102@localhost.localdomain>
References: <878u3a2zqt.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <878u3a2zqt.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2016 at 02:43:55AM +0000, Kuninori Morimoto wrote:
> Hi Zhang, Simon
>=20
> These are resend of thermal-zone support patch for R-Car thermal driver
>=20
> Kuninori Morimoto (4):
>       thermal: rcar: enable to use thermal-zone on DT
>       ARM: shmobile: r8a7790: enable to use thermal-zone
>       ARM: shmobile: r8a7791: enable to use thermal-zone
>       ARM: shmobile: r8a7793: enable to use thermal-zone
>=20

For the DT part:

Acked-by: Eduardo Valentin <edubezval@gmail.com>

>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 37 ++++++++=
+++++++++++++++++++++++++++--
>  arch/arm/boot/dts/r8a7790.dtsi                             | 26 ++++++++=
++++++++++++++++--
>  arch/arm/boot/dts/r8a7791.dtsi                             | 26 ++++++++=
++++++++++++++++--
>  arch/arm/boot/dts/r8a7793.dtsi                             | 26 ++++++++=
++++++++++++++++--
>  drivers/thermal/rcar_thermal.c                             | 45 ++++++++=
++++++++++++++++++++++++++++++++-----
>  5 files changed, 147 insertions(+), 13 deletions(-)

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWumL+AAoJEMLUO4d9pOJWMmIH/jPQDi5wgPJnOeINW22fJKts
/l9odAwxdCykDcNpUmZ+9Ov/dZak02CAtM/1dZcmcENd7SB0i2oeyWQHB6TyzfMr
eN71s4S6zpTPEo1V7t9YQJAw4nQA1FcOgP1o8KTgC5VTFCrzKVuaBw8V/epmm/hZ
pTt8tJ+jVLBHtf/VODqM16MBNalRvLFYWZAOki4MkVlxyXZxaZR/15/Z9Z+6GGbS
hy/BeYHu8zurySONYou3lMMSZrTkCcZrJqrRs87aCCu08xfMYtScPVCpk9pEVFkH
Zz/v9I5Z5PFWr+W25c8MVCBFXHIQkRuo+Gd0vlHw8RkfugJKDDc3JaBW/UeDyKI=
=EVcc
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
