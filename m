Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37574 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932821AbeGIXKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 19:10:46 -0400
Date: Tue, 10 Jul 2018 01:10:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mmc: {tmio,renesas_sdhi}: fix tuning behavior
Message-ID: <20180709231044.th6jwtcwwmoi7j3n@ninjato>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c7qmkgkil2pxjtcx"
Content-Disposition: inline
In-Reply-To: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--c7qmkgkil2pxjtcx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2018 at 04:18:37PM +0200, Niklas S=C3=B6derlund wrote:
> Hi,
>=20
> Tuning failed on my R-Car H3 ES2.0 board using latest mmc/next while the
> Renesas BSP kernel worked. After some digging I found patches in the BSP
> which remedied this and whit these applied tuning now works for me.
>=20
> I have done small fixes, updated commit messages and rebased on latest
> mmc/next but Hayakawa-san did all the real work.

Thanks, Niklas! I will try to get them reviewed this week.


--c7qmkgkil2pxjtcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltD63QACgkQFA3kzBSg
KbYyog//XVUEFhsIr59PpbbBplFM/PKNs5Lwqpz2TgkI5QrTfEvDK+/q+JE3T4C5
JQBo3uAgGdue01h0sk3ia4NGpahxPd6qEWPn8czzbevy2DomHAsHnd18gZwn4K/g
mj0cFtOJ5BH5IwKjy7YD3x6ejqLi+4vyD3vHx8Uv3tGnYDTBJ6QxwgwSYCvtpYM7
n7emJognCOCpjLDsbjMB5svj6c79e+fFVJRhblUMYAW7Amu3Qi2/54EturDWsLlN
L83WmK/T8FAE4fn9/NI2W2t6eXRXYoUg48K2SkDfcWnwtFLdzuYfylwvoXTUH6B7
KFeydFIk/Dx40ccqsRIFPLxnc39J75MlPqj6chhFWW4wp+VfcmJC4clXUX34+KNt
XqZCYBwUISH/VtDDA9idtTcSaU5OmEC2A0uSKVuxB3QqRWgvv6umS76Uw5KZ2DwX
Osp/nU4trdtGKK6MwldKQiQP8APMyTh8kvV9kl6fYl3Wxqlu8nBPWXAez9USpyVe
6X7613lp3LYdwJjIGFYwNCA45wS/f1BJn+LfsJWNdj6Y0N5zuswnA/XTT+089Qmd
XY/sWbkh8JpMCNXUvhlWEVZj8OrGN49i667z2yyp0FFH/vQTRVZOD5HrrEJaoRDP
wrec5s/d1M6YiHUplC4g2y2DDlC75wwQI5Pyaabz9hGI+AgD+K8=
=wCQU
-----END PGP SIGNATURE-----

--c7qmkgkil2pxjtcx--
