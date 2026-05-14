Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2161FB1;
	Thu, 14 May 2026 00:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719536; cv=none; b=cX3iPzNxYC4WWkwbdb4rk+XZU4SGAS9Jvu7sP72Kp14jMbUgjlLgM1V5ZSI+CqiibpEgD0SgYBr4Rmmq8xhPt8uC6Z0OZlf7qihcj030R/Q+OFwptbVcuQGZXx/Obw99nVQC7BHJJXxOBpddP8isZ104I/z0wIhIscdmtHC5cqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719536; c=relaxed/simple;
	bh=69E5nqFMEKvo85wGaxf0eNsKZ1WO1jSUvd6+Fa9XrB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTyIVBnZQqeYslzOQol9+7cFgYuf538Jtdax0PsuPc/PFwrpKk7+zN2OHuGX/6HOAeqgDMLUB8VeRVzSBKwrslMUDmM+SC4RJCY7HiNlTv6BpW13wZLQS9mFKdBcHCXmYoN2e5tZ1jIa3otUabnc0TAyxwOWPfLUNzuIF6b8fZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVfQt/4E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVfQt/4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771FDC19425;
	Thu, 14 May 2026 00:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719536;
	bh=69E5nqFMEKvo85wGaxf0eNsKZ1WO1jSUvd6+Fa9XrB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVfQt/4EYIY6QCOsFe4DGh5j5kDe1AEW7wxQUySr5myHQwj2oSYDpx5Of7+EJikRT
	 Vxu+YU8A9mZxjwBYvNe19b4oHOBiwR/OOUfEcAENlBS62rjoayG5+pnIWBDNqGwTg8
	 FxsF8QWI3H1cHWalm70YC0DeHEB3soGFPPhekD8lj6UTsi0Oh7k31/sLaN6wzO6CD3
	 +HotZSSj2lIXQpju68UTRJKxfS4Wt9F95/CyrGvqoaeUpk7PwJMv+/wPYwLoofKm1c
	 I+Faaa1kO4urytkxkJ6Hx5Iw6OdrjziZDdiGt2q4G3BgEVJYJNEak8je9OjKGuP028
	 ILnt5+GKdgapg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8E7301AC58CB; Thu, 14 May 2026 01:45:32 +0100 (BST)
Date: Thu, 14 May 2026 09:45:32 +0900
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/16] ASoC: rsnd: Support hyphen or dot in indexed
 clock and reset names
Message-ID: <agUbLPizzMP5XZ2q@sirena.co.uk>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-5-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IEounhn6QKZpmHUd"
Content-Disposition: inline
In-Reply-To: <20260512182631.3842065-5-john.madieu.xa@bp.renesas.com>
X-Cookie: Truckers welcome.


--IEounhn6QKZpmHUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 06:26:19PM +0000, John Madieu wrote:

> + * On ENODEV from the hyphen form, the dot form is tried. All other errors
> + * (including -EPROBE_DEFER) are returned to the caller unchanged, so
> + * behaviour against the clock and reset frameworks is preserved.
> + */

> +struct clk *rsnd_devm_clk_get_indexed(struct device *dev,
> +				      const char *base, int index)
> +{

> +	if (!IS_ERR(clk) || PTR_ERR(clk) != -ENOENT)
> +		return clk;

The comment says ENODEV but the check is for ENOENT.

--IEounhn6QKZpmHUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFGygACgkQJNaLcl1U
h9CFDwgAgdDku5RloK/HdWrFHsnV1dR88SSoIr1E6POJoM6yFlgiyFdDhli1tdd4
9HhBCpZJJTeEIgYfblAI+SHDnC/kzKe+XY+WebBfK/uMAUBWA2eGxjr7gn1BTg+K
XeeGy3L2iQ8cCM9fZoUvZg3IjEtIYkn7QB5+zp3o6B8zHIbsh8vAF3lMm9BQ68rz
Vyj6yMkYspCTWxa1qQAYpsqGFPUCUgoX7wmvg3buulc3X/T8lIKnhR6iOo7qtDAN
p1ZfI9oEjs3RUqcfblbuVCcg2yrqXgo+DrCowegrEB9NH0zaRP4ZBcRz+miaLrEP
HvUI/KnBIZNqWWu+ofTg7Se5lk7CLQ==
=lCDt
-----END PGP SIGNATURE-----

--IEounhn6QKZpmHUd--
