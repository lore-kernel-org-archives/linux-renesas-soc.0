Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56200 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388241AbeGXMch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:32:37 -0400
Date: Tue, 24 Jul 2018 13:26:34 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180724112634.amylptym4mkgh3ym@ninjato>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dwfausn6dx7iipew"
Content-Disposition: inline
In-Reply-To: <20180717145216.16840-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dwfausn6dx7iipew
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2018 at 04:52:15PM +0200, Niklas S=C3=B6derlund wrote:
> When tuning each tap is issued CMD19 twice and the result of both runs
> recorded in host->taps. If the result is different between the two runs
> the wrong sampling clock position was selected. Fix this by merging the
> two runs and only keep the result for each tap if it was good in both
> sets.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

So, I tested this patch without having patch 2 applied and it worked:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Ulf, I think patches 1 & 3 are good and should be applied to 4.18 with
stable attached.

And I wonder if it was easier if I'd send you pull requests now that we
are working with even more developers on SDHI? Simon, Niklas, what do
you think?


--dwfausn6dx7iipew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltXDOoACgkQFA3kzBSg
Kbbjnw//TQyTahHkM+OmbVfPn7zSWnJ6b42WbLwC8Ls5kSCBgWjkEb3kS5WUE8v9
1hBXX5pVd1r64C7ixuRhaeSa1blGlH0/rKZSC89Naod+Z2VyvomhDhr4+FWNBkVN
C5CdlYUC2BvPPYOMyxO9gTaziVRszL1XKTI4+JUlbLrXFLSvHIo1uOzc6737hJcd
t+bSl46HXSEPVNhA/625FRa908BNhtLp0UoxuFodCAXMtbSvRrfFxjTlayOsVgd2
/q1MSymYSJ+ca7JFScjopr/9cHig5QW8ssKEWFid6uqlcHzMAE5LXtLo7m/Rw6qi
vhV58K3iCrb59ZZ9NO8KUjtn9bgzdqX1lg0UnlLJBRh8+whTUwgpxs9vOzO1w8X9
LaHvEOCigjrn2Vr2hr0/QIF9BUFoWVXRXvuBXan+CELxZI2pIvW306Wy5qa0Q1ZW
aFot0rnvQKqXaprWZoZfhV0uB3ASpuk0UMt+hoiPi6XE0ZakljrXl6gYB+AG/qLO
r2NUOGv1eDv3dpZfj7K4y1+34exES2xN4jRkpB/a6W0yULKK8grFCIUlaBJnRxdm
7FNssXx8Xpwp+WturaVlsbZLu9lsB9boxIA3VTcwQT4rxy07zvdvEJi0NfTEje+5
7w9XLOBuoE0WD+TW87GMZYmsgdGBtu+VZ9ub5G29NNgBRmO9qD0=
=iQoC
-----END PGP SIGNATURE-----

--dwfausn6dx7iipew--
