Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49376 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbeKFUjc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:39:32 -0500
Date: Tue, 6 Nov 2018 12:14:48 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and
 functions
Message-ID: <20181106111448.5rc3yzfdzuv7w562@ninjato>
References: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uev3gkwsqq72ocoh"
Content-Disposition: inline
In-Reply-To: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uev3gkwsqq72ocoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  static const struct {
> -	struct sh_pfc_pin_group common[123];
> +	struct sh_pfc_pin_group common[140];
>  	struct sh_pfc_pin_group automotive[0];
>  } pinmux_groups = {

...

>  static const struct {
> -	struct sh_pfc_function common[29];
> +	struct sh_pfc_function common[32];
>  	struct sh_pfc_function automotive[0];
>  } pinmux_functions = {


It is Geert's call, but maybe those are a seperate patch?


--uev3gkwsqq72ocoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvhd6gACgkQFA3kzBSg
KbZtYQ//Z+vIm+a28ufoqlgcJ643qYLFR5hjnF5njH5opNeB+JFFFRt6yA9gWaWr
FPKzQPqml6z6ghWc/kEtl+PjKSvs1zI98Kyf1fb/mU/cKr9M5YRwomuJZoNTgBoI
zP2ZQ4mPitG9P76Q+y53RTlhnrTDNeCfEf50XcR29leZ6tLQh0yY/VQdUquIG8zt
T5UKWRpjRJ99jroxYNsVp8B0h+FWLrOr0B9lgdYMEnGfp5Qsur8jc8wMc3IJrANW
SwlW5QnyU76+z2rGA/uV6qwRHHdF8ZiyGjdETpShgp9EPzACbxzY03uUjW9SZMy3
ipXCa7Yu4NBJhcfeYEBv85DSUa/Ds3Xrkh8QPVMPIyNbSpR/Hpv8P7rMWWfSISJD
rAiIAZwM9cnYYW2Z0oTpplcRRQPUiDvt0IREI1KUJcMtrVVUI6FCqeMjfkhRcWVC
AgmFibAeK46DUeYS79Q3it4pxaKXiggYiOyiCg+3PoBg/Z8SPAT18zETkK1krwQX
xKDzegPBjYT5erMK7yDTwdgO64mUf75kE/MDZfPeQG8KqNfkEWAQQ0ILGva5ctPt
n0x91Fu39IFEFOlrDovA1xINdw/eKINbiSClWPcxeWvUa5TRr9CYilq769LWQHLb
P1EuxpyKKZlcDp5og3jWoNNjP5D/8vD69xQjackJvvipH11FdjI=
=KmuB
-----END PGP SIGNATURE-----

--uev3gkwsqq72ocoh--
