Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54128 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754380AbcKDPus (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 11:50:48 -0400
Date: Fri, 4 Nov 2016 09:49:30 -0600
From: Mark Brown <broonie@kernel.org>
To: Cao Minh Hiep <cm-hiep@jinso.co.jp>
Cc: geert+renesas@glider.be, linux-spi@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp
Message-ID: <20161104154930.6fepg25wma2l2gz2@sirena.org.uk>
References: <1478248734-32044-1-git-send-email-cm-hiep@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ejjqwutpjpvbq2in"
Content-Disposition: inline
In-Reply-To: <1478248734-32044-1-git-send-email-cm-hiep@jinso.co.jp>
Subject: Re: [PATCH 0/1] ARM: spi supports 32bytes buffer for DUAL and QUAD
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ejjqwutpjpvbq2in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2016 at 05:38:53PM +0900, Cao Minh Hiep wrote:
> From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
>=20
> Hi,
>=20
> This patch will improve the DUAL and QUAD's performance of SPI,
> that supported for GEN2 r8a7790 SOC in PIO mode.=20
> It sends/receives each 32bytes of data instead of each byte data=20
> as current situation.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--ejjqwutpjpvbq2in
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYHK4GAAoJECTWi3JdVIfQjy4H/idxpMwb3CKN0976NMcAiCRF
G7xWmCTPQIhBYe9JN1GyL59jIKM/at5hyM6AcnLUdY+xbOEXd8QLa9wkJCRUEKt+
GfNLwRcHL0Rz3UDxQ1SYdZZE2r1w+ELHDG8CG33AJi8te5F0px1YzcxpLjeZWSKv
a+W9dnKc/xn74WSKP8tCbkSLMMGd8UCatNTH11OgkN5N3Tshx+RTU9Tp+Ki7v/9x
3+LucSRtr5cL01vNMopI6r/cDpBAgwGgqMTlpgggAk7lYlrpJWlKqS64pSqtV4/y
rE4olzapfHWcAUy8vH+Q9k/+Sk7KoZiGxDFbZkMo2Q81crLl0KPr+qtYOhCqCrw=
=EDrK
-----END PGP SIGNATURE-----

--ejjqwutpjpvbq2in--
