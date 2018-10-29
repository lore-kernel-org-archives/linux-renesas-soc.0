Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33302 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725969AbeJ2RpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 13:45:06 -0400
Date: Mon, 29 Oct 2018 08:57:21 +0000
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mmc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
Message-ID: <20181029085721.GC4101@kunai>
References: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
 <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
 <20181028213444.GA1096@kunai>
 <f63a5c27-ea7d-e1f0-9bbb-211f56be8ad9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline
In-Reply-To: <f63a5c27-ea7d-e1f0-9bbb-211f56be8ad9@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > <&sdhi2_pins>;". So, basically the same phandles for both pinctrls. We
> > can re-add the second one when we need it.
>=20
> I wonder if removing the sdhi2_pins_uhs is what we want to do, given
> that we might need to adjust TDSEL or pull resistor configurations for
> the HS200/HS400 modes in the future.

Well, quoting myself "We can re-add the second one when we need it". It
is possible but a tad unlikely. That's my take on it but it is
ultimately up to Simon, of course.


--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvWy3EACgkQFA3kzBSg
KbY4+A/7B3xli10Mn4N3yxff+E4KNU/1oIj3CRriOXBzEvOjeVORT07QtKo6648d
JS65MwzmV96iJCxCwKBXGR9F/XvlfQ5FQKieVGDkjhN/rsdJYvlEfKNJ3fvmlWmU
Xra8qeaj5/wN9Tsf3IdB1F8ZHq6pwOo7bJhExyEjUztI02sgAZzDDZOuGhMr9J4S
zeUGvLQZxJlShcoWYHCsPwEaJ4SZGBc1KlgVV97b5baqw3QLDf/G3JPk7BZ0o4JF
bt1Tct+TFbBwo1ZbSpmxXakYMMTjNFxQIhiwDW/lC3irGaCH2bTxu6QhTPiJ5lOv
l9XsCzMBjXPGiMwtvVsuSLa2NCo2R8dkCAtPnN+5ZRnBmGmQKF7FB6u9p5HuaZiz
/nmG29NnzSKY3Nbl87QBe6VCd0zhfc4jSPdud4/68Gl0bLSk6s/Xp13iXT2clGfU
sENcYaARikaiT4QpghZo3ncgXYvkVWw9z1Uedpszo9CQUfTtMGZ1srlHeSTNREqT
Z21hwI/pNfXtzpCq1Jff7EPX9u5B8cFfu3ktQeNzD1sBOCfieGtQV9MR/LfIRa87
v+vqZ/BL05F9WyVrAC1bbMDChlZzA5HIormCf4/tyZo+gg/Fkf+4b/zWjOw9erDX
yJDXqRfIHA43QsFcspjvkXBJZDqxpOCIkmlQpvwsyDmlInESVF0=
=GRzN
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
