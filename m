Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55576 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727644AbeKAUYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 16:24:02 -0400
Date: Thu, 1 Nov 2018 11:21:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Dave Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [RFC] drm/bridge/sii902x: Fix EDID readback
Message-ID: <20181101112117.GA6425@sirena.org.uk>
References: <1540990667-14109-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdarsCKrb4OepC+7LNi9epRks48b4F_5eXJ_on1OJ+h1Mg@mail.gmail.com>
 <TY1PR01MB177051AC6C2B556E32AC08AEC0CD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177051AC6C2B556E32AC08AEC0CD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 31, 2018 at 04:55:53PM +0000, Fabrizio Castro wrote:

> Having the option of using "unlocked" flavours of reads and writes
> is what we need here, but looking at drivers/base/regmap/regmap-i2c.c
> I couldn't find anything suitable for my case, maybe Mark could advise
> on this one? I am sure I overlooked something here, is there a better
> way to address this?

As Linus said you can go as far as writing your own read and write
functions if you want to.  That seems to be the easiest thing, though I
am suspicous that you're having to use the I2C framework in this way -
it doesn't sound terribly clever.  You could I guess also just have a
custom function for whatever register is doing all this stuff that just
ignores regmap and bodge things that way while using regmap as normal
for everything else.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlva4akACgkQJNaLcl1U
h9DKhQf/YICRTIBGlEtOiNrPdVAyHW+fyf6uzw449B9rJr5gT8xALK+/7MttSSjI
8tDB20nxgt4bYyG3FH7OtVwS2EzDS+ZL3ChcXHmlBgRqfoV/yOZIsK3XnOmXDGUi
zAfTxvDb/RG2S6Qhm3S2v5wTlQ48GrSrTZHbaV5ma0JuESJlajuO/ere+ymR5czC
nkSBsSCQh1URtZaQyc8RHf5GKBdMvCydHtwKOTwE5BIOimHw5NCcJAkyhWQmpj2Q
u76nnLPs/k063m0SbrW426cbwIbdHIs667exkekMm7fjt2NIACtS0HBAzj6CrUj6
CY6Ftar70dfdukyFj/TYN07tF9MS5Q==
=Xdnj
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
