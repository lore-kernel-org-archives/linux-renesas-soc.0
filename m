Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56100 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729128AbeJaWMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 18:12:16 -0400
Date: Wed, 31 Oct 2018 13:14:09 +0000
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mmc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
Message-ID: <20181031131409.GB1487@kunai>
References: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
 <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
 <20181028213444.GA1096@kunai>
 <f63a5c27-ea7d-e1f0-9bbb-211f56be8ad9@gmail.com>
 <20181029085721.GC4101@kunai>
 <20181031124628.buaiuof5ssllalwo@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20181031124628.buaiuof5ssllalwo@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> But can we discuss this in the context of describing the hardware?

The SDHI node needs two kinds of pinmux settings, one for normal speeds
and one for highspeeds. They might differ in supplied voltage, i.e. 3v3
and 1v8. This eMMC always works with 1v8, so both settings needed by the
SDHI node are the same currently. That might change if we add new
features to pinmux nodes like TDSEL/capacity support. My guess is that
this is not so likely to happen so I suggested using just one node.

But it has a taste of bike-shedding to it :)


--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvZqp0ACgkQFA3kzBSg
KbY+lA/+O6Omp5HaaPtncax7D3a6f2DtjoWsB8YgNL5YKbLG7OuE/PrOezR8wb4E
ucx5KfAIRwCxavJoEtl/8BDEZmvsRAm9+YIjfFuMt7n4rJYSBGSA/INuIP8aXTjF
RxOMV5sAfkYjHtyMO7Lf7F22Wtm7tNfwDrIqsuK38A/Eia/ZJsqpiqDrvHtNNCbb
aY1usn6gNHQQGdgdj8faNS2vXGfwPUQclXbTef3SkTSa/mBxhaqawTAorReGt8rY
ufqrXXeUfAwnCvey4Wdyq6qOVlF+EgUlNeFOuH/aYOk7b2hDDRPoDBkZH9dx63iA
3ksRKXTOzaLkqLMOd1+zwQZo1O3bZooFR+reZYWKHld+ruiv86DRSfML4nGsN1wI
6nSBYg9XLQj8Cu9AFw7TJW4bAD9/TYtPzKD97gZCeIj5ggP3elYaxR7h3GcyicZJ
yIAG88/Rj+5r8LJpBAhVCp6s2A/knNOi1W5KDG3OW3ZM17q//YCxPky/l18GttEy
WWEmNs68qhsIiAWC98jEVe9AJ2MzNYyREWOjImFTAxDFUPpYIKDfKufrKToOrreW
JxvgJmlQQy/I1AwtF0vG48JvguOtvVE+eEUwFGFU92sEooGqaryZxUaBK/Z44fYD
U0t1oAyMuivw0sOUZDiR8FSvE9k5BL28x2sru/SmdMHPoSX2Zy8=
=mZA8
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
