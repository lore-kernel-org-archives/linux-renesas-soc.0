Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:59466 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbeGLJJC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 05:09:02 -0400
Date: Thu, 12 Jul 2018 11:00:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-serial@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Use pm_runtime_get_sync()/put()
Message-ID: <20180712090021.a2e5p3t2mmoimtio@katana>
References: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z4anosvar7oyar3d"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--z4anosvar7oyar3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 07:27:59PM +0200, Geert Uytterhoeven wrote:
> Hi Ulrich,
>=20
> On Fri, Apr 13, 2018 at 7:00 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
> > These patches make sure that the device is up while the suspend/resume =
code
> > is executed. Up-port from the BSP, tested not to break stuff.
> >
> > Hien Dang (2):
> >   serial: sh-sci: Use pm_runtime_get_sync()/put() on suspend
> >   serial: sh-sci: Use pm_runtime_get_sync()/put() on resume
>=20
> I don't think it makes much sense to split this in two parts...
>=20
> Furthermore, shouldn't this be handled by the serial core, calling
> uart_change_pm()?
>=20
> It looks like uart_resume_port() already changes the port's state to
> enabled, while  uart_suspend_port() assumes the port is already enabled,
> and disables it.
>=20
> Perhaps handling is not correct for some code paths?

Ulrich, what is your take on this?


--z4anosvar7oyar3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltHGKEACgkQFA3kzBSg
KbYgZA/+Imu76eHLkpWy8YW6qYosqIWDMaQkonim7BKRPnyp3lMddXiw25/nEmL8
3dPoEa9P0m4UoawvA0uzqX1Cgt85zoCbkAi5mBQzs95FjGePgINsc44bqzVHjUkX
8l4SMCM/ou+pWXRScJvqCxwx9IAQ+bZZS0gFailaSxuRGgq4DwlQvk3ZBZyr2e+E
Zfi7mBXQslmCHfQ5ieeIUhPQw5gth6QZQDS7+AE4u3Vl/T2KyM4+v68datcajcXF
VVm6k5ynaEksW3Ljf3GAqaQe4WxpOzavYdgSO2TzqGrbKqVoB0qmPrj2Q56D4D0d
CFJcAI/b8Lk65l6otDsBCwnXyFaIGgGfsIiovlL29utawnh13hBLKr95KWaVLi2P
XlqadW0/DXpMId5gJgem4rssQUmopPBEtuxGOhB6JReN+i7+r0t7cn5FsmECHK4X
GCH3T6lXgKjh2B9QmDvEhWz0GGSImZP6QvGb7NvBxVTKsKr+hy0DC3ODpOuYwD5b
L/nDVcZASTUptX2tNzKUDsVZjQaULe8qJpKhGZV4TI4Rxrbri5h01Ub0wCBLb/iL
LoO13ojeBJNApR+7sN68HjWUwdlxQGJ74X3BcIxg6ZH7/wMloK5iy89A56BiBarL
lhNesLWfZPKyR1ibrgq7oPu2BX8olt4TK6bK4accBve33L8uJ+s=
=yAPH
-----END PGP SIGNATURE-----

--z4anosvar7oyar3d--
