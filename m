Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752100AbeABKpF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 05:45:05 -0500
Date: Tue, 2 Jan 2018 11:45:00 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20180102104500.okz2szyhlxfdypeu@ninjato>
References: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
 <20171221122425.3uz5mquj2a3373gb@ninjato>
 <3d26f184-ed1a-0832-3c58-01a6173560e8@cogentembedded.com>
 <20171221123715.7xjyfx2zd5uznf5r@ninjato>
 <20180102094017.zguthef5gebofnbi@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u46zpkyf4bux3ycj"
Content-Disposition: inline
In-Reply-To: <20180102094017.zguthef5gebofnbi@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--u46zpkyf4bux3ycj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Well, it was not in renesas-drivers/sh-pfc-for-v4.16 which I used as a
> > base for the SATA work which again is based on v4.15-rc1. But nice that
> > it is upstream already, thanks for the heads up.
>=20
> My tree is also based on v4.15-rc1, for now.
> Is it safe to apply this patch without the dependency?

Yes, the driver will simply not bind (which is no regression, because
this is a new node).


--u46zpkyf4bux3ycj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpLYqgACgkQFA3kzBSg
KbaTCBAAjpYz/Xd7yBZEgYuAycTlHrks5T3KEfJejIk+F6YHXDIn+6nkf/nil4lI
wKGSvx2IQUhu6Gqf5Lu6Wkn4vjLoVL3J0mmcPBYQowgUvN2VUyLroVR7JkByi6Og
kRvWWU2rGkqwoUoiSpNzhhhmsGjuvSJpLa619tAxLYsth1rQOvq/Wv7ZrMePZpIA
6qmYEAthS3r/oqFoPmv2VhO3Lfe71bLPt+4oZZxlOS+xRbZR7T7MuqIGqzPMfTZR
Ps6iXcllgScW77ArZr85NNNc5Ru7+MVtT6H4aEA3LT1sAXH31bdEZeoKDFVGzCjV
xGHo+DTtufZxQZR4jgKwCQO4W0z1QJR99+94Jt/BRZ+gqvxb/z+gOgoNTqGTTKUI
yUNYS3K0tKj6MySksZK4Zaa07LmQ8jL8qzn1YVHU8HtHI0aj9fpYNjlYjAjHJOlF
JnDd2vh/sdz7ZvH31apz6t4avS5h3r/m98qtUHLp4oG2vrKMhuTwfbSuEisqihsI
b+jyF84r7vAyc2epBuEF2IUNF4SNpvRh8HX5tprLsJ4+HmCgsbnQcYMV/TuQUpkF
fae3ddEh040ObCRMqIr2UhUCypKn/Ul0O3L6dqEnUF9O87EZeXR/3eOVPizxlC8X
2E5J+2vKh1+DD8tS/nRfVelmlyXcI7gyOA+4YGWnt2Ev+xFrGq4=
=dyID
-----END PGP SIGNATURE-----

--u46zpkyf4bux3ycj--
