Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59968 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932085AbeFGIq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 04:46:26 -0400
Date: Thu, 7 Jun 2018 10:46:20 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/4] mmc: tmio: Fix tuning flow
Message-ID: <20180607084620.xs3wwotftawb2wc3@ninjato>
References: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606204724.26055-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kfhrtbnv47sygtdr"
Content-Disposition: inline
In-Reply-To: <20180606204724.26055-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kfhrtbnv47sygtdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -		if (ret == 0)
> +		if (!mmc_send_tuning(mmc, opcode, NULL))

I'd prefer '== 0' here as it makes clearer that we are checking for the
good case here.

But in general, the patch makes sense to me.


--kfhrtbnv47sygtdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsY8NgACgkQFA3kzBSg
KbYkcw/9Fw5FnBItBRodtd7wJgRy+7mUyfoUvowSMafdlPdJYbJogK0z2YxR3OV/
pQ59Og1ilK9O4614vBJwhipHdMoK1BupWiYOpHoUT24kO7nmfQU6xG3AFqYA5fJH
6C3BkbQ0YhmRpEvJGf+6grzOlL4lKYLiPVHFXPK0lYKDhqHYgauCvm9odrlQ91ol
+GL1d8qA4KPPFEDxQyOWVoBiVCW4/k/yewvVR9o49k7J+b2TpSX8tJeIIJ+pxEof
Wrksc165qkqd59tmIhAv5tYXnbXM2bKM63qA/lgyGH2+uZ1pI2TdFaxqkA5REo/D
N4j8qzFwfS42j/ChzBEwtok8hWhGSwk/xjq39VYowmd+xoswBdgK/wnHtoPEn3Th
7yqfrSkJh3TNp1g688sZBPvnn3CnCKWW+rNL0hKZhZXrcQDpFr1pSLVfdJNSkV7X
+k7sM04fZKcjhPnBtNl+Rar8zf7LnJ6Wfe75XJNQYy+6PpEKMl5tekJ2SXfppGEE
KAl7nFOsjL6hW1DKk/oNfuk7uKCA2D7n/SpttyHYXRMdpKHjdmLVk3nP8233G1PQ
sQ14N8t8FxCf8jr8SjIeAwdSpKQdNPgCmnHeWRt/O+aXvwEb+UIv80KFDDR6tXNA
a1L01lthrLQJXJzfoQRRRnD6WfLwA3L/kEHb7cyBBv2hMvHZQx4=
=XcV1
-----END PGP SIGNATURE-----

--kfhrtbnv47sygtdr--
