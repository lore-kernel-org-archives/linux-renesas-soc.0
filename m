Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38698 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbeKBEii (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:38:38 -0400
Date: Thu, 1 Nov 2018 20:34:16 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 0/3] mmc: renesas_sdhi: extend quirk selection to
 handle ES revisions
Message-ID: <20181101193415.GK2433@kunai>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1ppIqr1kl39GnwQx"
Content-Disposition: inline
In-Reply-To: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--1ppIqr1kl39GnwQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Patch 1/3 adds support to select quirks based on SoC + ES revision using=
=20
> soc_device_match() and converts the only existing quirk. Patch 2/3=20
> Removes the old method to select quirk based on compatibility string. =20
> While Patch 3/3 adds a new quirk from the BSP which blacklists some=20
> known problematic ES versions for HS400. HS400 is not yet enabled=20
> upstream so blacklisting these ES versions is not a regression of=20
> functionality.

This will allow us even to get rid of the TMIO_MMC_HAVE_4TAP_HS400 flag
entirely because we now use it only within the Renesas part of SDHI. We
want to do this incrementally, though, because we first want to get the
HS400 feature enabled as the first step.


--1ppIqr1kl39GnwQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVTcACgkQFA3kzBSg
Kbaz+Q//SXlifLkTdofMu46f3sb4TKpOu0Zwku7DQ4TU6akVcyR1c93fSfph3DvM
qokcI4WC5dA2U46v0nA1DZQBP+Y1OC/4Opw9GGhJ9KKoq3W5KknWoPeSWAENdEml
9JdxCPwJYzv9DWJZ4SzHXj05CsM03faVwIRoaKCinc2prSO3JVihCRL2n6EJO39k
YhcMrcjmCnoi3orAzlCmA4pvGq0i5BgQoPZ7LyEouA+DKsv1/nH4jFEMi+X2buhf
45V68BnNBt5foOYy1N92nZR08JXszRNUVz1FDrQsql/IGwiAu/EzN22lM2e9bquw
7QyLYoKYpsW3N2r7le5FZGS0qeGrJwZXMFFgj6SQARrY2OoMFPoi6EJqCLKY+11d
aeUDkVYmjiNleVQAx/Lks81jMFFmEE97YL5GBOes0xKtCsAD/Io+i/0HBLtBe+td
z7RGt0s4WOTQz+o/fg5UCHYUV0ckiGP7qhhZCa15nUZ4kA1DJnAYVjmR7HVuilIR
xBZtVP73ZZTiZxFMQRUWetI6hFn996UnyRXTi1SCMIKQDu89T6S3ySlhGFC/m8J/
wVL+ggCUebc7nkKbZUEM1LY5hmSSW/3tEZNY+877/tviqXP1OYSEwDrY15gWyFMj
BSPn1eHRUOhHtGmY41t9hLovENTupTIHEZOb95mPLUlvb0JviTU=
=r/Z7
-----END PGP SIGNATURE-----

--1ppIqr1kl39GnwQx--
