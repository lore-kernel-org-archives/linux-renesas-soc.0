Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56400 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbcF2Sh2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 14:37:28 -0400
Date: Wed, 29 Jun 2016 19:15:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Message-ID: <20160629181555.GJ6247@sirena.org.uk>
References: <87fusysjam.wl%kuninori.morimoto.gx@renesas.com>
 <8760tusj2q.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5me2qT3T17SWzdxI"
Content-Disposition: inline
In-Reply-To: <8760tusj2q.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 07/39 v2] ASoC: simple-card-utils: add
 asoc_simple_card_parse_card_name()
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--5me2qT3T17SWzdxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 31, 2016 at 09:01:34AM +0000, Kuninori Morimoto wrote:

> +	if (!card->name)
> +		card->name = card->dai_link->name;

This will unconditionally defererence dai_link but it's optional - we
can have analogue only cards.

--5me2qT3T17SWzdxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXdBBaAAoJECTWi3JdVIfQ3GEH/RH0oGLwrYYalsdPRadzCoBN
D6AH08hIOLh30I0gAQK1hpnUsHvp2BQFsl8GjC4jdftUh39BQWRPujEh7TZtpCRl
nZXDjzh2fBaWSnw0LmnQ+WoXXyyI2AX2Rge5CFrxbc8EnZF5N6dxQJoHWVNlsZb9
upyWpBmKYbP2iF909aG9tFKnHlgnj++90+zAwAELZLD3ymgSlvBTonBKDulkBGF2
oG5b44CXP+W9D+vbfysH5/S2yV2fD0qGAEMR0xE+RxPOtVvp4bI2lcsF5GHXBWzg
zt31WiH1bFqZ9ya5f7EZRcIZkMMG2TXAeYliFlaeXuovgVAv9GxeIVw+f4j9pOQ=
=seZS
-----END PGP SIGNATURE-----

--5me2qT3T17SWzdxI--
