Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727324AbeJTVhr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Oct 2018 17:37:47 -0400
Date: Sat, 20 Oct 2018 15:27:17 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: cleanup DMA for all kinds of failure
Message-ID: <20181020132716.GB1750@kunai>
References: <20181019191526.3712-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20181019191526.3712-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2018 at 09:15:26PM +0200, Wolfram Sang wrote:
> DMA needs to be cleaned up not only on timeout, but on all errors where
> it has been setup before.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Added fixes-tag and applied to for-current, thanks!


--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvLLTQACgkQFA3kzBSg
KbbPGA//ZpOtjFayZbnm81D/0bD7dP0GtFIOeB6wJ6f8DLhajUjbK6/GiY7CP3NK
/lZvKLat3dtMwS6nTHZhnQo91KIiNeh77JulSWx0p0K1MY9A0ZjCIT3yhw2IHwzv
OsbA4+ngmbFdjvpDEvmmjGnzOxY0YHEWeE2fQmh64ISqwhwFClxRiBGFUcP9hG2e
rsSivwh+y2hOTTRsFWSiTENEvCQA5Ipq/apfuLAMFst6pIkBFDhdsmhvgX1QitIn
aieTHyT1FlfFu2qJDvLs1xMkI+bpx5E8/h1zZu4abphPgA4Ddmz9r4MHzgnd2Mzg
7YPIBCU7G0PHECHb3hHW9kzZXPXhhMCTBQavx6qxZ0mKJTZxNznkQJ+Kq/fLPknq
aW+CF4Zg5l5fu1inEIcNH+Zex09jTkvM8C1qYxCxsbwkS/slaL/4BRTIVhJhKDJk
l1T0TqPtUDsgzi67BfpOMn/Ld25WeuQMhuZGpRB2R/cpVD1uTPsV3AGwn+x87OoV
5/S/ZMmEbykInzPYwrQO7q6EPPA0EqsrrRjlV1WFhzqrxE+KItbDHLRkApNDmQ0c
ViAK2kjaouWWiMic6QAdJJjuzmWYB96au22BqMZqt6GTx9S2UuLL8QdsP8QJFhV2
SxzYg1btiy5MMioDp9T8M22dGs+qLhuRDdrMJ4OmG4Lr8ra9BUc=
=YBUw
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
