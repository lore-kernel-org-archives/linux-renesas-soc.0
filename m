Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60648 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752870AbeFTFwN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 01:52:13 -0400
Date: Wed, 20 Jun 2018 14:52:07 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-serial@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Use pm_runtime_get_sync()/put()
Message-ID: <20180620055206.jlsyd2sjqro46z2j@ninjato>
References: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d2t6tgm7um4zcyl4"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--d2t6tgm7um4zcyl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


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

Ulrich, do you have an answer to Geert's question?


--d2t6tgm7um4zcyl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsp64YACgkQFA3kzBSg
Kbbb0A//fmOVVaG/eFAUSmNPob0g/oEJdhLgVAjEbIxE6oXb1cxGwc7xJVN1I3D7
xXf1SUMOAFUva3pL/3zYfc4n2xwoA08/YgwmXQ8VGfVRpDspx+tT6Nx/zFBn3EqK
h1xCll575JHb2Xy7D4XDy3ZKZoun1j/z/h0mR2YsMudG0dxRN/B7CEHCjm2GFQrU
iQvkmyKMZNdhOO6HfKzRyvgM6D48PQXcSVReeTjVLbug1b4Y+uJBIdo6SqDmAAgM
3Oo7DTJodYs5hSQN/2bsitVDUPKwvunWuyyx5QFQYEEqpKLcLfkeGGOIWJF0z1pG
ehrDXhszIQuyjj0tuz9U4aFpSzCrl4z8ZiJZys/YpGoX/Uj8DBD6Bv2S2gPlyUei
8vkp8Ag78pD0jMWemN1QwSdBcDDGAtOv2X23L4giEuRaw752SAHL8m7u/8YyNkDZ
iiqsPJfTT+YhfRLApj96iLdP72XGJtESCIx8UK/opWr4fWRVu5cKSsHnmrKzlagJ
G8gvMsFCh7fieofZuYw2YsXqwaTqx7AlF0dspQDlTeOL361eU8QgGDhzRWShpYmm
8XSf/XIOG+YicUS0idGhQ0WUzdU2buizZu1jYV8I6Zqp6pBAkSY5avQZDJTdl1Di
9d38J2xcMz67oDW5rUHekXgy+0vierYAYw96W5cLLED1aU70rZ4=
=q+qu
-----END PGP SIGNATURE-----

--d2t6tgm7um4zcyl4--
