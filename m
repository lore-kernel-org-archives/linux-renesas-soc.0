Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:32864 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750978AbeEBIOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 04:14:17 -0400
Date: Wed, 2 May 2018 10:14:15 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 2/3] mmc: renesas_sdhi: Add r8a77965 support
Message-ID: <20180502081415.amyes57huzb5ozlq@ninjato>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-3-git-send-email-ykaneko0929@gmail.com>
 <20180501152915.66re3hotavdy2bi6@verge.net.au>
 <20180502053218.2idc2kfzfksuz74b@tetsubishi>
 <20180502063506.3s4vizhm5aquklrh@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mvcx6mqph6x35jmw"
Content-Disposition: inline
In-Reply-To: <20180502063506.3s4vizhm5aquklrh@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mvcx6mqph6x35jmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> With the current state of the driver this patch should be fine,
> modulo the changes suggested above. But once HS400 support is merged
> some logic will be required to disable that feature for the r8a77965
> until HS400 support for that SoC is explicitly added.
>=20
> Or conversely, perhaps when HS400 is added it should only be enabled
> in the driver for SoCs that are known to work: r8a7796 and r8a7795. In the
> case of the latter perhaps only ES2.0.
>=20
> Wolfram, what do you think?

M3-N (and future SoCs as it seems) has 8 taps while the others have 4.
Maybe we should have something already in place to distinguish 8 taps
and 4 taps and leave the 8 taps part for "to be added later"?


--mvcx6mqph6x35jmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrpc1MACgkQFA3kzBSg
KbZWXBAArbekDoGDKMQYHXHukZ0AZhjauBGjXQHGc+yJhdwId3bc44VnJWKFARn+
Iv1JBDj14T8Dx65OZfE159/94xa5z6mDL5QXAouHxE5eGi39YwUN+gWkWZdxa+p/
b79O1+pO55ftEKXk2dsvv42n/yDhsvSFoD4U4l5G6SkRtKg/kYyQU+9ykNRARYTx
1v7Db3h5TIPntf/C7MpcFVuoOmUUvFekTr8Y3oTS/e8puWtNnrQXGfLnQpVXxA/6
+nfbjFZJ5vg+ovRXoVXIO8n2r/7t0ZAWchplbnKjMNfcTMdz/h7Mb7opK9nOkPET
deiW1DXAx2zhp4yAeFdoH4Mob+HwmWDT5+Okxxt5ioteV7ENPD4FAar+f0xesiVT
JmNlPw+iqN65r2DuMtBvZiPy6EtUILjjnuwGw0ETVTSPg58tsRHBEFisIu1GLv02
6HZSaA18BWa5XtIx7vjBOK5xMCGfF+ka9hL13iOoDhh/yPiNQrA0g7rtdLTBSRsJ
n5F6T+0VFpP4DiE0zoJUGBfXkaezkLBdRi/t1ufPiZZ53YuqbNbG0Ijml8L9cuuN
rnNwW1w+gTaR1OAzgZH/V4aF/0mFaH0ODC/3OgbwAKrU7kVG/62F1Hr2mr29EX60
wxRck2eQFmjlgrVW15C9+ynWgKifa1kKEGRAw8xeMZMUk5lUrtw=
=v9Xr
-----END PGP SIGNATURE-----

--mvcx6mqph6x35jmw--
