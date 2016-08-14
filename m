Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:40101 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752018AbcHNWVf (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 14 Aug 2016 18:21:35 -0400
Date: Mon, 15 Aug 2016 00:21:31 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: properly roll back when adding
 adapter fails
Message-ID: <20160814222131.GD10501@katana>
References: <1471020023-2263-1-git-send-email-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline
In-Reply-To: <1471020023-2263-1-git-send-email-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 06:40:23PM +0200, Wolfram Sang wrote:
> We also need to revert the dynamic OF change, so we get a consistent
> state again. Otherwise, we might have two devices enabled e.g. after
> pinctrl setup fails.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXsO7rAAoJEBQN5MwUoCm21WYP/jPOVX6hp48xDxYJVPLmuTfM
ve015GmEPYFJmaik0WI3JzbRprr1I39l1364M2seEFtGs7zebS4o8hYgdg6dzACQ
Wn+JKIgixRPyPhkSA3OQY1JHjOzWPLYQqxXKZj56vWvTq9bCH0qzD5jj4tXL54uq
MtZj+xGuKkApmz7FFl83n3MV/JkNcbiNxbSksdyuvNdkc++zd2fSEm140N3fJ7FB
lWNv871v77nOMl/mAIUtc+R9CJW0kalxT60y1cYKoJik5SlDQWCNIZd0oLVJ4hO5
xqInC4QDp+aWRTcxqoVaUxoKG3ymkI1C/xMYSjuMzujZUVW0MsYCsdW/m2uOc9ep
JpMTdfNGAgv7V2/tgaLry2BXJy3EfRE6Zbqx23Y5YjsInKYzoiawoT7YEMygLAkE
NHLdkHBVfnWjh3i4Z+U5P5hRqVCG/ggmExpuZsofsOCoFsoT/U7HBfDR8nejxEki
A4Nq8EDQ4mdPPjktmMBMuQTZPMIZIeLiUtgytTB0Bc6L1LPvY1gR7feI629iYexr
fqXWtTT6bXxwoV4ZJlVsazff2K1p7g30InyqkJ0bFi1QRBZZHqB3tYP8fnvhDVZZ
6JtmIDA6KT1EOAzSw0vT+0lBdTTLMAPFtYivyYYJF0gVS3radUbCP6rbK0uXKMGZ
q0I3C1araAl81Aa+jY7K
=Xuc0
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
