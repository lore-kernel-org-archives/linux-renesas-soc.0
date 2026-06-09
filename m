Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85997320CAD;
	Tue,  9 Jun 2026 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781047499; cv=none; b=cORz/ByqEu7uQVMJj/BV+uJmC+vS2c/mA41lbYCw3vvXBq6PM+1GsXbtzJ3wr7Dud1dTrFShVTYexGjjG4tDgA6YoZYH/aDCdxDYJp/Nz9W3k+a9VE/od2qVplJD/H+XTjkZ/0cJ8UK59R7c54XQPfKVGT4jb+Bb47Phg9ScJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781047499; c=relaxed/simple;
	bh=9MdWy2QrDz5exOOLcEuBuj6NyRKlWXPx6gtf5833H4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRpwundnTRiQ/mOcV58mrJG7NJ5IPUEjsxhZce60FPCkeMWpIItVpA+GfE+T4AFS2IZQV2t2YG7R1HrXJ0Pro5B+Vhv2E5YL0VN5dQcfOgV1lbfrwMYwvh87TJC+y/mFbRnDNnZqip2PUWVqbv8nbNpPJ+70e7loky7OuJKxFao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WELQ078C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WELQ078C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D561F00893;
	Tue,  9 Jun 2026 23:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781047498;
	bh=XECSwOdG7aWv+AWzkviwG4lcJ5iemprDQN3GLacZFEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WELQ078Cnx3ZRgxOd9TJSEoDMyp4ZPhSZQoulwds1G3zBSC/ve1v+j8gSMDVmqo8Y
	 N721YOKAn20IE0/TAql5rkEUqo86waFSU9AhrjTyMRuVJNxDoAPjKP4JZfLp9xrY48
	 4WBSTcXWPvwABjPWblyjWVQwZRflo06m1juhCm5bmXhjUKgP0v5W6LA2g85vYyY0ne
	 Qox08IOwOPpG2XLO/gPu8Ma22b9SMQvfmnqgdRtMVfYWPzQeLTrbsC9+/BuWOREr3A
	 zuOaRaPnRw7DHvKXzo9JZlVcgr5SRZAfMZB6ePMBxf8Tn9fRETUsJXEORVPzldr40W
	 m4tqDeuyC7/Kw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 856FC1AC56BD; Wed, 10 Jun 2026 00:24:39 +0100 (BST)
Date: Wed, 10 Jun 2026 00:24:39 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Message-ID: <aiigtwDM-qEBxjH5@sirena.co.uk>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
 <20260609113836.45079-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rIVLtUXf0Jj60L4V"
Content-Disposition: inline
In-Reply-To: <20260609113836.45079-12-phucduc.bui@gmail.com>
X-Cookie: Leave no stone unturned.


--rIVLtUXf0Jj60L4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 06:38:36PM +0700, phucduc.bui@gmail.com wrote:
> @@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  			  struct device *dev)
>  {
>  	u32 data = 0;
> +	int ret;
> +	/* enable spu bus bridge clock */
> +	ret = clk_enable(fsi->master->clk_spu);
> +	if (ret)
> +		return ret;

This is unconditional...

>  static int fsi_hw_shutdown(struct fsi_priv *fsi,
>  			    struct device *dev)
>  {
> +	int ret;
>  	/* stop master clock */
> -	if (fsi_is_clk_master(fsi))
> -		return fsi_clk_disable(dev, fsi);
> +	if (fsi_is_clk_master(fsi)) {
> +		ret = fsi_clk_disable(dev, fsi);
> +		if (ret)
> +			return ret;
> +	}
> +	/* stop spu bus bridge clock */
> +	clk_disable(fsi->master->clk_spu);

...but the matching disable is skipped if !fsi_is_clk_master().

--rIVLtUXf0Jj60L4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoooLYACgkQJNaLcl1U
h9BikQgAgs32gfdN4Rngk/+MZu3KLIyYeq4PEjHKyPBS45e/hcQAox/9hL3UG9ok
y41NH8g3rJIB0pGpxqkdhgy0comqz/j8jke5fF2Tutv2nnzCKeZ8u6ZZqY5ZgI6Y
ttlqSXpeRuCNBKLr+Psk27CJsvUALBTrahTK9IraRIbODD27+BYqbpH5u2eq4NTJ
cBHwq+GB+8IDWUrVq39gZA6+/u7mY4YfuWe8r8EhvkOyEfcW414tjaPiMCEEsu9c
tXejrZloBhnG4xrH1c+dmvC+aqhhBGoReDUPWEjqsc7RQIqK9rNumDb/s763UxYd
gxKLg1je7le4XGT4P+ojFZh6gLU0kg==
=q5yz
-----END PGP SIGNATURE-----

--rIVLtUXf0Jj60L4V--
