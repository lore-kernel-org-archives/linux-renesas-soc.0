Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47632 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753216AbeFISRF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jun 2018 14:17:05 -0400
Date: Sat, 9 Jun 2018 20:17:02 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] mmc: tmio: move tmio_mmc_hw_reset()
Message-ID: <20180609181701.tsp3vrcd32d4dz2t@ninjato>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dsh6u6qwea6wmygn"
Content-Disposition: inline
In-Reply-To: <20180606232252.31583-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dsh6u6qwea6wmygn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2018 at 01:22:51AM +0200, Niklas S=C3=B6derlund wrote:
> Avoid having to use forward declaration when in a later patch fixing the
> reset operation by moving tmio_mmc_hw_reset() earlier in the source
> file. No functional change in this change.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

I'd merge patches 2+3, but I'll leave that to Ulf...


--dsh6u6qwea6wmygn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlscGZ0ACgkQFA3kzBSg
KbZNKw//WetGMN9+RqM01vQCsbYp0pRAkrdL0n3qAlP0ysp2MLe/1yRmkeHLDXwJ
XJP/EMMXG1N6+mEK4S/oZN+1BAV3BuoFc8vsJw4MVH7fEbRtIfz2zp9JKxA/8dGb
SqdCcVux9gjbN7bkcABtjIMlfun+ATgoTXyCK0jP7G9owympx98rSH2HQKWyS+G+
nauIvemCfedDERI0D6f+rbYfV8NsBys6U7Puchlq5/9MbTwxaHtnx35Uf20pcBWi
fOy6v2tOWc/ar70Vu/LDx16KwT+mCrA8p4QOd2iysGfdwIcSdUMbW4N5+v80GpIk
hRELbdAqCiTHbNVyePX1vkbGJ/UFWgkp+BfiPb8OKp0JPvOx31qt/dkbyxIlI8cX
dk6EmWnAOIUDPploNwqeV3ETjLBBcgKj3qb/Mkk2+ybu5fw6wkrwhi1HUpiCW9Gx
qT47v4ZpC8AiP/mAYTX9UaLDGGaKLgtKT/1nl7MYCBbi7zxfIAfMgmSW887p6EL/
uhJGFALf7LYqhnQVbVEGsBTGbA3qVEfk05GC50uByjRtJOz7ItZybAR9jbwWGN1i
1NCdpoJ3wWi1F6WJSP3IAHFwe0f2giEfB7W1XhsReBUcAIAiUTWLh/6rkwJd9OP3
jMIptSyklYNFV3YuflpFbH4o84VxtXCKfz+j1TgPa86gINtBwio=
=/NVX
-----END PGP SIGNATURE-----

--dsh6u6qwea6wmygn--
