Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383A36F40C;
	Thu,  2 Apr 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151553; cv=none; b=JSNgij9lSuV0QAtt/aU7z3EDPDONiX5bUIQkM5ojTluaEAT8AtwB/WUVxLu4pgko1DLQwPPHfklcrqkxiWy337+Taqos5O6g30mnNx4su4//fMZjb2t49xvLuWG7t/Hpih8ejDjmTDsWEJw+3kO1tMIHFJccKVq/5GFlW2R5Quo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151553; c=relaxed/simple;
	bh=EzQy8EPCVRqNiDqJ7Hv5+CNhTsBDfSFBM9cjL0Jb2Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnUwVqDi8TyibEo9eEV9UZg4T3InBottH6eDHPx4t1b63Z+HPeiHJOkTsA6pawXrtZaKN7Qi3LLuD6+4T5VViuOGCM96dVtf746STOzSOZ3wDKJ7GRBY8ox31VQeXjyvJaei9MuaUtK7K7YAFUQp4afA/ySp3gf3PavX+x8mDlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhrFdSYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhrFdSYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48A4C116C6;
	Thu,  2 Apr 2026 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775151553;
	bh=EzQy8EPCVRqNiDqJ7Hv5+CNhTsBDfSFBM9cjL0Jb2Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhrFdSYkWKBxDCwu+Mz0hR/2jRPqdkMAY1sTl2W8WYa26+0+H1r/7wWI4pk/6dBeK
	 Hbcq5t3GUPcQtxRooZu6FJRu35OUU5KOJnSUTq1+tkBH9u4w0Lx3f6EWB8RVeKLKVm
	 PSJD91SBIGDTSn4w8A7nFsGC3HXHXWhaSBSVFV1HKWhgRxLjFSWVN6wpnUBrBKZ67C
	 4f75pWOkhKPZFokJ1gSv5OkSYoq3NyxwGtIn08qbof0QDXPeFyN9oS5+X59WexG+5/
	 gjqI4SQPIfB6V4CE24YW6OOmqyM2LmYM4REiM8N3iVFmzh0wfh0aLQ/8gj2KnOYW7C
	 pMhxWpY1j3g3w==
Date: Thu, 2 Apr 2026 18:39:06 +0100
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
Subject: Re: [PATCh v3 03/14] ASoC: rsnd: Add reset controller support to
 rsnd_mod
Message-ID: <9d1e09af-ca2a-462f-90e0-ce7557f361d0@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-4-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PhON12K5vhntNuUH"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-4-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!


--PhON12K5vhntNuUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 06:24:25PM +0200, John Madieu wrote:

> @@ -196,18 +197,29 @@ int rsnd_mod_init(struct rsnd_priv *priv,

> +	ret = reset_control_deassert(rstc);
> +	if (ret) {
> +		clk_disable_unprepare(clk);
> +		return ret;
> +	}

I'm not seeing a call to reverse this anywhere, I'd expect one on remove
for symmetry and safety.

--PhON12K5vhntNuUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOqboACgkQJNaLcl1U
h9CD+wf+LWOezezNZwtaEeXaavB6dXlfCEymV9yEiiFBKwdlFlrjLK7OXJCyM6Ja
20OeTk0o0meGAxohWl2xh+NcjTctwYLPDDe2THT29Y9Bg0O9xQXvUFSqLzFKm8YC
KWYUUD+zh9BgvXqUfXPD6YSX3TIgvyitxO4a7EcrTcxyNlCYFCBFKiMjxV/Ydd60
IZpd/Bb2l2YgRscthGvyk0QHz5ZY3FwmKlnlrMDJZbPtkHrb2rIozwP4BPUTZALm
yF1wchc6fe2nwdXfjBR8sUj/F2TaOBnFCTdX5L8aOVsQ6SYi9stVU74jUxcsLZx+
fGV30+VjhqJydWNvihmUwDcGbTthDQ==
=y1B+
-----END PGP SIGNATURE-----

--PhON12K5vhntNuUH--
