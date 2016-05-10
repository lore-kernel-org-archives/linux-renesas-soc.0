Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:36360 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbcEJIyc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 04:54:32 -0400
Subject: Re: [PATCH v2] fbdev: sh_mipi_dsi: remove driver
To: Simon Horman <horms+renesas@verge.net.au>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
References: <1459734484-6815-1-git-send-email-horms+renesas@verge.net.au>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	<linux-fbdev@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5731A1BA.1000602@ti.com>
Date: Tue, 10 May 2016 11:54:18 +0300
MIME-Version: 1.0
In-Reply-To: <1459734484-6815-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="E9xUGg6RbpO11JOL16fMVMHJ1vVOCViPo"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--E9xUGg6RbpO11JOL16fMVMHJ1vVOCViPo
Content-Type: multipart/mixed; boundary="wAHaJWP428DCXehJsBDxVD8uCiQ64KWh5"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Simon Horman <horms+renesas@verge.net.au>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <5731A1BA.1000602@ti.com>
Subject: Re: [PATCH v2] fbdev: sh_mipi_dsi: remove driver
References: <1459734484-6815-1-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1459734484-6815-1-git-send-email-horms+renesas@verge.net.au>

--wAHaJWP428DCXehJsBDxVD8uCiQ64KWh5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 04/04/16 04:48, Simon Horman wrote:
> Remove the sh_mipi_dsi driver as it appears to be unused since
> c0bb9b302769 ("ARCH: ARM: shmobile: Remove ag5evm board support").
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v4.6-rc1
>=20
> v2
> * Update patch referred to in changelog
> ---
>  drivers/video/Kconfig             |   4 -
>  drivers/video/fbdev/Kconfig       |   1 -
>  drivers/video/fbdev/Makefile      |   1 -
>  drivers/video/fbdev/sh_mipi_dsi.c | 587 ------------------------------=
--------
>  include/video/sh_mipi_dsi.h       |  59 ----
>  5 files changed, 652 deletions(-)
>  delete mode 100644 drivers/video/fbdev/sh_mipi_dsi.c
>  delete mode 100644 include/video/sh_mipi_dsi.h

Thanks, queued for 4.7.

 Tomi


--wAHaJWP428DCXehJsBDxVD8uCiQ64KWh5--

--E9xUGg6RbpO11JOL16fMVMHJ1vVOCViPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXMaG6AAoJEPo9qoy8lh71/rAP/jlDfy+Hb91Ef/okyJo5eDMT
y7/4g6Q2NLJCHximhLNT9SO0F6uVJGeVhVQnpcqbOLXrlbWvBUqJ1rcmzbRmmIcO
QdzNSeh4Hxp7Pww6u4ImjbJgk+Oj3lgipp8pRetO4tAmFEHQ2lbKQefuC0ExUq6X
+FdQahPG+lvkDpw3D+z/M8RHEwc14ewCquY3ZCksUxD6w7kr4lqxW+U2/KBShwlK
tX7oNog5+40gNtmPyQNL1Gt5Wjpxu7D3WcSRxPfDcnWNsli+iF625rkxPbc/3R0H
8OWfm5sbz5aS2IY4MA6BlB9XA/TFAqW1zDGRaaVtrm7f/HKv250X7nn6qvrkILMd
tzDeS12uH3sUMeOzbEjP/nSXT2iMjyG4L3VI1CSWkAah/vpHjTugfh+bS7Et7UeF
zxPHIDRXi3km1La3vRepyTAW0tVjr70sVDIPzH4TrP9jmOOc5w03CWJ/62Btow4f
fnp5SmCdvgBlhW46MnK4vRiWmh45GbBqOzalKJZ34NsLXytTwm+EcndoAINuDkpp
TqPjjvM6v4Tam7LXNTrFKOmtMFXxUanHp6zcWxlLAfYkQO2dm7zBw10wD9Vd6Vsq
7qp698ASBuBfAuYmLd1/wsLfBmkzRi0inlKlXXwnF0Ts+OBqDR4sai4WVfbz3bfL
ITTvrBNl6Nmlsgl8sfze
=iUC8
-----END PGP SIGNATURE-----

--E9xUGg6RbpO11JOL16fMVMHJ1vVOCViPo--
