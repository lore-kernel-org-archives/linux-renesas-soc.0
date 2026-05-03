Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C91A3029;
	Sun,  3 May 2026 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769826; cv=none; b=L+QEAj9gSb4Qe03+6cQHfKFBodfflD5AHP4ZyQYOrtzLEmUvbD8Cu60ICgOC39ZmacJu0Z/ZrWtdUuPHhkfOltb0UoDyd3ei0Udiq9lyJpdkZGApTfeVujzhUXDxACGvFaAFThEDHtJaVJxI+xOGTSW0IC89Yh+k5ZBbCKitlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769826; c=relaxed/simple;
	bh=2UbWxPWQRA+49QsIwAgsL3xu1aY2a6ldo2fzX6NDexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rguA03fmL0LlA0mo+oBWyibix3DsQkZiwr0BadQKiwA6BDk06HJgKMEVX0u1bKiCLnQa1B7JrjwhonjQAZNPDnttUcX+/MpCIxcTqeAMqyImCt/6kQA/8d+tV0DB1Lh3kja1jjWpF79X3CRqNuwNDWaqqoBQOuYt/72HPqT1VCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDHCAUGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDHCAUGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70D4C19425;
	Sun,  3 May 2026 00:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777769826;
	bh=2UbWxPWQRA+49QsIwAgsL3xu1aY2a6ldo2fzX6NDexI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDHCAUGSMq2QI7MonUw2J4SjT6Nw2ODR9Ww1j0J+/bAozw58wEWTOhpOzeC0BS2hF
	 nhB01ev5hUoKENm35EUitNosZBp+6+343jsB4Xj3GF+tkYxVlTi/v87yLPr1dCyX1k
	 4kIfz4esi4ADGZ/b1XyUyJRFWQzVrcWL/zQDpZcSfHOLtEjJuVV/GcmfnUyFVaBSHd
	 lARW3SKOilTE8d8sLmz8Q5qqx2SU8b0Z6GIZO5Cm7etlmbK2nJZBafpf5cBoQTrQ83
	 yobtlGG9GWwJlruJ8ACJUL9xejmM6jpEG1eqKWhyJLHSbc7tVOm1y0CPTbSyiSiM+N
	 2LNYx/jFV54gQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 544DF1AC5863; Sun, 03 May 2026 01:57:03 +0100 (BST)
Date: Sun, 3 May 2026 09:57:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Message-ID: <afadX4IC9o-zj6qC@sirena.co.uk>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
 <20260502-raa215300-clkout-v1-2-fd1c2a240963@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jnDnNwSikhbrcgUZ"
Content-Disposition: inline
In-Reply-To: <20260502-raa215300-clkout-v1-2-fd1c2a240963@solid-run.com>
X-Cookie: 667:


--jnDnNwSikhbrcgUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2026 at 06:07:05PM +0200, Josua Mayer wrote:
> Renesas RA215300 PMIC can be configured to output a 32kHz clock on its
> multi-purpose MPIO2 pin.

> There are in total 6 configurable multi-purpose pins, however only one
> of them supports outputting a clock in one specific configuration.

So there should be some pinmux support here then?  This is starting to
sound like a MFD...

> +#define RAA215300_MPIO2_POWER_OFF_DELAY			GENMASK(6, 0)

> +static unsigned long raa215300_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct raa215300_clk *clk = to_raa215300_clk(hw);
> +	unsigned int val;
> +
> +	regmap_read(clk->regmap, RAA215300_REG_MPIO2_POWER_OFF, &val);
> +	val &= RAA215300_MPIO2_POWER_OFF_DELAY;
> +
> +	return 32768 >> val;
> +}

Given the mask above val could be up to 127?  If nothing else it'd be
good to have some validation.

> +		/* register mpio2 32k clkout in common clk framework */
> +		raa215300_register_clk(dev, regmap);

You should check the return value here.

--jnDnNwSikhbrcgUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn2nV4ACgkQJNaLcl1U
h9AD0gf8Cywe1GC2skqLy50qq1mCL+LSbHagEhKOttYnPlUs2YI0vdgxaHViHj+w
LdC9qtGTchnOmtMP3Nzw1E3+wyKwItFve5rdb+jzvenOJnw5zrtVJw5Lss5YcCXR
uzozaEYLTkWTqU7nfGLvLRUxVVbfD4JQxtOcbkegTppnQpTmrmphAw4CZgRb7T11
4+bh8V8PMJafnuuFWgmZoGYphfdiKA2he6vFkhU8EP0JzSpnj2LYGYO9Hw4r555U
XizJb8gqM6B7mOLCv6heuB/b5WRbZ750ecRJUA1Wueko0wU1yO3tyhSm3WvbeQq6
i0h+yQvOqqeKmdECR71nLcDKl0PcRA==
=YsOv
-----END PGP SIGNATURE-----

--jnDnNwSikhbrcgUZ--
