Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbeH2LLe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 07:11:34 -0400
Date: Wed, 29 Aug 2018 09:16:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 1/2] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180829071604.ougz57qvpliwodep@ninjato>
References: <20180827151321.18015-1-niklas.soderlund+renesas@ragnatech.se>
 <20180827151321.18015-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kqfjohuzvw2z3sv3"
Content-Disposition: inline
In-Reply-To: <20180827151321.18015-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kqfjohuzvw2z3sv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/*
> +	 * Skip checking SCC errors when running on 4 taps in HS400 mode as
> +	 * any retuning would still result in the same 4 taps being used.
> +	 */

Did you verify this? I didn't have the time to do so :(


--kqfjohuzvw2z3sv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluGSDMACgkQFA3kzBSg
KbYCzA//dvyusIYgigMSjrfC24YJK1i26Pv7As5fJ8tU98ne7f1dvidBnmx+DSE7
p3L8Qng1p5PGRNJ77WP0RiKKTBu5SBes2Dl2rf3h9rp6FppzexKmx+s6UxX1f6cV
5wD2oYWxg3hJ0GKep77k32qoOaN6bmyoeeylUhXhQsHPqgzvCkcDxAj35a+4OGK3
PpjyZtWVc0v12Ra5w1ix96BgvN2Vee+9Bxmba2abL/SmgETmgfsR4xZNl7KTEA2G
9kswSk7+WCH3BszgMfTb4zLDynMe7iCIKpQr6i2waOd6iiQn6I2u4m93M6lbpYCZ
Z7jLCyRJ1HWa/HH/OINxu+Odu/o135sCuxisU5fNPTWAp3w+Wpw3rVtX1PrdbUcP
UFOl3bEUb5+ZRrNYmzAOmdiRdxoMprELpIiHjIpPUGYx/BmeReI553RGGMVrKnmv
c+mBhfAHyC9rG4LAKylnI9eFGIH8GtJy28Pd3hOGUakQ3p+eH6ZApxkPDaq6kK1l
OXjX9dBxSHSGrcGIe2IbI678H9D/HkBz8xLre07a/0oNnsBaizEbI/E23kcndQ8L
iArECz9NGunOB4Tj3MssmaK5gIU3lFGQxgHoWwmLOv8VbyfSxqSdz3H+nr+sq/x+
w6TPVfVTGEP2M7b++vXOkeFoitvl69N5VFqgrlm8UlCcnB8vd30=
=61Q4
-----END PGP SIGNATURE-----

--kqfjohuzvw2z3sv3--
