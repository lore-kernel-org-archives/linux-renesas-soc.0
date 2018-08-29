Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44690 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbeH2LMT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 07:12:19 -0400
Date: Wed, 29 Aug 2018 09:16:49 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 2/2] mmc: tmio: Fix SCC error detection
Message-ID: <20180829071649.2h2crjd6lupysv26@ninjato>
References: <20180827151321.18015-1-niklas.soderlund+renesas@ragnatech.se>
 <20180827151321.18015-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ampaqgqgmmnju76g"
Content-Disposition: inline
In-Reply-To: <20180827151321.18015-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ampaqgqgmmnju76g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2018 at 05:13:21PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SDR104 and HS200 need to check for SCC error. If SCC error is detected,
> retuning is necessary.

HS400, 8 taps, too, or am I missing something?


--ampaqgqgmmnju76g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluGSGEACgkQFA3kzBSg
Kbb//Q/+LbSTkAgUPRXJHW+Uk0wQ5+uHGPLLQrgmncqBzpodQsEgX3O1NWBqOtyA
zTOWPRivjigj0cE16I1+PdgTDZwkE8AsRf9e1+nUnGCGlWTVlok+nd1iDiKqCHR0
DJAXfx2z9MaZnXjoMHriujtOudEStCCvYaeTv1Ln0zTeXBV2yFWvfFC/FB10PsKg
kufVYUlqHlhTsoOvrNPJrutqepof4+PLRHca3QzkhQxSdZl8sNOl90Q7hybSJ/ct
1PPUxDmv9CQUxn+BGY0v9zQBwPnZotoK+mX9GGkr4tztbz/xGefGU4RxYW8DmFRl
Y+M8EEAsPG0h3l/rXYH8JK/L6adsedMhJgiCu2qmi/GRkdkvlzxYsugt0iPUn5JE
MyG4WQkPKYl+A5hZXjoT2bT9zRxHKkvtY3x3nWf9D4xD9C5O+rCMuS8RrkGIkOdK
TqXeHoSyCQGtBF5UjgITs5lH/fwUX+nXpucbomCC6YYagFqppRaExZH12YtMPBHY
dIhYHqbeNcxf/0XlMYs0Jac3b1bcV2tjJI8gpH9DgnAIucDTF056UM4Kp/MsdVvT
2Y0aQI8Ejuf3IWqF1zKijerLDHC644lW19P3pRXx8pEB1ph1nwg3eQCLQ5WmMl7f
EFsUjOT4Wey9haxOw/hgO40oaTgxLn6tbqIClsf9I09grNtK5wg=
=RuuJ
-----END PGP SIGNATURE-----

--ampaqgqgmmnju76g--
