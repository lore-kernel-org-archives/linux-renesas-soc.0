Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:55543 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933485AbcFMOfZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 10:35:25 -0400
Date: Mon, 13 Jun 2016 16:35:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: r8a7790: lager: use demuxer for
 IIC3/I2C3
Message-ID: <20160613143521.GD1603@katana>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline
In-Reply-To: <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  		i2c9 = "i2cexio1";
>  		i2c10 = "i2chdmi";
>  		i2c11 = "gpioi2c";
> +		i2c12 = "i2cpwr";

To make it easier for users, we should maybe group them?

i2c8+9: additional gpio busses
i2c10-13: i2cexioX

?

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXsSpAAoJEBQN5MwUoCm2QBoP/jxeQcCyuaK5hoAA8AQojqUI
3SUUIu02nOqA1JaMZ5QNgAsW1tbdkUqaJdIBZ+EtGFY9EHq4rsqszcPfgku/rspV
s8l/6QY4KyKGTiTr5PPzJImfu04EmVh4lrnDgZxMtO+qDh//afXVl2ulLY6mj/sO
Aeap1vu4tmCUcrQjgs7c/0W8xrhu73ytxrUbpx7Khmbp3Zu7D5MFEROwxYhEURcy
9YlAJvQJVhQgVzYRhB+eTQlihunAJo77DgjzscnnTUoi+ZYqX5/iMx+v+HUSA8m8
8Wc3mnMahXxX9N4JzyjuTy5fdcIEvfKlU+rITnkaLGTojBvXISbU+OlVdjKYGJG4
1oVjbGn+Ger3hAPh576EnJM8REkYTIGFSZMhJnk0iR0hvrl7pzFWJb6SXfHjVyBR
skhvc407XtdnjuWBhqGGg5kKmvrfVP/vrKuE63Wh+XwcHC9SoHwEtoSxUPYLpQ1b
KetYIwiwRhw+HgEFC4EfQXECZ2VRJrXhGCkM9apL8k2HzZ4krpBMaPJxs0UefgpA
yixpiasYRswjg6Izs/Yn/RvRd9fN3E4GgrezMsNkhstzroQBlVwcvC1c/VgzIMn0
xVFRx1I/LmEjb0hzSNGoFdMGapzcDhXIx5VhN1G5WeaNcKcKsmC4pt6emmckDfLs
1slVcYDMhq5b37d5Zkrl
=1DTH
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
