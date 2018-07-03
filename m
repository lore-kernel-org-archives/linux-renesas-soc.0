Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52868 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753104AbeGCVK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 17:10:28 -0400
Date: Tue, 3 Jul 2018 23:10:25 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: gpio: fault-injector: refactor incomplete
 transfer
Message-ID: <20180703211025.pqliqly7z43scl7i@ninjato>
References: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
 <20180629091247.32568-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="53ak45ahsznario5"
Content-Disposition: inline
In-Reply-To: <20180629091247.32568-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--53ak45ahsznario5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2018 at 11:12:46AM +0200, Wolfram Sang wrote:
> Make the incomplete_transfer routine reusable, so we can add other test
> cases with different patterns later. Prepare the docs for that, too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--53ak45ahsznario5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls75kEACgkQFA3kzBSg
Kba5oQ//fIZmaP+MVo7ALA5agUUrXyZErUX5BgLy5S1OXbZipyCjv4G2atMOfLsE
VsbaraJRGwUNjZG+NHBYWKwpxY1WiaPOhBIJogsFE3ghU/UgGve6AMDwUe3VmiFF
yg7t+F3lGAN+zInHepslA41Wrkuii8iuTNGqEpmjFpbLudYcmBoZ7Qoo1diysW+j
xIGN1I+1eKB9CYcIXqltcQm9f+TixAnSbafdunWz7/1LUxTFxr/OBxU5oLQ9hb4e
216837TOeC++b9EZsMjvaIrpQputL+z5irSdEiNs0Ho/Qt3Ba+ntE7QRhIfKz8W1
3mCIvVsPyJ0RArPNPaYBSgYy9HVBpQTEw2MAfLOUbIm1/qe5rKzYwYE/PAn+0qfe
/N/m1Mq9ABxd9K2u3TIwBiatVdoeJgqXl+KXxyT0XnV+iss/TrM0CdGj0pimaf26
tZtM2TZMmXQyquatXmeMT18CleOEIN0PgWe2thhfEM66p45Wv+VJU0yWW2wUDTYI
AquyamTnZohREz6DmJJPeXPplYCeEBWd8OgwjllEcmMKbWn+KOVoCC+mA7/3LXfA
hOGLpysaV2qx+xSZtjWKspwqcsoMK6dIwD0HjvKdWQPF9/jSkDK8kIP+kUdToYkT
lqDyOketIcdvui3s+jaKrKAjaiOTvglOtkEfHeQG12arLTdN82o=
=pYsK
-----END PGP SIGNATURE-----

--53ak45ahsznario5--
