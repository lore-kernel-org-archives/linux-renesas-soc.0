Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40386 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729490AbeJEXOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 19:14:19 -0400
Date: Fri, 5 Oct 2018 18:14:54 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 1/4] i2c: core: remove outdated DEBUG output
Message-ID: <20181005161454.usqywe3lbfqjqzb7@ninjato>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
 <20180920161423.13990-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rp6ctkos6whteo6v"
Content-Disposition: inline
In-Reply-To: <20180920161423.13990-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--rp6ctkos6whteo6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2018 at 06:14:20PM +0200, Wolfram Sang wrote:
> The usefulness of this debug output is questionable. It covers only
> direct i2c_transfer calls and no SMBUS calls, neither direct nor
> emulated ones. And the latter one is largely used in the kernel, so a
> lot of stuff is missed. Also, we have a proper tracing mechanism for all
> these kinds of transfers in place for years now. Remove this old one.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I think we can have this clean up already.

Applied to for-next (with updated commit message), thanks!


--rp6ctkos6whteo6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlu3jf4ACgkQFA3kzBSg
KbaG7A/+IhzmCWs1kYes2Jw9B0ugqJbpR+A1XosxCrDQVX5Gpf+xdiab4TDkUbps
rX71fa+vWxIT6o+E0Ijj/bMdR2crOaV90Ij7m8CtvLYsPvo+xNiKbB2bZGiJf99f
PBM1snjcVO3LRBaEXl6lBv3UQ7l2EKHGbHkH3hIY2mqgh86WDjADXrvDzawXP173
VOI8j/ScSHJ/HEizTaHI0ZrmKnz09XO/lLmRGzQdYA+01sMU0BK/IyoiTAeCiECu
MUAz5nrrwuUgHriv9o4BUWVA2uRg8pIPEd0O0E5UnpXSVyIvenQkIKOyzRVFvNoH
nRg9KaTWtBsWjcml7SH8vHRPRza6Ba30zFN/HAqAzgLVdSGmfwvIll4RRCAUTJGx
7TZF6w246PxocBaVdZbqY/+hiqwi/eWDgkjr5fFh1Wv7CUrjog4J+l9eTeslEy2Q
bowoKjN1YGwZB2f1s5JN9vy8gBNqkbEM8GX+Isi7qBIzGDPOpYRfOW57lvM5NOm1
WmL0qD5GgBysjiVkq28n4v4/ulZtRft4M5tdeQ6hR68LPkBjnasFRYgRMNCYnRyk
DBPz2GQH5NQ7Sw8Qxx2+U3oDt3o0XxNcm1LGQqeOOKobQmtXm7nrUmFVvX4HT/Dt
rEE4YVlOSA1/l8b23lPiVAcUVwri68xUDDp6HXeDP/73mpp3eQA=
=IVUT
-----END PGP SIGNATURE-----

--rp6ctkos6whteo6v--
