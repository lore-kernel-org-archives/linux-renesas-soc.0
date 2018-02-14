Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:52416 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754332AbeBNIww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 03:52:52 -0500
Date: Wed, 14 Feb 2018 09:52:50 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Message-ID: <20180214085250.54r363tkjmswwgwl@katana>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
 <20180214060547.bf6upib2mbgoexas@katana>
 <CAMuHMdUYDWXF9uSzsYEOeOVysQKRSFhJ+bLbPhwFbMs-qBjbcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yzxdr67xvityphxv"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYDWXF9uSzsYEOeOVysQKRSFhJ+bLbPhwFbMs-qBjbcA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--yzxdr67xvityphxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> The other R-Car Gen2 boards use 115200 bps for U-Boot and Linux, but some
> other value (38400?) for the SPI loader that loads U-Boot.

Yes, mostly correct. I am quite sure I have one board which has non-115200
for U-Boot. I am not at home currently, so I can't check now.

> What about U-Boot commit f40574e2d78c96a3 ("Kconfig: Migrate CONFIG_BAUDRATE"),
> which says all R-Car Gen2 boards use 38400, before and after?

Don't like, too slow. Can we change it upstream with the reasoning that
it is a) faster and b) BSP-compatible?

Regards,

   Wolfram


--yzxdr67xvityphxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqD+NwACgkQFA3kzBSg
KbZoKQ/+I3ebmBHzdTLYS6IcsvgjJIvo5qru8nCqs7DzwBZxO3A4PGe9yiRIiL0z
rX6QRBnI2ZrNemYLeAjLMilZJLLZyR5efUJttxzwRujC0jh3yfy5Iq0WhzrN/MXs
m8Ny8kiJG8ISi/Sp/LqpFvqSEvS6N9UB6RbpNOI7zvxIhXdKIJsy9l7fRyyTkAcG
GGxOtJ3OglwdEbrc468axctFBoU1JnZEXznBRogj/rYbGPfL4dGdM491KHnChoFc
dCdcdJ/Qqlixiif9vEesOP5dgASIkm+PL1mvZ6VWplZTg4P/DIvihX6Hn5CbHe2q
MeqVl7prpyGUES7N9iBFFhO3fZ+yJteksWhLgijBLtLS4nMXA9YaMI+JOHeOJqCr
cXzSuC4uT2xZ/zU7JbxTSOvnPuvsSdnMwLEeOVoIvAirTnj9wDPtSvrnZFs5IyRw
Ch18opV558YXVJrKa/tRA17I5LV6/7iPr3Z9jbEdqVh87A5GilsDTP7CYpIAWH/n
gd2yf8kr+se9SWLIg6MjMtIzoyNkAg9mGbC8pbi/lnZ3cpemoUvQ1DGVPglBSkOo
4t3vBjEczwtLHu0xROsRmk9ABeNO7c74Udc1GHlFfTBnqyYnw0aM+fsNSonClbMm
aqEHUXcBXsN0Rb00fRsRr0Kbp1B1IqXFbeLJKewlZi10alAsMOg=
=aKXs
-----END PGP SIGNATURE-----

--yzxdr67xvityphxv--
