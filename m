Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BD47ECF3;
	Tue,  7 Jul 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460786; cv=none; b=UoKWtJvFlB1Yqlvl7Ni68ejN+c4ivIuLHQYK8MmR+bgbjK2F4tRpjhaN26GQ4WtULZiCD0g9vTHktwrcQyVn2xSLgjI7Rubg/M92tEbTpPqEKw3qVYrPFUIh3HOTth4wC/rpeVS5TDxOH7DoKPnFLfBjJ1MlGrRuk0hS2txZLCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460786; c=relaxed/simple;
	bh=sTAF8Uo74CwK6oOKZp6DOLh3+pYXXmBJ3wbYtR3+424=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m63k/QBhsSeNRBLcWm8uUcKEjL9LCQ7BdlGEQOuyNOdUpkIYSJ8BLHZxTbMoGn/xYXh+SFynl9R4OC5TldwrGjoe2WaauX2xL+SZWyEDM1w3saG0d6FGlxokcWtJ1pbA34lY08uG6ZEO5WUTy01KzxD7xbALNJ14YYVYyrDRcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcUG9cFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcUG9cFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD681F000E9;
	Tue,  7 Jul 2026 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783460785;
	bh=sTAF8Uo74CwK6oOKZp6DOLh3+pYXXmBJ3wbYtR3+424=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcUG9cFUaqr3nmsbyavprrM8gV6wm5iB1hxZhGZIFlZjZq7gXa8S3ZK2OtyuC5zEf
	 3+W3x2bzqbYGnRdF5+efS9pIzTBASuA9MTYn/HttLLwh8QfXswruqrkw1WK+6cqpro
	 otwdrKUPvHYK7t0/4qUyMw2lHz0ensR8y8pGwqPAwgnExusSPN764LfXBFf22XjtRf
	 Lm/Ye77Zfjx2ZcF3iAZbtfW1POxg/k62DArwHFlwjbjg79Zo+7v3f49v9pPit9jbn4
	 /+N6fEhJTxIMCLfHpgqbDxF+piHzMjo69ySKtpT3E+GbdwvpMXVvTCsbrvTwhk968R
	 THxUjdvqLdBPg==
Date: Tue, 7 Jul 2026 22:46:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: renesas: adg: Drop redundant NULL check on
 clk_get and clk_register_fixed_rate
Message-ID: <eb4dc48b-76b0-4b47-82f8-be0d35437967@sirena.org.uk>
References: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TcAC3ZacrnmTGTc0"
Content-Disposition: inline
In-Reply-To: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Cookie: Alaska:


--TcAC3ZacrnmTGTc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 07:23:26PM +0200, Krzysztof Kozlowski wrote:
> devm_clk_get() and clk_register_fixed_rate() do not return NULL (only
> valid clock or ERR pointer), so simplify the code to drop redundant
> IS_ERR_OR_NULL().

The two patches here aren't obviously related and should probably have
been sent independently.

--TcAC3ZacrnmTGTc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpNc6sACgkQJNaLcl1U
h9DKyQf8D8SFSnDWgLpb24bUzc0z8xEmhX482RB3IdiW0Pd1Q1csJOgkLn+wvBPD
07s4cL7KvZdFvfQsLeiLEmp4ZdwOZK92MArKDMgZtGH8J7ZPimiQg46aP5uPZfNr
9ERKkteF5Vh3SM8vvZHHjZ2KsGQMVoajk/A61xVxrvT7rXjU9s0wwjqmWSwEPjDH
nBaNSgFR9owOKthresvEXkFjOrYEXq79vUv/puF/25rveunEOL1RkPluMXyvBVdk
ETnvSNn1R3kuvkLlvy6AtPacj9z3MvLKD/sGHgage6jUUlvcOO9csnuw4d6BqNmi
v5MkqHz9AQFZPhFRV3fKXTPM8n+k4A==
=exgB
-----END PGP SIGNATURE-----

--TcAC3ZacrnmTGTc0--
