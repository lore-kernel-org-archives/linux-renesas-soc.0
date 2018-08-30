Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52782 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727988AbeH3N6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 09:58:55 -0400
Date: Thu, 30 Aug 2018 11:57:33 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mmc: core: add helper to see if a host is doing a
 retune
Message-ID: <20180830095732.s2kuhak5kdbqhwlu@ninjato>
References: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
 <20180829233207.30646-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4dyex2zlmaik7u6c"
Content-Disposition: inline
In-Reply-To: <20180829233207.30646-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4dyex2zlmaik7u6c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 01:32:05AM +0200, Niklas S=C3=B6derlund wrote:
> Add a helper to allow host drivers checking if a retune is in progress.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4dyex2zlmaik7u6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluHv4wACgkQFA3kzBSg
KbbbIQ//RJoFqckcAcRv9BEeQt+rSm4kOOH/lFrc+oWinLL+3RvAvbnkiBAMixUu
1CaupO87wFXMBwidldO9PSu28XDIXchjKdhyls6Nr+lzyzjp7Y1Cu0jAF+JaMDcB
uEEX//ZpDG/ecU9J12YxoTAcPwH/hYP8SbQS1PtXjvc6oXP8L4SwkQ+O4cVhAyAp
DxsG92sNFM9AzT+n95NMQoUlWVohsMkkB3OQyFl2l/4QkwmSJ4VDBj0zrBpjq0zR
J08XQPhQ18PqBLMM5swH8cBsxQdmF3ZSralpJz0JyArB72LVwjFyrA3O1oq4tRYR
dQsEs31yDFzalr+VcFMxSjl9WTmkDwx9bM1x8y22CR7uq4Cah+fs4FZr2h440JEz
8rVauLjJHYZ+UOH96EyWgXDWlFYO91hpEt0xGsmYgNFm5Sjlk1EZqUSh/b2mb9kO
+wx+nsrFTDUcJSAEv2pRFolK+azA3+1VET+q/ro4mSAHK7V1k/YWbNYQw7KqbPsC
nIHghGMFHHIoWH4NltTj4HjOUm6Qzh9XGxfammF7dbfDdW+E69AT/r4PfNG+uPSJ
zvE4AyR6yZ5HvMOw9dJ2OWtRf2RtaTeXLkTI/aUxdE87Rj8TYvrLOMyIOAzzbk8/
nnkcNNeskVUB/fIBk9A7zpB+WBEQDMcWSvM74Y/GuLEkkBL2Brc=
=8ibC
-----END PGP SIGNATURE-----

--4dyex2zlmaik7u6c--
