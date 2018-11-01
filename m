Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38500 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725722AbeKBEIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:08:41 -0400
Date: Thu, 1 Nov 2018 20:04:25 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 0/3] mmc: tmio: fix reset operation
Message-ID: <20181101190425.GG2433@kunai>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline
In-Reply-To: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


So, we agreed on this series during our Renesas SDHI hackathon.
Comments / testing from Yamada-san would be very welcome because we
really don't want to cause regressions on his hardware.


--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbTjkACgkQFA3kzBSg
KbY7MxAAsGrZ/Xcnlr8RI4eqwxNIs3qPq6T3nHKuhS0eUPVWHjLnJC/1bUrOPoFO
IIJoNeW65mhQ16u0UpCOx5arrva+uqEIIqIGTiJKKOs9+JkPPmGpESgbL7gQk1C4
lbaC1ucnVlwYVSBugUAA/TPYr5WuJzXK6U/ODFutZu6ChoIBjJb+zaPPCuN9ZHoF
kRV1Fv/YreTjcTXr8qolMrELKDYh6AvRyVd9FNvYI7GNN37+WpHS6V8JeJnhQf0R
/Dc7qAU6cEKwI0vVIosytXVzv5ZoUXFYC3w+By8fHX+bpwkEW8mIxyTPcs44FO3j
geBObZUISYT4xYOOqclUc2fH7XY0gDpGu9puc9lbkVGsrILdXLDYb0yWxjR416Tv
uEXbLt23F/fDG2xmVeO6LqyfAM6z5cGXQ/DyVCuzd/3+hSswDBSqfaM28H1tNqUu
BbfUY53IRtRzU+YM9dd5XTTep7mpYyM+xM7wxi6uPckXe0HWKEMOBPBsSGjmpJGH
EBPOewVArnir97QH9xwRJ7a6aXh43q+36HLzWCIPTDvOCH0d/IQfuLPf4PP9QW2L
ZJI2l2kKdpycwD1qeL2IEUkWCQPL0EzjenZXsRrAF6sTZ9PE2PWBXsGBqnww7zsH
BF9Qu/KYayL97liM2W9+WPJK6K0fW50xp3uXoyN9oGKXoPjuYbI=
=FIJk
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
