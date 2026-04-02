Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECAE3F075B;
	Thu,  2 Apr 2026 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152040; cv=none; b=irin884b+e1M3zYUGcZ7HVO+fxGxled13GanQgkQBYTGuDliQVFpAKSnzncXaZrahut7buZivf+aLw/vfjO+KiS6ML9Oli3HGMgXl/SCqoP6Xuh6OxFvQDCyjWWxOx4qgN8sPLY5V5sIvAJMCAwFqbsbD9a6fcetiJwkcsR1yio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152040; c=relaxed/simple;
	bh=/RUXzRHQ70OXCYRjZtQYAjwgGLumJux8lz1AKnRIZeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/vl6lHoVEENCphmwbvVxD6x+xT5dzDMHpQ5xcrU9G6y8UG4s6vsSvtSCJuFNLOXvReTM1X4AitpvsE475JHHYRgSTWLegWHSIn0hmNlbG745VEhOLN3Mna8OZvu6f+8yxanQ3Y8NWNFp8QFdNfrMGSL+8TeDm9N+h1Z/oAvHjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvCisbbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvCisbbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3357BC116C6;
	Thu,  2 Apr 2026 17:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775152040;
	bh=/RUXzRHQ70OXCYRjZtQYAjwgGLumJux8lz1AKnRIZeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AvCisbbs+lMZgHQoe9GwX5vvA/PANkTPCN+6nh4UbNU8I0C6omdywUhqa7lBWY9Hf
	 lbxQNFTR77XuIdPs0v+4v1t9OTnv2EEgoxQ6qqGqy6E7k5JdX8X2ShWAaudqJd8sUq
	 aqfPrgjd3L1AOOzXBZ0DCTr4MHCGCsTDeaE4rtVktKQGfV1DxZKfMNlATBLpF56sW3
	 dKPFnXIH0Qm8QNZ5MsY+u8YoIgE9Nz+OlNpMsTt3KEemNg/wf1IpIXrlBPKg2OwnBw
	 6NEvwqaI8xiodCWMkSmnPbZ17Aen6BylORLZDKS+hiKpEQdKY/rE0ob10Bo8N6SYZ8
	 7QYgh2FkNErOg==
Date: Thu, 2 Apr 2026 18:47:14 +0100
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCh v3 04/14] ASoC: rsnd: Add RZ/G3E SoC probing and register
 map
Message-ID: <ca7da576-5280-456a-969c-aa4762803ee9@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-5-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IUMLs052X98m1qjQ"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-5-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!


--IUMLs052X98m1qjQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 06:24:26PM +0200, John Madieu wrote:

> @@ -629,7 +632,9 @@ struct rsnd_priv {
>  #define RSND_GEN4	(4 << 0)
>  #define RSND_SOC_MASK	(0xFF << 4)
>  #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
> -
> +#define RSND_RZ_MASK	(0xFF << 8)

This overlaps with RSND_SOC_MASK.  That might be intentional but I'm
really not sure and it's all kind of unclear.

> +#define RSND_RZ3	(3 << 8)
> +#define RSND_RZG3E	(1 << 12)

These are both in RSND_RZ_MASK but use different absolute shifts which
makes it less than obvious.  It looks like the lower nibble of the mask
is the number from the revision and the upper is the letter?

It might help to use GENMASK() and FIELD_PREP() for this stuff, and to
refactor the defines to use subfields.  Like I say it's all a bit hard
to follow.

--IUMLs052X98m1qjQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOq6EACgkQJNaLcl1U
h9D/Hwf+O4if89cilkBrrwOFSH/7+0yBUojTQc0bFyUYhNyQR/P9oBtL6XxCRbuR
9RJo2MxuoHtP3wAFiVQmJL24nfd3vx4C5pWqUsPBCips6+VFK29g0i3qLEoUVfOi
w8EDIxlSi+mhimdIRjuf4ncSqGQdC/fv1bcr0+pSA2rUz8zOoUtiktvGuxS7QEmM
xgV8F0El2ZfR43YCewjlRy04nzKKgfUic8azbP9IfS3updIwB+r7pj12GAUjZOni
Lr2guD+qDu1WBFlqFfwBgkGTTq8rheF+HORklPywoxYN6ZAflZou/ruE5+uZCBej
EX+bljcl89tsOsMI3rKFKIpzgUgC+Q==
=4E7L
-----END PGP SIGNATURE-----

--IUMLs052X98m1qjQ--
