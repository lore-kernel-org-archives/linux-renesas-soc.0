Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34174 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbeHTXYI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 19:24:08 -0400
Date: Mon, 20 Aug 2018 22:07:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
Message-ID: <20180820200704.smyo2bc3tn5road2@katana>
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
 <20180820164236.26nocbvtr5scp62v@ninjato>
 <58234466-b523-66da-82fb-12ef54739dfe@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o2fdrhvdwtiwbiik"
Content-Disposition: inline
In-Reply-To: <58234466-b523-66da-82fb-12ef54739dfe@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--o2fdrhvdwtiwbiik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2018 at 10:44:18PM +0300, Sergei Shtylyov wrote:
> On 08/20/2018 07:42 PM, Wolfram Sang wrote:
>=20
> >> I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 =
SoC
> >> has a single SDHI core anyway, so can't be  a subject to the known RX =
DMA
> >> errata...
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >=20
> > Nit: some strange double spaces and '...' in the commit message:
> >=20
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
>    Should I repost? Or you'd squash the fouble spaces and ellipsis while =
applying?
>=20
>    BTW, will this patch go into the next or fixes branch? (I remember Ulf=
 wanted to
> stick the analogous R8A77980 patch into fixes.)

I'll leave all these questions to Ulf.


--o2fdrhvdwtiwbiik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt7H2MACgkQFA3kzBSg
Kbad6BAAisn6ingaU8VA7Y/vJLrv8trxkQNgLzEuo2AXAj+U/MLAK0ub7T6yq4F7
bQzpF7TaYd0ZRQ29W+y0+XCFl/gRqFvMFZKJHsLqByWFCOjPgaTe2OaRYlafosIN
/lZH0ITpzJ35Ry9R1sasJZI8ipRc7OpLvuNRGF1dYxgKYHjDum8E4jIaHGJm44VQ
LIV1qLf8Y0pZTGAfQR9xm+ODDmjltsm8J3LfeaqHWU8hnTVZV/HhCw5iRZJdLuY7
hE098a+qgo8NtWbuH1t6gl6gzneKo/XcJTQwhRF8BNfPthgZHThzHPfK9ooObW3o
7LD5vOAx9jm9kAjA6+XB84FxE6GjlKP+FpBJL9+uzjuWldTUvytVhVfraGHFtVrg
zeOqFdTYRUWFhjcN34gAr/OMKkFpfkY0/5Yul6nsR66fx67dj8TsOB5Nr0RwA+yr
zjyGBfCxDbHyLnZGviNXusHQ0zJTnvUq8ZAahg0rgWp0/UjCqSRs1iVrrlXOJtyG
vHtdVx4tQMSwrAhEOHD77qf9h37Md4zTFtzF5ROHNLT5y7DqboeRQ9jLhF0Pd599
tWVpvfETPGg3qJ1ipw+7zfk21MRVXjiwgWtCsGFUcooUhao99O/f/PAFUJK0gFlo
52wUvjJauPQ2tfBhO9JJ8TL4RI3uhAIPwL9SRNjWMe7vg186CvI=
=CaEt
-----END PGP SIGNATURE-----

--o2fdrhvdwtiwbiik--
