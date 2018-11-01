Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725722AbeKBEHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:07:10 -0400
Date: Thu, 1 Nov 2018 20:02:54 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: add initial setting of
 interrupt mask register
Message-ID: <20181101190253.GF2433@kunai>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <20181031230554.1660-4-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline
In-Reply-To: <20181031230554.1660-4-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:05:54AM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> The initial value of the interrupt mask register may be different from
> the H/W manual at the startup of the kernel by setting from the
> bootloader. Since the error interrupts may be unmasked, the driver sets
> initial value.
>=20
> The initial value is only known for R-Car Gen2 and Gen3 platforms so
> limit the initialization to those platforms.
>=20
> Based on work from Masaharu Hayakawa.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
>=20

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbTd0ACgkQFA3kzBSg
KbYvPw/9FpcJv5a/qFjChkLxU9YOZdhs6Qij2c6MZxclwL8+jCT5xZ8oyRNcCc5Y
nw2LHYvDe78Y5/WpXdn6k9tvnWHwtf8j9ex4MNMxeinHGbvnNinaxtvK/qCoQLMN
lDHbLMH6wFJYggpliIBtvuMWWsD6nsCzJsRBg/gyeXeiNQjtp0Tj7HKahYx/SE58
hUiSxjoZbuy2Zy7gxOf2/36qsJ7mG+AevJSe7T3n/5ZYPyJy5mXm8kb0/Zuq+wk3
DIeKH1qyR9T2uIciI5ldvedqTt02ZGmp7ZrHHoRXb+SDg46WPVxtWqs0x4MjtoS5
C2VGOo5H0ER1xZxLwyfyYCI2FsX+El/FWqJobEoviCq1UvKUdXzTMPUBfT41hcu0
kfXfxncnTQZk6R1Fjrp/MuxiB87+J3OlPLHGgk41ulVMCKqlHQTGnkDqQXh4bJMo
dIDheLkUsdSiiFfya8W9MBKWWCpS1bW6+K10YNpo7lVZPwtZbChrS7gwpZ59PUMg
W7UKS8eTn0SWczi0wOlkWJQlVYt/yaIUaQJSbxmrrD9cRGFsf8VTKxGe+sgyTMVn
PYeQMEvgzsv/1KitGZtalYSz4JhMexH2MeRucMBM77dCMlej0VQwNzrOEnKcHzAw
Igb8cEMQiUgfxWYN8QhIb+ZPAy7PMHg/7borOzaikUKWZb3vjxQ=
=R7HR
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
