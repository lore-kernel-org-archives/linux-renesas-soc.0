Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 26 May 2017 18:26:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Archit Taneja <architt@codeaurora.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Jose Abreu <joabreu@synopsys.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <20170526172607.ja7crucnwi42r2gz@sirena.org.uk>
References: <87efvnosnb.wl%kuninori.morimoto.gx@renesas.com>
 <877f1fosji.wl%kuninori.morimoto.gx@renesas.com>
 <20170524173849.h7jkmkrwk47pn6kd@sirena.org.uk>
 <877f1525qq.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y66syzbxz3q3gri6"
Content-Disposition: inline
In-Reply-To: <877f1525qq.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 5/5] drm: dw-hdmi-i2s: add .get_dai_id callback for ALSA
 SoC
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--y66syzbxz3q3gri6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2017 at 11:34:46PM +0000, Kuninori Morimoto wrote:

> > As far as I understand what's going on with the graph code this seems to
> > make sense to me.  How do we want to go about handling the patch?

> This is comment to me ? or DRM maintainer ?

> If to me, any case (pickup by Mark, or by DRM maintainer) is OK for me

The world in general - mainly the DRM people I guess.

--y66syzbxz3q3gri6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlkoZS8ACgkQJNaLcl1U
h9CVPQf+P1116WvsBTyPWiId2VjCMPSTTc/kubNemQ6eCR8zdVGed4LZwcIKEyXl
aOjtdotsSFgC4BJLcpsIrJZ9QhcLEHIusnteAnFi88NombGzq1wi1k3/W/b59/CO
03kE45hoG+Hk9QqNScPxX9cC2ldSkjx/E9IZ2zKXHQI85r3NAOsDqdPvm1GaqmYQ
likREAu8mUrOROjw+hVxthE3Yl8zSkR1ly4PbkmSdk51y+WygdT0ToKz5NY+rzhp
eitIePTfouocLkJhXcu5S4rnAS31fY+3E21TRq1Xklxp0zXXR6eNzKpWZTLAmuS5
ManzxZRI0JJHo3Iw0I7OrtrBXKG6Tg==
=vcHQ
-----END PGP SIGNATURE-----

--y66syzbxz3q3gri6--
