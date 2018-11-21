Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59660 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbeKUNID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 08:08:03 -0500
Date: Wed, 21 Nov 2018 03:35:41 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Avri Altman <avri.altman@wdc.com>
Subject: Re: [RFC PATCH 0/3] mmc: refactor RPMB block count handling
Message-ID: <20181121023540.GB2445@kunai>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFotAvkLzpAeDvvv0GB=_nJsJPkRbRc657=o3ftoxdXZDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <CAPDyKFotAvkLzpAeDvvv0GB=_nJsJPkRbRc657=o3ftoxdXZDA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 01:31:35AM +0100, Ulf Hansson wrote:
> + Avri, Cl=C3=A9ment (due to recent related discussions)

Thanks!

> Perhaps we should add a suggested by tag from Cl=C3=A9ment for patch2, as
> he kind of suggested this change already [1].

No strong opinion on that, but technically my inspiration for patch 2
was Hayakawa-san. Add it as you see fit...


--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv0xHwACgkQFA3kzBSg
KbbuKQ/9FbQVUUc8/eivzbu0koISboHmd1zOTQfSk0bJYwCQq8G8jwVMRAtR6rnE
rtSZu8ysgTfwaScIkQZhEF7UKNda/KwPyaTTSKnWroP/lz8N86xILEDhPVOhJjLY
503XoBFTv+9V2BUhG9+f7CxS8YQpkpMJ4OoA/e3as+YMlhf/z2a8iHt38cY7tdrz
9YC000KjY2OogcZXx2PcJFpICbw2GPMwgkQHRu/bp64s4/D1Vs7q588RjVx5t6h5
UQ7FIefWGhv0yoDBtWhXaN7H40XyMP/6rNvsjecmKHUSw7gWFavHUXS35rkJL+uQ
b74rI47hXwny1cGgPRUCadJv7IMt6lfCmDG4FhVMcmY9Rgbxbwbq+ALPPkCwJy/T
yIG003sxWSMxZoe8LZnumers33412KSGHZT7tSKY2pY1d7v+QlQSB0UAsc4v+CiU
raIz4vUJzGOcgOgfa7N9lcP8ThwX1eo41kW1Z3gRGoRn8RpM3NOcFe58UBID7AXb
g90Z3JJ9yZPfLwR/Efa3wWpLGEZExYALG+qz9iN/KwdhOhh7jYcOQPLpDkOAAElJ
viLoDFILLFTw8+jIz/MGjQvNRgCxwqyjlDgMNTGy0JEIrmwo9Nz0diJ1Cjup4QAN
4rWbtFlM4JZQU2ZjLFQaaWvCpRvHVfFOrTR5HRO2v+RE1I0hhl0=
=ri6O
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
