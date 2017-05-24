Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 24 May 2017 18:38:49 +0100
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
Message-ID: <20170524173849.h7jkmkrwk47pn6kd@sirena.org.uk>
References: <87efvnosnb.wl%kuninori.morimoto.gx@renesas.com>
 <877f1fosji.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z7ry6pxh7hnsyemh"
Content-Disposition: inline
In-Reply-To: <877f1fosji.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 5/5] drm: dw-hdmi-i2s: add .get_dai_id callback for ALSA
 SoC
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--z7ry6pxh7hnsyemh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2017 at 01:40:47AM +0000, Kuninori Morimoto wrote:

> ALSA SoC needs to know connected DAI ID for probing.
> It is not a big problem if device/driver was only for sound,
> but getting DAI ID will be difficult if device includes both
> Video/Sound, like HDMI.

As far as I understand what's going on with the graph code this seems to
make sense to me.  How do we want to go about handling the patch?

--z7ry6pxh7hnsyemh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlklxSkACgkQJNaLcl1U
h9A3owgAgubZNqzW6X14qoY2SVNqIP0Qb9kB37bIY4p4pul9sDwcYCryKenL4Orv
jDZDtztVo4bkm0izsLgY/tKvxwvM8GQJhCRbgd3IAa3BaBTryxJCGStr8FfS2BSp
fieT/QpLDbaEmRsK5FSmeD0+aGv0RFTxwS+DXUhAT8AAbselWnbcA7f/ajCBdjQx
Vr0X7VGfiVlEFOADDQCy2cM2o3lySDKhwzr9dQhHwLZoh/f4ZS8QOk8v6Q/cFKn7
cfKvIRvW2sgDsjcKVDky2pDsYCSFQxlYOszH84nlEmZsQiJljXds7R1GOUUUx+5a
T7345ppDJvWXvG7+Qo3iSqwApXKDKw==
=ed4A
-----END PGP SIGNATURE-----

--z7ry6pxh7hnsyemh--
