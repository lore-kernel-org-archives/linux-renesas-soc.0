Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbeHTUDn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:03:43 -0400
Date: Mon, 20 Aug 2018 18:47:18 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi_internal_dmac: fix typo in
 DM_CM_DTRAN_MODE.BUS_WIDTH field name
Message-ID: <20180820164718.3mqaej56tcl5jna2@ninjato>
References: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
 <f93ace85-6e2a-fec0-b73c-9101bdde60eb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6gfoe7j6hcrfg7bg"
Content-Disposition: inline
In-Reply-To: <f93ace85-6e2a-fec0-b73c-9101bdde60eb@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6gfoe7j6hcrfg7bg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2018 at 11:19:02PM +0300, Sergei Shtylyov wrote:
> Fix a stray underscore in the DM_CM_DTRAN_MODE.BUS_WIDTH register field
> name.
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Yes, I noticed this, too recently

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--6gfoe7j6hcrfg7bg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt68JYACgkQFA3kzBSg
KbZV3A/+JVogUsDI+WP16mL7+5fCv8qPbPitfdXCFOsI31GnMjtRlhJ+RhtkJ108
0Wlixh5CZDjLdWda5ANvHvNsPgUg3APL9gyFhOoGR3jBznD+lzOrO0t9NesL0NYi
ZK/tiFja9zP5cU3YGUzAq6rgNqHcjmfY1kJE4oUnGNO3jcZnJGgQy2j7l/BnzivJ
GQ9XDNm78ZrgVnlc+kJWGE4KaD1kFA141xgSKdt5ST8+gSI9yXwf+/nKmV0KUvgY
34ppEs9Pqf0yxTtZZVUlOJxuGo3nNUU9WmA8wZ9xCfRY/Rubr//Z1BK3CPG5mOkU
jlljBULwiJF2cfCDaxWqls5sk+OVcv/TYzS95Hb1sYCBouivcLEX9JL6h0IDnQQl
OL80+YhcFhGEL+FS/CLyuYTyh4Gd6rjw7nNmVaAtgNIU42CoyKinj7XnT14UGOgj
jkrW+IvvyqZXSqD32IeLT1o2ufX428cnjk6xo6CxNKHVw4/Ej3YvlF1JW2ulk1LJ
ux5nc6RnOLJhn24jVLl/7fwhaBfMQgOnDnTKnMfCNOi5UfOBJFIijLLXb3MOKB7S
LjtFFIkMGmpp6xq3lGJMyjSbv3OxqiJ0r80px21Wp2KQOs8JbQQPHSN1hfBD+yzi
NEchuvJwNJE2Uy2U4v2oE8ASb1aX2D1pZFVFGR9b/bvK07VdTDI=
=0+JC
-----END PGP SIGNATURE-----

--6gfoe7j6hcrfg7bg--
