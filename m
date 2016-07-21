Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43401 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750995AbcGUG2z (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 02:28:55 -0400
Date: Thu, 21 Jul 2016 08:28:50 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7794: Correct SDHI register size
Message-ID: <20160721062849.GD1664@katana>
References: <1469058248-27880-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline
In-Reply-To: <1469058248-27880-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 08:44:08AM +0900, Simon Horman wrote:
> r8a7794 SDHI ch0 has SD_DMACR which is located in 0x324.
> This patch updates register size
>=20
> Based on work for the r8a7790 by Kuninori Morimoto.
>=20
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkGuhAAoJEBQN5MwUoCm2PgoP/0tmLxws//tw+btUSpSJOKQd
VqqHKwHGqQwclG+KGZXUraPwnxheKRv23lj5fyEDhu5ulnZ8qAbzGGtRyvbVOJO8
ee8ufh28mWRRMWYlmWedA923f1pXG6uxdz2kg7snXO1PbCsc6kJAZTKwsDkPLRKE
xZKo5Z8Vf6btgziV7f6Dn8E9hF61S3QcWR+1VF1yRoZmpMUYxjDVgJyNAtaJPX+J
8vFer9ZCC2Tms5M2ubwkvU9wC42LpS4ee0H0ld1eU8/wmkELTWPYW2iFsCLKrxku
0q0E0OX7AnpDcCHLliFvxVk/X8IC16XvPkUFBGob4mhGpjulC/ipupMpgWYJ2tgW
ecoRZZPt22yotdaJGZOEOUYlp3bjkMmrID45HMaf/miZPS/V4eER3Qf8jKTYH0xv
bmtWw8mlpEvcyRMmgR4ZmwjajEO0orb3gOKJaiOL14vFSfVXz3yAwT5nIpnLS1nc
djcOcSvN+rzqihaHv+ztcW6sxNODlPGJgs9bExFggYX7VgQU1iXodsC5JFYFiC7I
tgqHoLE3RzczpsZMtqXOvUqSib7Ghr890NgRJg0xn2U2y//71nqqVSm7GMbp5XuO
+1ZBD70hXdYcFxUsEl5cL0C1mdWoTD7BSgnyRX00kIkQ4a68qGnhuc4KdKplmbSh
TC/hTN+agZ9xr7oNWCD4
=xF/0
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
