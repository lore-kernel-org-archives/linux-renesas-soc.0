Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF6E314B73;
	Thu,  2 Apr 2026 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153166; cv=none; b=QzUK8u8saz4QqAOdFGv4U7eePZNwC+6altbj1hSZIPoIauVnTV9aTwfpY+bosnKEkdygBoIl42QU+FtmyQMytfEK3W9AkYPuvBxjqaiPWl3T85knbGmjAQ8aSFXga17D7+eJtJL3xNS2O7jPw4MVGavE9lkS86If/wjQfA38aeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153166; c=relaxed/simple;
	bh=XCgdGtbDgPaz5ekMvHhzcoZtcU1FPY2XHur4qRthusw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5DCkE4NjQbVGb4Q61DCtByQOEDcCXHrkWLGWySyK5PreN2pEByQGDFUKSiyl80L1p/KZo4l42Ppt6Y+ES4DqhG/uAJRnAEfvFnqETrK5gdcjETmICuNJge3zj+0UE/45Ci5o9CYllZf7r0ImvDKfBZ12uS1jlyAholXkgPFOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKSU+7Yt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKSU+7Yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804DDC116C6;
	Thu,  2 Apr 2026 18:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775153165;
	bh=XCgdGtbDgPaz5ekMvHhzcoZtcU1FPY2XHur4qRthusw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKSU+7YtB1HlhFI+Kos7P3nlvjjCplFbtbN+HFo4Kfi4+sNtg+DvKHloy2/3hSir8
	 PPPjzs/xY8clgU25TsKv2cHMYM4ZZKdWcaW/Jx1o7IhCOHp8VWYg/toae3yif+edpb
	 kRoLZnWWa8XQuasYm3b1KN6rYBBEcx5+b/8GcTHC5qxKRK+BAyiUUMCIvWWxzgB6C7
	 UjSMV5xc/eCEZJ5U8MdLsgTjDlq/Z0CUXNwe1t+UHeviLARvXdhTKZmvcmNnhiGLYC
	 iJODIDN5m3d0VjUG0TX760NlOhoFPXki0VM6y4fxP36GiRQ4l3s/zZvIYaZRY6VZPX
	 ZiBUJ+fRmLPVA==
Date: Thu, 2 Apr 2026 19:05:59 +0100
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
Subject: Re: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
 supply clock management
Message-ID: <812b7823-7891-4f99-a4e9-07f52849b1db@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0sgCe44CFDWOV2jb"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!


--0sgCe44CFDWOV2jb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 06:24:32PM +0200, John Madieu wrote:

> =20
> +/*
> + * RZ/G3E: Prepare SSI clocks - call from hw_params (can sleep)
> + */
> +int rsnd_adg_ssi_clk_prepare(struct rsnd_mod *ssi_mod)
> +{

> +	ret =3D clk_prepare(adg->clk_adg_ssi[id]);

One other issue here: hw_params() can be called multiple times without
starting a stream, this might lead to leaks of clk_prepare().

--0sgCe44CFDWOV2jb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOsAcACgkQJNaLcl1U
h9A8Kgf3cC6/loxKOKsiyaCXRI1Yo/thPLcRq1pCaXJuuFhpsHPg4wHZRWuIIks6
uG0Qn44xCBrobYUyUuZJ83Jrapmb6WeaBhbVPkCmqPQhQ4PVHMpO3ur3h6AeH0uj
DvEsOeuT9E6au8BVGPXDjHJxA71aJ4fQa0XX6/xpk6hQg3PWRyzcgMDa8OMKP2B9
unwZOhP8l+CpMsDKSwk2bKxpg/nnVv5DoDlRRMRSezVGcod4p+Rl3hGsQcr9th54
3lCUAig7/g59wq/IHJGh9tZSGbzrTVw3X4oBxSalZzYcd8ov8UvI3oUGxsy20hC/
7kN4Uu427qW+FTcaq4qZ8wzH321D
=Nhxm
-----END PGP SIGNATURE-----

--0sgCe44CFDWOV2jb--
