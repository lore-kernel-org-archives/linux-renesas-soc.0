Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A920349B0D;
	Thu, 16 Apr 2026 18:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365861; cv=none; b=bcIzfvi6TpSkePv9Uz+q7jDWtF0XucmG3kPRNSOgXNlUfk/yIPZSydgrobQ/BhVvX2Ac3K67zG5JeHI1sZed2TZc2bdhzKUEElY3beYC2dcCV0ky3fmVRS9UUM00rTFlSqrkanJgOl74U5gP/wKNddi+9Fou6wkktbyLxhcCnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365861; c=relaxed/simple;
	bh=g2N2DlXRhjRxBrPCbAkET3bZWgkq1NAZoDcFEaAZ5Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBfv5D4TMc69Jq4eRaf9B8okRJJ7a7MiZUosXu8nkiRf1pfe98EW2E3U683Ta5aJ7BCA5DsX3ux+TRXwQ0DXm/jahfBmZhSN6k2ZFkzJGYt8G+Cp3xcXY5rfUjhpaqvjsO0FeoWKou9De5lzpbVNGNLGWuodo/9B2ftUz4oSGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTFedHGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTFedHGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EEBC2BCAF;
	Thu, 16 Apr 2026 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776365861;
	bh=g2N2DlXRhjRxBrPCbAkET3bZWgkq1NAZoDcFEaAZ5Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTFedHGry5HFxogbSEMZDntZ/VrLaifOQDOaJr7qXNjTh0PP1KokxoW8VFdurb69t
	 911RYmFOGDfaihD7QeNrj86qEYhzVUS8uvczRAhvh/IymQ7GnL/MYHkIN1uITrK/gq
	 +uerozRwF0KDHSS3f39HRz16PT3IUIZj8CmBOYipzMkwrMfx1jtUJt8Mh6mccePzQt
	 ibbBTn3hZwstu/iEDfEwrWuOMF1Sqdpe2vTGnG7dkD9yvbhS8YB/+r+i+bTK2t61XU
	 YANrxEd8r9GIMwL8m9sWxtT6gg6Fxdb8W/c+NSwpEutrKJ+fmYV8LkT9W6ofnhM/gD
	 y9cL2YpqW7f9A==
Date: Thu, 16 Apr 2026 19:57:34 +0100
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 05/14] ASoC: rsnd: Add audmacpp clock and reset
 support for RZ/G3E
Message-ID: <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DBs2j5hUq/phU1mR"
Content-Disposition: inline
In-Reply-To: <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
X-Cookie: Process promptly.


--DBs2j5hUq/phU1mR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2026 at 12:47:22PM +0000, John Madieu wrote:

> +	/*
> +	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
> +	 * These use optional APIs, so they gracefully return NULL
> +	 * (no error) on platforms whose DT does not provide them.
> +	 */
> +	dmac->audmapp_rstc =
> +		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
> +	if (IS_ERR(dmac->audmapp_rstc)) {
> +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
> +				     "failed to get audmapp reset\n");
> +	}
> +
> +	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
> +	if (IS_ERR(dmac->audmapp_clk)) {
> +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
> +				     "failed to get audmapp clock\n");
> +	}

Do we need the clock running before deasserting reset?  Usually the flow
is to get the resources the hardware requires stable before we release,
that helps everything start up cleanly.

--DBs2j5hUq/phU1mR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnhMR0ACgkQJNaLcl1U
h9DkUAf+O+zaNgI31Zo/K1OHqyXpJjxG/HiG227eN2h9xGwiwDEcp2geoVxsIdZE
tXvChn6svTv5uwwP7faXLajY6/29V7K9+u8Ktr41t4pvbSPTlIomlhmDhK9tJi61
CYzhRssM1yoiGGFfU46vqGIrTtQv/jM/gmXd7AOfIH9DOIY5kCzcdDkXHCzRDyVY
4MB5YGG5uVQ4Sp9Rj+aj4274EM+FgfWv/vaW4VMEF3lw9jZtUyK/RFBjNDhy6WE8
NSK4L0TTB/LGeOZ9BfUKm7kHkZ2IflwmNMViJpKNQvmPjh6a3C8D/wBXPRZfvB6z
xn58SWBKdAjDBwGEkEY3QzOoDbKNsg==
=DBEf
-----END PGP SIGNATURE-----

--DBs2j5hUq/phU1mR--
