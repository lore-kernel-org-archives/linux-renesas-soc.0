Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58160 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbeK0WwG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 17:52:06 -0500
Date: Tue, 27 Nov 2018 12:54:25 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: rcar: check bus state before reinitializing
Message-ID: <20181127115425.GF1107@kunai>
References: <20181113111542.5224-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline
In-Reply-To: <20181113111542.5224-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2018 at 12:15:42PM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> We should check the bus state before reinitializing the IP core.
> Otherwise, the internal bus busy state which also tracks multi-master
> activity is lost.
>=20
> Credits go to the Renesas BSP team for suggesting this change.
>=20
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: ae481cc13965 ("i2c: rcar: fix resume by always initializing regist=
ers before transfer")
>=20

Applied to for-current, thanks!


--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv9MHAACgkQFA3kzBSg
KbYnFg/9EgnH91Qj4v7zfIYKNQS12xjI+N1+Tj1XvCSpdt3lTaeQm2VNKLiqy1hu
kqJxfZ8L7tA59yi/bxJGvSo8DpMs36XKdpsXktuTXhJV9IUQbgWPpUWzkWSF2oab
1WkIORYD5ECuCSjB3VsmmVm0DHMlTLGQnPkR06lPgRKpRS6k0N0PwUO0U83RTpk8
zSuq2f5W2Uftx4F8PH2+5P8fpDbQE30uWNoHIbn+fJZMa2jTrHdVXuBjZazFcaNu
off0mZpbO5J9gH9yQugE11DQGmzFdJ36ZpoqArbkAmyO4cg21EQRY7XZNcCjchds
WIF/xT+tr1CJybMG4Wy9RKunPNcWtr5YgVKqF3SuxsVAPB7+d5dD31Immu3/slyZ
0Y5utEvUQJpuj4efD1oKNhjAqFR4qQ0Q1Qjcl3enxcT4IeWYWLmGjy4Dxc34drkh
BAKwgw4ZxzVdunxoed7WvkeSu1Y6VkFOoCTZ4ywKh+MMo2dLyrbuwrIovTAVFiki
1cVoGDabwVALY6L34s4ajGlIgjWRMZouOzWJHQPJx3UAWbpP4GV/o+mo8gJn8Uv6
HpXK7PycbQemzKlBPcTzhh8lq89aISqxLQIwfyph9lv7Ky+zCfnPN5VxK/581aLE
/3y+Aumt3ko14b56/oZg2Ccvy6+HG1zWb/dEe0wGQiZVTRRu7W0=
=bVmA
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
