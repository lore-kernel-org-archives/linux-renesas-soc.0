Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E065371868;
	Thu,  2 Apr 2026 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153095; cv=none; b=Evyfjev7ngD9fVzmAit10KcW/fSX+VK24CYNpjmpBv7uQD2S/aLs1UGA84e91OzqhFYKiVFEsXGDZLW/k4yQSaBSV3lEgV6Mk8JHtTTDwYeWa3v+iMD6W8Z1S24XlhX25kIiRWA7ybJUfBXHFK+cb0mJwl2FWmxec/PojDPaWm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153095; c=relaxed/simple;
	bh=JvwAfFUGdFTpRGEEd+8lioWk8QwjLO7dbiWhcVUbZU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOH84SV8oxCxl71KEVLpdAksM3xsZdJMlD+xDb+Qm2uC0HkivoiXIoD60ObLLydidt/kv7PEtbSPbIxjr7eWgLaDePjUl4v0IwqtOPxszC+b8UpnCR3tMFzSgN7p78YKLFyEUrIbKcXm7KyntM8zbCFLXqjiVVVLXdBq6Q7od3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clKEwWZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clKEwWZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB20C19424;
	Thu,  2 Apr 2026 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775153095;
	bh=JvwAfFUGdFTpRGEEd+8lioWk8QwjLO7dbiWhcVUbZU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clKEwWZcLzIbSFh6aja3G7V8AT8Z4O3ygPu0zjjqZIsXKa/k4TViOT6HH5GdLYT54
	 i4XSP7eQlZvYKH0seaKSY6HLMd7juRrsSTnCwdyiRUryqXl4WOptnerNCLL7tFAgwD
	 nPLVZ0fZvqjTMtNuiOxw7S9DcjaXYvGAncgrm8YEY8y0+n55RelJ9remCl7g8cGUd8
	 1UyyLiGnKlvvF5bkFbI0NP3Bfb9gwGaIIEwKBxdSA4bzuO6Wy1MSygO6hKpj6dI18v
	 L/q5ogJGeruyfjD/OmEt2xcu+2AWqwT5PXm9GvVt910j414VIHe+H73nAldBHVnWZR
	 ioEslRDcu1btw==
Date: Thu, 2 Apr 2026 19:04:48 +0100
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
Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Message-ID: <5098f90c-bdb6-4922-b5d5-3794ebc56ee6@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dE48ky0+VmVyCpTu"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!


--dE48ky0+VmVyCpTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 06:24:33PM +0200, John Madieu wrote:

> @@ -526,6 +527,12 @@ static int rsnd_src_init(struct rsnd_mod *mod,
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D clk_prepare_enable(priv->clk_scu_supply);
> +	if (ret) {
> +		dev_err(dev, "Cannot enable scu_supply_clk\n");
> +		return ret;
> +	}
> +
>  	rsnd_src_activation(mod);
> =20
>  	rsnd_src_init_convert_rate(io, mod);

Shouldn't this have some handling like the adg does for splitting
prepare and enable for the same reasons?

--dE48ky0+VmVyCpTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOr78ACgkQJNaLcl1U
h9Bvtgf/QEBXgMsBbAklJErO3U66DqXH0HVqhyihYynL5/v4ckwbB2FcQwR9yyzL
mGEFQBcUSC+G7mTfNDtlpX5cjkQCHV+RnQIjYOejPj9u/M/JiKqLz7re0nggH62R
5z2jDHsp+5azcA2kp8R6ka7VYe4izl9hrVCQX5w7c1VVdKcqJ37+XCcjGP9mRN/k
4MxUXDQRqAqKqgje3mt/8YZGr2J0g4LwXQtCPQN87WRdTm5ESD0uo9pcZ3oBmevd
t6Z1fOt90eVrfEpUPBmD/kLQgCNPf6uL34xO9Kn/4Fgo563qTMHfzazMyaoKWEp5
FUkRyOUA8ODvY9ePPZ2cvaOAkuxqLw==
=brm1
-----END PGP SIGNATURE-----

--dE48ky0+VmVyCpTu--
