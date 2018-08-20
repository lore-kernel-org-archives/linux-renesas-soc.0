Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33602 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbeHTWZF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 18:25:05 -0400
Date: Mon, 20 Aug 2018 21:08:13 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/7] mmc: tmio: move tmio_mmc_set_clock() to platform
 hook
Message-ID: <20180820190813.k7zuzbk6lj4pf6wy@ninjato>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
 <1534403799-10594-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wprce762saswbe3q"
Content-Disposition: inline
In-Reply-To: <1534403799-10594-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wprce762saswbe3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 04:16:34PM +0900, Masahiro Yamada wrote:
> tmio_mmc_set_clock() is full of quirks because different SoC vendors
> extended this in different ways.
>=20
> The original IP defines the divisor range 1/2 ... 1/512.
>=20
>  bit 7 is set:    1/512
>  bit 6 is set:    1/256
>    ...
>  bit 0 is set:    1/4
>  all bits clear:  1/2
>=20
> It is platform-dependent how to achieve the 1/1 clock.
>=20
> I guess the TMIO-MFD variant uses the clock selector outside of this IP,
> as far as I see tmio_core_mmc_clk_div() in drivers/mfd/tmio_core.c
>=20
> I guess bit[7:0]=3D0xff is Renesas-specific extension.
>=20
> Socionext (and Panasonic) uses bit 10 (CLKSEL) for 1/1.  Also, newer
> versions of UniPhier SoC variants use bit 16 for 1/1024.
>=20
> host->clk_update() is only used by the Renesas variants, whereas
> host->set_clk_div() is only used by the TMIO-MFD variants.
>=20
> To cope with this mess, promote tmio_mmc_set_clock() to a new
> platform hook ->set_clock(), and melt the old two hooks into it.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I like this refactoring, much clearer this way. Thanks.


--wprce762saswbe3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt7EZ0ACgkQFA3kzBSg
KbYnOw/+LVZBywjH4lOAhm81nicFGhNyBMfHu2GNev5HoPAUZK4m0zX8AeACbgqJ
raI+0u4Cc4u+crCIloede693NKrWsIOndci+zuzhoqbhKwzgLdvBeLZSgrgT8sun
TFMHAQN2KYB4XTiSAx/Me2sMilZN2W0jEt0UEJiOBzRBBniyAn5ZjdRU6LE9siUA
liL+oUeZNG47diA9qGmdQ6ZZfkyPRMt26/Gq0dvbi/zGlFSre7lEn0Itb5XuxhMf
paMyAWEvaXlmpkq1iSXavi3LOzT4688GstDTo75yGAeXcJVGk3ggnNFT36PBq9Y2
Sh/pT9xKY3HggHcfJpA0T83xXnk4LurQLulhhwc5mbML3JNXZSggJJERCql2BOYC
VVyd4DbLD5LdtR1ZBm4x5U1avY3IEvLcxAMFsmj9WhV66tJAPYEmOvmUxvhSVi83
UIVcWNR43Llg+18CVgP1LKvTPndROZeUKCsUXXk6pNIcRKjp6Z3mDe9MxTaSmV/Z
NS/2S9fK3+JuKra29F+8pvX+nHR5xvf3qP8hmH0hL4NTFYQe1zMewqm4so1X0o+o
7+P1NFes/kIErgTShYe9hMHgvIiUwVBtjaKhE/hrO3rp4ofPrWa6E73TpxNdiV0u
PK1J6l4Fk0LVFCYnXtYUmJ8Q2NpICoyFJauk7K2m8UxTcf/JSw8=
=dhfY
-----END PGP SIGNATURE-----

--wprce762saswbe3q--
