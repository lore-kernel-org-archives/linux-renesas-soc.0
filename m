Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51394 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753183AbcLNRi1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 12:38:27 -0500
Date: Wed, 14 Dec 2016 17:38:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Message-ID: <20161214173811.iporb5qqulmndvg3@sirena.org.uk>
References: <1481536175-17238-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sgpdmudl7gbvkuhn"
Content-Disposition: inline
In-Reply-To: <1481536175-17238-1-git-send-email-horms+renesas@verge.net.au>
Subject: Re: [PATCH spi/for-next] spi: sh-msiof: Add R-Car Gen 2 and 3
 fallback bindings
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--sgpdmudl7gbvkuhn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 12, 2016 at 10:49:35AM +0100, Simon Horman wrote:

> +	{ .compatible = "renesas,sh-msiof",        .data = &sh_data }, // Deprecated

C++ style comment here, please send a followup fixing this.

--sgpdmudl7gbvkuhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhRg4IACgkQJNaLcl1U
h9BE5Af2IxQr1UZETSwENwVf2BDEj/59k7G5Ym5ITsWdwXmycvgDb+CjeaCxZ2Rk
bB4Fw1ufqCOnpXXX44EDCtVrytc5Wq2RnSTTjmOD9pmmiYPPXGiOs/0KUNNDXRkL
W6ZjfMYabeSKO6+sSatYfWROEYeve//VxRVPCIU7HxfjQ+inxFVXjqau4GMjQv5r
5B2JAUhPwdPgu0cRx9eJjbiRcYMwbUIKG56SPikPEMOiTR6BmROZ07s+ShUHa22l
Mi2RjdErBb40qSswMZpshIZjj4N4MFzHkSx4aRQG3Sya8aLPprkUROAmgIVIAIBk
Chx6WBzYGoPngGr43ULTm0aP42Rf
=E/cR
-----END PGP SIGNATURE-----

--sgpdmudl7gbvkuhn--
