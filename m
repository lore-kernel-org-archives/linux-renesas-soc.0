Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:35160 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755304AbeBOKoZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:44:25 -0500
Date: Thu, 15 Feb 2018 11:44:24 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
Message-ID: <20180215104423.jj5msnd2evajzwpw@katana>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
 <20180214055800.od5yhgo753522yah@katana>
 <CAMuHMdU3opUTcOY-UeH4ArB+50_drPhGSoxP-m85p9V36fvTHg@mail.gmail.com>
 <ae3206a3-4735-87c8-9688-3acdbf06cc36@gmail.com>
 <CAMuHMdU4_wVcKwjB1ZQzfgp8vCDs92F1o+v4UyZ0bsRDfJD1vQ@mail.gmail.com>
 <15de7079-f43e-1e76-2a99-7232498b077a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="crfqd5x2jhtsjnif"
Content-Disposition: inline
In-Reply-To: <15de7079-f43e-1e76-2a99-7232498b077a@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--crfqd5x2jhtsjnif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > BTW, several PPC platforms use of_device_compatible_match(of_root, ...),
> > but I believe of_root is not guaranteed to be set up.
>=20
> OK, subsequent patch then. Added to TODO.

Can you place it below the PCIE patches, please? ;)


--crfqd5x2jhtsjnif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqFZIcACgkQFA3kzBSg
KbZEEQ/9H1a0As7CzY20vPXWUu3GdHHMo/ElUrwyvWPEQW7/Fugm7ApE8gJmhU6r
ETP+XkkCIh0kY5SlJRUqqwwpd14iUzxS8IDTluPXlKwgAexwzAcRrhG7Z4xEAabc
63EeFkV4W2iTcNaR65q5NBixJDhkdMsqHvk0/dURSh1DMjn+X9MW3ktI3nQvaZtM
x95z7WN81k/bl9jXb+gsdqnA3d53/Zcr+3lARwaDwXpdN3d1Y1tUrdRNPXZSuPqp
806vgwOTxExh/XiD402vBzJ4VR8KIV26k0lcZMgHr1wfIqcMCRnF0lmxUwUMrUw9
vom+oEiAO5M4F/k3iC8Qp0AH6UHAAxcloBoo047cwnZk+zdMSPWCf48BRP+0WroC
xE/kntDCJlwEjieYUoGEUU1xeFTKgnEhUIiXnYuOUaL7qKbfIbC5sy2kTjayKrYo
fsD62vziV5WsIrP9QjYpEmxrjWMidV8jKGvQNsEBO+dnClPeKWx/WwI2rPIHBvyl
8k+drHnLyJj5KBZxp+i+yhuGWvJgGLh8iGvi0L4QOzWTdkaFUXLkp18OR6GpOxeh
qEJnuALrLCwxiL6rKMaE6F3xFoIHsh+RXJLyJZo4rSNzDzxvXoZK9ZxlusapnZJr
s+u6ZC/JmVUEPFqbMt5k2g+l/oLIFbN4dTqlfheaiXgYjBrP/Tc=
=RUf4
-----END PGP SIGNATURE-----

--crfqd5x2jhtsjnif--
