Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49776DDCD;
	Sun, 10 May 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416249; cv=none; b=c/rOk7JTf8ZmKEX/WRvGdPnBI3AJ5c8yp7cRBumyZgXctfmFC7bddrtTZlDuUzI96haacAT08QksCCYIcI6qca7nDpm2RQV8iSgg6pUbodmgQ+C/IQKKBbAj91hk9150LbdFcRleVVugoqHp4X7lKUH+aBKEP1BQ4/xqKR0Oj9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416249; c=relaxed/simple;
	bh=bS8CsNCfeO9lmLqY8ZDyezLOZxaysM6e72tDqpzG8+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBxEVv2UkhG1JvX7TrwaLvF+lelP6+VQMNBY3EWJaOmCc+IIU9FrIYLeApJCwX8t0b5rwz46y/epYyke9tFwMDX4voeYdL9SmZfOXAgGVNEjpofkwP1FFOE9LNKhotcgZCfpkym/pZ37ZrQ05l/a7advl/3B5LiHvUoJ6FhHIAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+mug5RP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+mug5RP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F24C2BCB8;
	Sun, 10 May 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416248;
	bh=bS8CsNCfeO9lmLqY8ZDyezLOZxaysM6e72tDqpzG8+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+mug5RPrwHvFuPbGkPZ9c3goZKJ/GFedUTjYpAfzhxNs5LwDmdLRDvMHhBuwCc94
	 OOUWmZvxDk8fQpDT+0iPUSyC6g2yz0VbOYPGoiauHfUDdUMIZg297NOx3MXV3dZI1c
	 Z5uJeccVDqHeaH8Xbv0RYxm6C9Qvz1989Em/fT22zLLf9TEdcSLKxbuPJlyYhr+dgk
	 dEHSFtoa0/If4rCjO/7li1fp75a6usnbVGsqdSFX01Miv2u66RpsdKSdzRANUrHlX8
	 BeOXIsRlfhEH6is7zO/awDr7vn2r3n4D4gCcZ72uISRTeFCwscoxGa0+HxRK4uqXJF
	 sCoeT/aCRJ/tA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A1D681AC5898; Sun, 10 May 2026 13:30:43 +0100 (BST)
Date: Sun, 10 May 2026 21:30:43 +0900
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, geert+renesas@glider.be,
	krzk+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz,
	robh@kernel.org, tiwai@suse.com
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock
 initialization
Message-ID: <agB6cystBNT4-V3L@sirena.co.uk>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-8-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bHrwpyzAOaCuqHrH"
Content-Disposition: inline
In-Reply-To: <20260510084303.122426-8-phucduc.bui@gmail.com>
X-Cookie: Truckers welcome.


--bHrwpyzAOaCuqHrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 10, 2026 at 03:43:00PM +0700, phucduc.bui@gmail.com wrote:

> Move fsi_clk_init() to probe and use devm_clk_get_optional() for optional
> clocks. This allows probe to succeed even when some optional clocks are
> missing, while set_rate() performs strict validation to ensure all required
> clocks are available for hardware configuration during audio setup.

> +static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)

> +	if (!master->clk_spu) {
> +		master->clk_spu = devm_clk_get_optional(dev, "spu");
> +		if (IS_ERR(master->clk_spu))
> +			return PTR_ERR(master->clk_spu);
> +	}
> +

> @@ -1997,6 +2001,7 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->running_streams = 0;
>  	fsi_port_info_init(fsi, &info.port_a);
>  	fsi_handler_init(fsi, &info.port_a);
> +	fsi_clk_init(&pdev->dev, fsi);

We ignore the return value from fsi_clk_init() which means deferred
probe won't work (as well as fatal errors).

--bHrwpyzAOaCuqHrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAenIACgkQJNaLcl1U
h9ByYAf/fHWslAnAD6OjJOrt0pI7DgsCAvesTy6vKZiNBw08XoHo0u3Y7Rik3HbP
NiDKgGP//kkSuDDSjd4hVhHdzdaWtPrHCgkqoNpLO294mVhHLKrsZxIZDSWshK+z
GTYmHHLdz/iIZObg0ZT95jTzjSHvneVqR9zU9MxOgNRtV3Mn7EXL66XY3hAmMxYF
QPqQP++mOFdqt26Pj5lW4Y5n56j7LzywiyKPYcmZhTVg12A1p5VJpPrFmUgLmyfp
yQbzi13VBFh4pNshpe5HDFLsY1F6S0wOpn6BhFxILRmOay45vynh7CvUjBMKOu/e
J2nUpRYIheDSwgjEr0ijYZo8p20b+g==
=Yt/V
-----END PGP SIGNATURE-----

--bHrwpyzAOaCuqHrH--
