Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 18 Apr 2017 18:57:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20170418175738.bqsjyltki7zujbjn@sirena.org.uk>
References: <20170416180801.17828-1-marek.vasut+renesas@gmail.com>
 <20170416180801.17828-4-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bi5riwetkvy4zveu"
Content-Disposition: inline
In-Reply-To: <20170416180801.17828-4-marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH 4/4] regulator: Add ROHM BD9571MWV-M PMIC regulator driver
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bi5riwetkvy4zveu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 16, 2017 at 08:08:01PM +0200, Marek Vasut wrote:

This looks good, a couple of minor things though:

> +static int bd9571mwv_regulator_is_enabled(struct regulator_dev *reg)
> +{
> +	/* Always enabled. */
> +	return 1;
> +}

This should be the default implementation, no need to open code it.

> +int bd9571mwv_set_voltage_sel_regmap(struct regulator_dev *rdev,
> +				     unsigned int sel)
> +{
> +	return regmap_write_bits(rdev->regmap, BD9571MWV_DVFS_SETVID,
> +				 rdev->desc->vsel_mask, sel);
> +}

regulator_set_voltage_sel_regmap().

--bi5riwetkvy4zveu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlj2U5EACgkQJNaLcl1U
h9Acjgf/eU6vGfdIMXIydOZuPe90YsLwB2WXnJ3RkV9rhrSE91GO7Oy68xgLwZe7
hWBzzlr5PU6XPT/bZ3X3mo+LDMzWf1KEXizxZ56e1eAOqGk9ivDnbSxXUiqTVWqd
WRldOxwVfaNzfc0nqqrwEan+jUrJwaAEWsy5h/I8lSrqTCx95q0kyYA0NcKqOfbg
z3GRnil4dG/03RtKsq3nvBMjDPagHDXYaiItiQRdbB4B1cpQCA/TtCVBeXhJiFp+
IJ4CMtmHa1+B3JdiiX/j5g6WavqfxBgMNqDuLC+I2Ju0D6iC9WuIMBrwapVyMZoc
335yLBCkpE5TNZXS0T1xST4AqtL/qw==
=sOkq
-----END PGP SIGNATURE-----

--bi5riwetkvy4zveu--
