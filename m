Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54510 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdFUQ6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 12:58:09 -0400
Date: Wed, 21 Jun 2017 17:15:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lars-Peter <lars@metafoo.de>, Simon <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>
Message-ID: <20170621161533.pm5jfszombyexfpo@sirena.org.uk>
References: <87efuf9z8u.wl%kuninori.morimoto.gx@renesas.com>
 <87r2ye6k4p.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5r4e7rwvux5fjns6"
Content-Disposition: inline
In-Reply-To: <87r2ye6k4p.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC][PATCH 0/x] ASoC: replace platform to component
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--5r4e7rwvux5fjns6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2017 at 04:32:30AM +0000, Kuninori Morimoto wrote:

> 	- struct device *dev = rtd->platform_com->dev;
> 	+ struct snd_soc_component *component = snd_soc_lookup_runtime(rtd, driver);

This seems like a fairly sensible idiom, and it'll also help deal with
some of the issues we have right now with CODEC<->CODEC links I think.

--5r4e7rwvux5fjns6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllKm6QACgkQJNaLcl1U
h9BAFAf+J6if78fffPJC4qIEBFw6pgX9v86jr6koKlTPP29TaecqsgbPwsqNzkDd
sjnN8+Rk86t88hMqCDgqADSdLTqciEWW1ROEFwR1kKYgE1d94fIlqPKiCbyvIkpP
V5RGNya/HNGb9W005YxzSlRfjSSIe0art+1Et2hhb4VtgN7FuHUGiNGCssqGUd0r
DUjFO/NLmbWVTotrzrFXu0EGqBQAjyz3bdYq8GGrOq0ewfLf5RMt1GbKKCQ54sd/
nbaguq10oW4ZTweWAt4wXHlggXdmT/QcoTW9T0mVSqPtsD1RHUnqyjI5gIxuo4v6
FsLSv2mOJd60br08mNm4FIhcIk4wuQ==
=4rcc
-----END PGP SIGNATURE-----

--5r4e7rwvux5fjns6--
