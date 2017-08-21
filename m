Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44081 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751251AbdHUISL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 04:18:11 -0400
Date: Mon, 21 Aug 2017 10:18:08 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170821081808.7teztwh4hbz25zjq@ninjato>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4zgnzwleqvhaaikw"
Content-Disposition: inline
In-Reply-To: <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4zgnzwleqvhaaikw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

> > Ah, ES2.0. That's the missing information. Yup, is on the todo-list. I
> > will try to test your patch on my Salvator-XS board today.
>=20
> Ok, thanks :)

Your patch on top of v4.13-rc5 makes SDHI work on my Salvator-XS with a
H3 ES2.0. It detects the eMMC and I can mount SD cards on both slots and
checksum large files.

Enabling SDHI on ES2.0 in upstream is scheduled for next week.

Regards,

   Wolfram


--4zgnzwleqvhaaikw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmalzwACgkQFA3kzBSg
KbbYlxAAlAamIqA8dUDOa7nYwNBtaYbXkkoFz38nhh1PSlgPuyN2jLUY7DmSjb8F
bKt/GTHDyzCyQmMn8LOsFE0poBuh2go3Zscw+NDbKx5wo+aLdkkPXEFc76fpvpWi
Jwpq/gb2/WgWjO1WfBICJV17EhxOZNEo8nkn/MO+Cg77X5liqDhpyY2irzZyaAu6
UId5k3/D0WqiZMQBNtKOPvh39ZPQXf1uDC1w/+jgilv5BFoykdJXUbKtLCYb2vBQ
fBKqHls4DqZNZbz1oQhl4833L/CEHVk3+L8ofrnekCFIMKonag5afncFMznphUsR
OnLyi5HEg1syOGk9MuP0pUe3oGX75fPlTCpMCFArF99PgI0wCtzE/DLJUhO/MYlX
rGJxzbNjH+wds6B4+iHllGilTL6dXRcvkluEkE0tOMDPrQjFMtZsMubB/HS1QyMc
mJpSUloqQbllE/BQkerT+BZG+BXpuJ1WnYbVYGuuDXZE2SlwFSR5C+hTvRbec3A/
yeMfEfqqBvsdmqp0E3FG9uGlRt6DgvY6JLzzbfQ7xAOTtZvM4IUv3feuwO7YRRT5
fER/DOtEd1grBBm3aRQo/P4XCBixVQvKWxikAFPxCN7AwDbB9dOahJxjdAv4ILgb
qBwpfeCXDlSMbxIPEFFYopxT1mlicTdbynSmA6WG5g8NrJCcYNs=
=w+g7
-----END PGP SIGNATURE-----

--4zgnzwleqvhaaikw--
