Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:34992 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755304AbeBOKnj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:43:39 -0500
Date: Thu, 15 Feb 2018 11:43:37 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V2] ARM: shmobile: stout: enable R-Car Gen2 regulator
 quirk
Message-ID: <20180215104337.ewzggtcm6usdlpnt@katana>
References: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdVO7sxRjj7h=ar+bA8B3Art=Yyyr66cRqC30pw3Zz+Vag@mail.gmail.com>
 <20180215101944.qtiquqqhgmg3gbrt@katana>
 <CAMuHMdXxPk=78D-hFrZvsByCEqh=+JY8C0iCdDy8FzTBPxnKDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="q742jat4e45y335g"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXxPk=78D-hFrZvsByCEqh=+JY8C0iCdDy8FzTBPxnKDQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--q742jat4e45y335g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > It sends per device, so unless there is a device named "da9210" at
> > addr 0x70, nothing will happen? Am I missing something?
>=20
> As soon as one of the affected devices is instantiated, it has to shut up
> all devices. This is done by sending the whole da9xxx_msgs[] array,
> which needs modification now we have boards with two or three devices.

Ah, I missed the "done =3D true;" part in remove

Thanks!


--q742jat4e45y335g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqFZFUACgkQFA3kzBSg
KbZSmA/+PkgHmPPu7xO4qRmRniIgXNVxdLK9b7EiNasHTnZBjVLQqUNzFniTvyEQ
JsHPlxiRaZqpF2B2okpSzy3V7kK3aOWkvuMm7Np2VoSfPlU9CVqTUt2b2W8yu4QK
ixNHKfV1tEjrUtVhMMqGGUfs7tb5iglQnPSbdXofROwt874d53qJ29irX9MaBEBU
SD3rzN0vwBeNSkj+wpwdbZ8+SjRJ/zVVItfdLAOUlf6m8xQkpvREewwxgdK/3mKY
urEMT1EqkA5wmAqgixrWwGCai7/Tg1jloc/OEff0PBChG4zesQVdrLyDJYpxajgl
lGbTI13smgGaDhTp/xIqYR6cJZU/PyCUNT05ccqDa2izc/NYj1TPsgrB37yAO0S5
QUKrEZfzFPEodq3ZFL3INGMy5nJqh+Y8nk0B/83BXybxkHLRsCjmnGPCGyKHiCzF
HCkZN32PknqUJ+RoJ1OMjaeetWy/EeNaFANs5pkPc5Wd/DyYfUY+gVsEMs6lfVO0
1HTc3h3M7miGB1GfT4UJ0cgsy8qFekoR9AIrP7rvG27QO16bxIMOu4WVVZjIQum6
vq/dOOxfA2DHWpR45SPQhLqDPZR48DwEiANw1c/V7V5h8VhJcelJjQRjdsFgVVaY
RjnvetuPWEqqFkVDPoOhHiL9IJBSjM91fdgIQHJ/tVVrZ11Amhw=
=yy4n
-----END PGP SIGNATURE-----

--q742jat4e45y335g--
