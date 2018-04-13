Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49218 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751775AbeDMR21 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 13:28:27 -0400
Date: Fri, 13 Apr 2018 19:28:25 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-spi@vger.kernel.org, magnus.damm@gmail.com,
        Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH] spi: sh-msiof: Add spi_master_suspend/spi_master_resume
Message-ID: <20180413172825.3y6ah3tyx4vw4sf5@ninjato>
References: <1523638908-21924-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24ckc5cjsdsdofv5"
Content-Disposition: inline
In-Reply-To: <1523638908-21924-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--24ckc5cjsdsdofv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct sh_msiof_spi_priv *p = platform_get_drvdata(pdev);

struct sh_msiof_spi_priv *p = dev_get_drvdata(dev);


--24ckc5cjsdsdofv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrQ6LkACgkQFA3kzBSg
KbaAwBAAifn/x58WHJvUQQzW0gDeRwhcUx/UiTbHCT8NmgspjtwyY/7L5foj/nUN
5Zz5BBRZMPpB9ZMZgmuPC4gxsEj+rTSi5pyfbkqoMQ2C5AgBsQEcs27o77PDIh+Z
gOMQ2f6gDBOx2oGFfMCcoi86MHgbWzbqCnNPZoAgIkAW3PHaALQ/Lijb+iw/KrcP
rJwvi01sRWF6EaVMkN2uwMkCZJ+J7f+D2WjFBLMJDCey5hphx3VC60r/klB5BY5v
bh5k0rTGrI+NsGFeU97y2LKveQuF/d6wGqBNAs3xRYl8a9MG9V6t1wR15W8dmfZ8
970AK2Qq6CAUpOR7XZI1o4uhBo6UhsEztjrC8mC/+lLaOheLyDs6Yb86iJyDsT8P
UYTy058+wzBTlhDzpSICXfJDDf6htMa5bPZ5QyUuHdwvhLYxdH10vjwL4l0Oo0Dz
83ixgTdJ90t2iQxk+HXAbAQNkJ8i4dNbxwlTOq1y6dM2dK58DSMsSpqX8cZUtT+R
Yze4tFe8Odjd2zTyy8Otz+fbIoGDcYm+hzjaLRD+KL2Er2v3SIUMmIT5OHyHlKRH
mB+lBHlYnHhYA/iKXjUECo/mqBlqFFGh6l1o/mzvsyyYiDpHZzLqvkbNcRAkbWRN
44LjCjT42lW51uBvpbUZ1uD0poUunQK5UJal12+E3iQR03Rkct0=
=J3LN
-----END PGP SIGNATURE-----

--24ckc5cjsdsdofv5--
