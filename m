Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33472 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004AbcGALHS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 1 Jul 2016 07:07:18 -0400
Date: Fri, 1 Jul 2016 11:55:21 +0200
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Message-ID: <20160701095521.GK6247@sirena.org.uk>
References: <87fusysjam.wl%kuninori.morimoto.gx@renesas.com>
 <8737oysj1d.wl%kuninori.morimoto.gx@renesas.com>
 <20160629181843.GM6247@sirena.org.uk>
 <87bn2jbkck.wl%kuninori.morimoto.gx@renesas.com>
 <87a8i3bjp2.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tw5XVHq4jmAOFG53"
Content-Disposition: inline
In-Reply-To: <87a8i3bjp2.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 09/39 v2] ASoC: simple-card-utils: add
 asoc_simple_card_parse_clk()
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Tw5XVHq4jmAOFG53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 12:39:12AM +0000, Kuninori Morimoto wrote:

> Oops, of_clk_get() doesn't have devm_of_clk_get() ?

Perhaps add it?=20

> (and no of_clk_put() ... )
> I will keep above as-is in v3. We can fix it incrementally (?)

You can just use regular clk_put() with of_clk_get().

--Tw5XVHq4jmAOFG53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXdj4IAAoJECTWi3JdVIfQiVoH/2got0uwBxyaKrxROnFB8mli
qKNPgGipvxjJC1YFMXTopGmG18xImL97fIgtC4evHmjVmjrxpfzl/q2fqesw4UzB
9up7TiC0wM/oeDrXsbHM1Tgx9EBOXdiAk5g19CsWE6PgkR8DPeYCD/nS5sS//GkJ
7x5+k+nxgKsWHMGkTQ70vA/lDq5pUvhCR4nBTEvJtomxetD44HgWdtjB8F4rt8K2
83CZTLyf7hMC/496nLd2cCLJ6io9YjGCb0M0EVKxyAXefUfYY94g41Y1iMDxNdwf
aO7TCi6zrd3xNjHH/GtyzAdSODYM1VVSeIiLGYjhXOCaRdHMJTUmewPrR1YCdwI=
=sfv0
-----END PGP SIGNATURE-----

--Tw5XVHq4jmAOFG53--
