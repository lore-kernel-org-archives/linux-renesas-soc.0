Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47734 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933150AbeFISiO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jun 2018 14:38:14 -0400
Date: Sat, 9 Jun 2018 20:38:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 3/3] mmc: tmio: Fix reset operation
Message-ID: <20180609183806.iex7e2sfoefupnwd@ninjato>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pcw3gj5zt73ehfnf"
Content-Disposition: inline
In-Reply-To: <20180606232252.31583-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--pcw3gj5zt73ehfnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2018 at 01:22:52AM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SD / MMC did not operate properly when suspend transition failed.
> Because the SCC was not reset at resume, issue of the command failed.
> Changed tmio_mmc_reset() to tmio_mmc_hw_reset() in order to add reset
> of SCC to tmio_mmc_host_runtime_resume().

So, my gut feeling is that this change, in general, seems OK. However,
the naming (tmio_mmc_reset and tmio_mmc_hw_reset) becomes confusing and
unneeded. tmio_mmc_reset now only gets called in tmio_mmc_hw_reset, so
we can merge the two functions into one to reduce the confusion.

Because we add stuff to the function which gets pointed to by
mmc_ops->hw_reset, it makes sense to me to double check when the MMC
core calls this pointer and if our additions still make sense there.
I'd think so, but better safe than sorry.

> On runtime power management resume, the host clock needs to be
> enabled before calling tmio_mmc_reset. If the mmc device has a power
> domain entry, the host clock is enabled via genpd_runtime_resume,
> running before tmio_mmc_host_runtime_resume. If the mmc device has
> no power domain entry, however, genpd_runtime_resume is not called.
> This patch changes tmio_mmc_host_runtime_resume to enable the host
> clock before calling tmio_mmc_reset.

I think this makes sense but should be a seperate patch. Or maybe even
something slightly different? Because we have a patch in the BSP [1] for
which I ever wondered in what case it was needed. But seeing the above,
it might make sense to add the clock enablement to the reset routine?
Niklas, do you have time to check that?

Thanks,

   Wolfram

[1] 940904fe4ea8 ("mmc: tmio: Add SDCLK enable after reset")


--pcw3gj5zt73ehfnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlscHo4ACgkQFA3kzBSg
KbaPGBAAmlJWuVwbyTANW+4SBG9v8u6kfJqhLCNWq2tkcpa9MUFa7vY3rEHTUR94
osNPy+bMixBcezzn4I43C1djOHq6uYp7JteUp2+RKmnJsPzlkpsHEYqfsYwuPapn
NOaq2BaqkBs5jzv0W8jgrh27rEJnODoa4XptvfSpr3I1dYNrVq5F8kZz0bI/zF8u
1soDic/IF380lj4lY0gbpjbV8Zuj8KRuFBZ4GK3KKlGxqn2TL5VYjCpOTBM7rROw
QMYIlGhJQu/kHTqkGWFAedZ6/MPD0FN+gTGpxo2QS7KlhYetDdE/qCYTvGqKn56h
Zo9Bzh6qlVToNrYY0zulwGLFYklVYDCqMdvVoYORs8630buQpOBadkcZCZ0iiHxM
rbqduw6rYdvh7xuBCsbFpSk+ojEXurdjBOf8qFFZQjoVDG+6ycyfo1tVlsz0wt7A
m8oBYP3FWmhybn+UjDK0ireIVOrSufAFTSU6s3DHDMIIS4UCN+uFOQpCve2Ud63l
Ty0VtfwKsAYM528ShUGD7Z7vLFFEKdtVI6BFgj2+DfPYNr6vHEFZ/K3eIW0vbUO3
5oC9/AYkRA/YvjIAtsXD2GRcKW4t2Wz85RfBtsvD2Fzbwoiybf9A+5ZYYTsnfl77
krN/68z+JWiNP7Asrw9mNxxCRZgE34hcYDTtaHS6vbCxGbglRi8=
=fp/L
-----END PGP SIGNATURE-----

--pcw3gj5zt73ehfnf--
