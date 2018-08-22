Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53378 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbeHVXDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 19:03:14 -0400
Date: Wed, 22 Aug 2018 21:37:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
Message-ID: <20180822193700.nzwxfhmgloslfkzx@katana>
References: <624fec83-0190-18b4-1d80-b59b1bc964b2@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mu4w3x3gs32leqfe"
Content-Disposition: inline
In-Reply-To: <624fec83-0190-18b4-1d80-b59b1bc964b2@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mu4w3x3gs32leqfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2018 at 09:22:26PM +0300, Sergei Shtylyov wrote:
> I have encountered an interrupt storm during the eMMC chip probing (and
> the chip finally didn't get detected).  It turned out that U-Boot left
> the SDHI DMA interrupts enabled while the Linux driver didn't use those.
> Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
> rid of both issues...
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--mu4w3x3gs32leqfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt9u1wACgkQFA3kzBSg
KbYkhw//cOefF/rQGNn+JrpXVmZMo01wvYlbuZ6wP1fwZvsfWLSu/RB16Qe/OmN9
R+W5F3p87+SF1jI+AY5IT8CrXiLYn3v0mzFAbj25yr4121OQ1d6rh+ND7C5Wr43t
JAsYsjdF1bAk/dt6tXkU3ql0tcrlcUoYS/iT9WGD9Zuv9y5VUNpY+b3Yl0oSiwoK
9ZH0Q6Fi0wuqLukCyBe0G06YchYit23SoTUgnkkCtmt86XW/NGZLk81smCvaLoz9
bHqsEBAedTimuH1f9L3NkCEQJ7DF2+8f2uwNfk3TLBFcBSrDTUoblDy69yt2zIu+
eSHjnAiXlOYKilU0EOzYNcg/3JVKAdbdXap04pUQlwnnYrKIAJSJjUG0f1jUFAnu
fFngeD60RUiU2EmWS5hM0QF4M9bDHeIdQwOgBlZb5uw+/V0dxu0uhuTNt7vXJVud
Yk8wdmLgnQ7qrUXFLo4TJJ8MHZxXVszrjGlGs9nZPHiRn9nBWOOdSPbTWd29Aljn
D/83/IKMlsBB4MGy+mA++FbdBSdPRVy3+lg0h5o4bEbfrnAei3G8IELxpJ2wDsJV
syzFZRXXr8MwEN+oxPnaQR+YRq6mO0nFo0NL0vE4a0BaKei8mdg2X1p41vezpG9c
Uhb8VZ2Q40hRDqOGuzy3YXaoCVxxvCDODHLuQhDPwAKz55P01ho=
=0OrF
-----END PGP SIGNATURE-----

--mu4w3x3gs32leqfe--
