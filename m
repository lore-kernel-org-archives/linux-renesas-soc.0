Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58376 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932209AbcEWLAy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 23 May 2016 07:00:54 -0400
Date: Mon, 23 May 2016 11:58:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Message-ID: <20160523105836.GM8206@sirena.org.uk>
References: <87lh35rs8w.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z/kiM2A+9acXa48/"
Content-Disposition: inline
In-Reply-To: <87lh35rs8w.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/49] ASoC: add simple-card-core and standardize
 "simple" card
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Z/kiM2A+9acXa48/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 20, 2016 at 09:36:53AM +0000, Kuninori Morimoto wrote:

> These are very big patch-set, but basically just cleanup for
> simple-card driver.
> Now, we have simple-card driver, but it is not simple today.
> I would like to cleanup this.

This really is far too big.  Don't worry about it this time but in
future please try to keep patch serieses to a reasonable size, split
them up and send them separately (and not at the same time either).  A
huge stack of patches really does not look good as a reviewer.

--Z/kiM2A+9acXa48/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXQuJbAAoJECTWi3JdVIfQuBUH/R9gw8MadjDNuIXsQhzC4Veq
QfvJiXnf3qQ8NYOwtcPh6X1TyukERe3ngHvaQJhK2kxW9Iq6jDRO/x0FITOSrlDS
OxFJnHRgHzKHdYkSZHXFgGzQ6VuyIgZl/yR32XphQc9z+zTs0Wnwsx5DTufWN2yq
4vDyVywmejY+y6x1OYma9AI9Ie6l/F/kEoL1OCvc3hJX3qVXlzh0bsj4A+CQY+UZ
zG1OBjSsus7wEBrDKh/nqh5sa/FemLZuxbaj0aAAGp/sdnLAm0q3GmUpE1uiK1dK
ff5JerEPUrxEW0PpW57lOIC/K/HcB+fL27jj4rWGHOpQIhxhJVppSnxhAckEJWc=
=dh1R
-----END PGP SIGNATURE-----

--Z/kiM2A+9acXa48/--
