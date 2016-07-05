Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44744 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754637AbcGEMLU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 08:11:20 -0400
Date: Tue, 5 Jul 2016 14:10:52 +0200
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Message-ID: <20160705121052.GQ6247@sirena.org.uk>
References: <87fusysjam.wl%kuninori.morimoto.gx@renesas.com>
 <8760tusj2q.wl%kuninori.morimoto.gx@renesas.com>
 <20160629181555.GJ6247@sirena.org.uk>
 <874m8bbdei.wl%kuninori.morimoto.gx@renesas.com>
 <20160701095249.GJ6247@sirena.org.uk>
 <874m861dzi.wl%kuninori.morimoto.gx@renesas.com>
 <871t3a1crg.wl%kuninori.morimoto.gx@renesas.com>
 <20160704085003.GS6247@sirena.org.uk>
 <87lh1hzsww.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LDTYQ/yPU1fZltPS"
Content-Disposition: inline
In-Reply-To: <87lh1hzsww.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 07/39 v2] ASoC: simple-card-utils: add
 asoc_simple_card_parse_card_name()
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--LDTYQ/yPU1fZltPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 04, 2016 at 08:59:53AM +0000, Kuninori Morimoto wrote:

> > If we try to dereference card->dai_link without checking to see if it's
> > set then we'll crash.

> Ahh, do you mean we need like this ?

> if (!card->name && card->dai_link)
> 	card->name = card->dai_link->name;

Yes, exactly.

--LDTYQ/yPU1fZltPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXe6PCAAoJECTWi3JdVIfQAXYH/iIJzDKppXiH2TVvEiAQd8JB
77rn2rZB13lJTFdMr4PnB5SYkJHVwJZMyX8+Af2bsXfElQ3e7csQMFfg+JzRN08O
k4c1vIzGH56Is1qTpTCa/r2rkMmd73S/slffwJsCxnttqWok0TB9LaEODU2q0U86
avKak5E5mE72r9aweHAMyeUctvCK1DnhJEcM6s+kBfXycieSl4rOrJh0naCmnyEm
DUEBYfQjsmaflWCZljq8qX+1UivVeS3R9706xRZC5251DTCqQfxHITqfh/fuMPEz
Vt5xP5JOlbJun8zz8Sm2x0QOcAmREEu+v53IDTdMf6edqFx+uOxc3lbBR2pyofs=
=S3mA
-----END PGP SIGNATURE-----

--LDTYQ/yPU1fZltPS--
