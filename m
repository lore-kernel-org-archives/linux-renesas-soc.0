Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49336 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbeKFUel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:34:41 -0500
Date: Tue, 6 Nov 2018 12:09:58 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mmc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Whitelist R8A77990 SDHI
Message-ID: <20181106110958.uytixjg4iemuchr7@ninjato>
References: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p4zewdn2vwxyf5fj"
Content-Disposition: inline
In-Reply-To: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--p4zewdn2vwxyf5fj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 10:39:35PM +0100, Marek Vasut wrote:
> Whitelist R8A77990 E3 SoC in the SDHI driver. The SDHI core
> present in the SoC is an 8tap variant of the Gen3 SDHI core.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--p4zewdn2vwxyf5fj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvhdoYACgkQFA3kzBSg
KbZxnw//exVkNveYdQfke0GvWRfJ8CXa4DEQwbB4SwiQUC7bEpULu3YRIFvNEM+J
uCgYcTXFsf11mTCWf1gvQQ6n1oqAS7Em/TbbfXvgeZ6TNT9KRJMgKdRY3ODia7R5
zizLavwvmugQcR03znFesR1WB2bqzZXHQ4XrWQQT9rsVLpgIBZHxm+WbYQY0RAi2
PlYrhUclJ5Vk/w++H7WWXlZ5P+fTG2aaTGBgPYs8XrvJDyDounDnsKGVd8DtWX3o
G5i8KyOe3z3j5S+mbYMO1JfXZjJXCGQNsDmekY7tPA3lY2Ss4mKBRPjWGvxPDgF0
PTWMzA+MZdzYtrGVQtSRmxBV3H91gD7o6ZxMU8Ja0lVqu500rjDMs2aGa+t2z7z4
6qrRWUHgqyE6GPQGGyNT3L9YJJR0YwRT9px6Gx3lLbJMJLmm1j1K+6FOP7Le6+Y6
ueIf6GVbwcJxNTya5twhxkKnyMmzMnOjm2yMtBADpWleqZvMy8t8fn7YxLte06Xs
gOpExdTp7Wms+60vrARXx6RDu85ICby8mvn3JKAGj1Z1D5ckIJSXujxLrQyZTVSr
gYpZy9VRicYz44ewvZYpv43sLeerHeYdRVT5PBRjTRUrJXsb3o/xvrDt33Zqb1h6
fhd6pSUe+d76VB6Yc1nWe9/ZEGLUHvyNBkM5Uv2uKZW2hR+3KJ8=
=atTe
-----END PGP SIGNATURE-----

--p4zewdn2vwxyf5fj--
