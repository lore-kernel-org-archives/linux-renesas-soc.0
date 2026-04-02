Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1735B62A;
	Thu,  2 Apr 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152448; cv=none; b=LL9mlQuxrMWtxVQ8s9T6vz24kksjjyyOi7qJ1HfrxfwVrFClbBXgAg0qnBmcxokXg/H3dc6IwKTKY1moi24czPPT1xgQ8nKNeXTdumwUbkmrMPPzyCfikzd2k6zGczl7PRK5+0q6Cg7/qCJDF/5eWNK5vyn9f23fx041ROn9+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152448; c=relaxed/simple;
	bh=dmJ59pZVLb0Ur9kftgDuASKnBVn3c5SMgVl8DRv64HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roHoN+6FXzrW9On6SIangWr00vlxekV+7Io7yV8aCla4N0Sx7xQyVlCzKG6cTjY1EoG8U8kvwp2WDoLfRa90uOt60NuGHm1D4gc72+tbtmdOCRXB0LshHK5yWXHw3bGlidHmcptY1UpqG/OwLxzF5EQHJbYf/ZnkWQZntVWQlkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txjrlud7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txjrlud7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B68FC116C6;
	Thu,  2 Apr 2026 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775152447;
	bh=dmJ59pZVLb0Ur9kftgDuASKnBVn3c5SMgVl8DRv64HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txjrlud7rD2TmLB/M9dW7lm8e3bpCWbLTLsTiHZGkSygUS5cwcvfAAQg5P5c+wz0x
	 uJsnZwtKV72MunCXIdq6bh0w9Rz+B/i0fwLHUNH516KscBjiF5cVK44IrmgXUnKRnp
	 sO21oL54gU4JZqJbvqlm7qCoGeoZvUxAqbJ6r/a3zbGr+jAUixNtMlfZf3tHJ/P2vl
	 IHn8635rtVDo1ETxN9QWEsdc1mKrACFaMAgU5c0nCUz40zLM+CnQP1qo9RQ+SPtcMV
	 Mi6PSgl0bYqQOgxUvNTKGhK8Fs4DMDHW9ck1ZpOqx1GDhEXw4bDppb9jm2RTphe3V3
	 qjrPhpkK8tfOw==
Date: Thu, 2 Apr 2026 18:54:01 +0100
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
Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Message-ID: <a457c427-95bf-43be-84db-02144fcc2bd6@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tgKlAXBGowSORo2g"
Content-Disposition: inline
In-Reply-To: <20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
X-Cookie: <doogie> dpkg has bugs?  no way!


--tgKlAXBGowSORo2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 06:24:29PM +0200, John Madieu wrote:

> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:

>  bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
>  {
> +	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);

There's a priv already in the if (status) check in the loop in this
function.

> @@ -160,7 +161,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
>  	/*
>  	 * SSI_MODE0
>  	 */
> -	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
> +	if (!rsnd_is_rzg3e(priv))
> +		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);

Perhaps should be a capability flag like the changelog said?

> +	/* Acquire shared reset once for all SSIU modules */
> +	rstc = devm_reset_control_get_optional_shared(dev, "ssi-all");
> +	if (IS_ERR(rstc))
> +		rstc = NULL;

This just ignores actual errors, including -EPROBE_DEFER.  I would
expect us to report all errors as normal, the reset API will already
return NULL for genuinely absent resets.

--tgKlAXBGowSORo2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOrTkACgkQJNaLcl1U
h9CIEgf/dI3uVhqNpvWAF3/DBBuZKOwx3XGnjtumg+VGV8R4D8gBbH/cIoPFtE/n
MhZzayS/eyn0fCOBTIu/kvsEZExy8KyNhJ693tx9N4DxfLaFefsz1anTgNfaWsC8
9+27txuWXcTahvxOIwT9WdR6CbkpI/mYxs89uj3qxJdLS2r+xkxy0IPrdroW/ICD
pgC28ho5WTm32FdYlCjLaRXsCzLln5QlUN/8NDsylMiedLgVu6VcErvtXUcDlsxY
/gfrr8FZUdup0sM04Xv6Rao5gV2H9oxnCYC6Pc/NnTlxnSaRTfTQjTvapwdbOf3E
RITdwGlD3LWChHaJZVdHOYkKyfbEzQ==
=TWCL
-----END PGP SIGNATURE-----

--tgKlAXBGowSORo2g--
