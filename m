Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43424 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751116AbdFVJRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2017 05:17:51 -0400
Date: Thu, 22 Jun 2017 10:17:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>
Message-ID: <20170622091743.x3userwryot4fhdx@sirena.org.uk>
References: <87lgom6jun.wl%kuninori.morimoto.gx@renesas.com>
 <E1dNdcn-0004Ex-6P@debutante>
 <87o9tgdgyf.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qinwrwrl2u7honqh"
Content-Disposition: inline
In-Reply-To: <87o9tgdgyf.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: Applied "ASoC: pxa: add COMPILE_TEST on SND_MMP_SOC" to the asoc
 tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qinwrwrl2u7honqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 22, 2017 at 12:11:31AM +0000, Kuninori Morimoto wrote:

> Oops.
> It seems this patch breaks ia64's compile.

> I'm sorry, but can you remove/revert this ?

I did that yesterday - it breaks everything except plain ARM.

--qinwrwrl2u7honqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllLizYACgkQJNaLcl1U
h9BNMQf/Yw+/VQTDX/Ys2BLRgKTViG3KbEeAP14uANTYdrh3bMx2vrC/SkEa/UL3
1h8aUPorXnmJlw+K7U/AhhDqoU1SrD1FkDe3sspGP+oZTC29tA43zgR66qr03mus
duZda9OpncUsUH/KeGCqsSEKEpkGmIbFhuj9NX/l4pSejpEyipBa+zTOZa/tgWNZ
2QPDkKJKfuvb+urlpoRDqwLmUq292yAXg/VFXS1fUxAIJNQIPcQCUyHlKhF+UFea
sx4LRWY9N/2zRnAJF0KGfzOfEsdZT9nDzBRL/rBVv+34lUUIri7hOAIW/qyK+myy
DNyCHMjllOL4k4KBpEFL4mXFaXoKeA==
=8jzq
-----END PGP SIGNATURE-----

--qinwrwrl2u7honqh--
