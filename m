Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35752 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728592AbeGYNcf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 09:32:35 -0400
Date: Wed, 25 Jul 2018 14:21:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: skip SCC error check when retuning
Message-ID: <20180725122106.jzv6v3j2wrtqrt6t@ninjato>
References: <20180725121031.24277-1-niklas.soderlund+renesas@ragnatech.se>
 <20180725121031.24277-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="njjapftkbayseskz"
Content-Disposition: inline
In-Reply-To: <20180725121031.24277-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--njjapftkbayseskz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

> * Changes since v3
> - Add check for 4TAP for HS400.

Is it the same in the BSP or where does this info come from?


> +	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
> +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
> +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
> +	      !(host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400)))

This becomes very hard to read. We need to simplify it.

And can you bounce me your debugging mail from today again? I seem to
have lost it :(

Thanks,

   Wolfram

--njjapftkbayseskz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltYay8ACgkQFA3kzBSg
KbbWXw//cyTb+UAvAA8YVcEHWCbOPP5/dz8+3vt4ri2J4Wei7SmKmXa0G5qXPpw0
Ix1srNxbOhGGsB/TTav9+1lMTLo8uminV6hdBb1uGX2gCs0r4sywziMxUh0N53PH
VXKWhkTpwLsK7rWdyUYj81BP66dUSUffU4y38GhkcJ/SF0XII6A7jX6Dv7CeHxNM
gBt8YaHL91Dj5g4kHg6iEVmVkba6XXyReHlGMy/nAWxFSNmWXFYKHQ6H0aBmTT36
ejl7e4IDfkx7qiABnjaH48jEF+D2JiOyI1ujD+R0pkhshakI24CsNMkTZ9FCsd3L
XALebXp1WLk56F2KZ1WE4It7e+OPC2K8EuWc8zF0T4RK2IUknEgIhXV73ghid23u
JeCOVQMjacPJ26b5HlOcciNC8DugNzc+zMU7c3GppdAGKXH+/fe8xrT7W25heK/m
tsp+mGgIpt8ZeNZyo268IpxUUTUqUcRod2uPo+tuGfZlJidGyDy7m7oh171QigqI
5VTlFswCwwLQdFhRZC8+RAL5j4PmFG6BQoJCYo2qmRoomjEVx542ufpp+k18Z3zC
JjWKUFoj/nJUyTVTWigSkxzlnCyJLThdj8jcLWyNt+Y8gxiJttz9TpTQA2nKVIH7
0wpNiG/b+MsmsuSvung0dghBRd7jFHfX7GAj/xC06LeUo/mm5Y0=
=+ujO
-----END PGP SIGNATURE-----

--njjapftkbayseskz--
