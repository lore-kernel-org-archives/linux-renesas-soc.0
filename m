Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43534 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030980AbdIZRau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 13:30:50 -0400
Date: Tue, 26 Sep 2017 10:30:09 -0700
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: Applied "spi: sh-msiof: Add compatible strings for r8a774[35]"
 to the spi tree
Message-ID: <20170926173009.xdw6mtvcyixpenr7@sirena.org.uk>
References: <1506329660-4064-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20170925161637.D7471440058@finisterre.ee.mobilebroadband>
 <CAMuHMdVsRwW+10ERyTJAa8XhhkPMn4ruymUwPKot+kmczBwbcA@mail.gmail.com>
 <20170925184545.5k4nke27rgud3uwp@sirena.org.uk>
 <CAMuHMdUv-5COUuzJOWx=BTb5oJ7tFOi1BpocuJ7+VuCZ3fEuPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="flc5unealuztpgbg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUv-5COUuzJOWx=BTb5oJ7tFOi1BpocuJ7+VuCZ3fEuPg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--flc5unealuztpgbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 25, 2017 at 09:15:53PM +0200, Geert Uytterhoeven wrote:

> My rebuttal is threefold:
>   1. Listing the fallback property is mandatory for new SoCs. We only keep
>      the per-SoC compatible values in the driver for older SoCs that predate
>      the introduction of fallback properties.

So good practice is always good practice, but I'd argue that it's not
bad practice to also explicitly enumerate all the documented compatibles
in the driver.  Being liberal in what you accept and all that.

>   2. Some harm is involved, in the form of increased kernel image size.

Is this really a meaningful impact?

>   3. When updating DT bindings for new SoCs, we usually add "No driver
>      update is needed" to the patch description to clarify. Unfortunately
>      that was missed here.

That's basically the same good practice thing, it's just documenting
what you're trying to do here with not putting things in code but
writing things in changelogs doesn't make them so!

--flc5unealuztpgbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnKjp4ACgkQJNaLcl1U
h9CyOQf+KF7TH4e1LUiEusbvfDIIFdd+l5LEKQIJqQP/5OoKznc7+7vQKftJuqqM
Wobnz0aQOhA1AMgXh0YnKyxx8CJIiEFq3DA+W3eLt6BABkRTPTkfSGjP/kYPa31w
Px/pPoPFiNK3ldlhKAa2HkPoYA8MjlhcrX0U+fCa129JDFm8EKEmS6e6ThEnL5bW
E48g6EGj8uImSSYnz+vBRnZ+GxkGuMkz41h+3735uXYUqvj9om6gIGSgSetH2l1y
Mf6YW9h4YPybdui9n1ROLjZH8ELKCtLMhexyyDWZGlgmUOMkMEfSVfpXStb1hwRh
C0eLU6+cRxHyjbStxq+Hacz2c2W/9A==
=2Ur+
-----END PGP SIGNATURE-----

--flc5unealuztpgbg--
