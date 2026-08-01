Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E329408;
	Sat,  1 Aug 2026 00:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542852; cv=none; b=XC9iTLZCDLf4sQ8qmeppLfCowaiOGuQZdSpbBjH/t2di3xXG3u0J08gGiijrIyUBVW4MmwFrMgj5ZgyjVwc3G3xnPP+mGuEYHFVOsCjmc3tuvImlUn1rfcUeVaVzNAXrlpLglj/Us8ZCgIo6kCVOPFmybISgWOSkRVlBHOZZk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542852; c=relaxed/simple;
	bh=dtBLcvebt7+AMSIrmX/C9+e1pmg8hKfA+BeXh0Esni4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McSpXpL0ZQSGygib77E/azGdsYBLw6WzmZ1zkHLXwDKU/YIZP1isk6ueXYs+pYbDaSBOQgTRE0nwwwZLYWeVZsQEsAbFKqcy86Pm0TtZYZTR+Dm39enNXTGlgk0Kt2OU9nXCvrdvwTCie9Xl8I46nbdLe+j+90VD7OeOxWVsOyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaddJwsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaddJwsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F221F00AC4;
	Sat,  1 Aug 2026 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785542851;
	bh=dtBLcvebt7+AMSIrmX/C9+e1pmg8hKfA+BeXh0Esni4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NaddJwsaCaNclRKwsA5xHHSv0rJWpcI2XL+fqA+hCwfgFUPD+zrv03rDkjULv6e0x
	 GJ3pWWcJ8RcUpOucX1MJqQhSyK5/WbWQme4PeyruF4TM7PvZkUkmsQAJxBFXr9lDEi
	 jT0lb9d5VD3H3Hl4GjOHLOngklqN5llAF1bWlRCoZyuK4hDexdCB8w0w56Y74IVUCe
	 /iymo465PYFgzpHycDzQ78ZS4C3ZDzCn5V7OFNibzYqaseESsbQiRLZCOYaJmhoAFD
	 8g8wFcUN9IjxgbBx5udbggo1IRXcNH1J0wd/uMQKKSRzgl03so2DTZ4pYts/xMdHLk
	 NeopselyNGl6w==
Date: Sat, 1 Aug 2026 01:07:26 +0100
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
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
Message-ID: <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kun40GI+jRDZGgy7"
Content-Disposition: inline
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
X-Cookie: No shirt, no shoes, no service.


--kun40GI+jRDZGgy7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 08:30:56AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Hi all,
>=20
> The FSI on r8a7740 requires the SPU clock to be enabled before accessing
> its internal registers. Without it, register accesses may hang the system
> even when the FSI functional clock is enabled.

This doesn't apply against current code, please check and resend.

--kun40GI+jRDZGgy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptOL0ACgkQJNaLcl1U
h9D9Bgf+LSzbL0bMrGV4kHVEn7DlDlKRGVm+E99HOeaOP8wfSRd1NLvgG84P+wca
WDR7Bu5czBeeos2M1XTOOVmhOZ0J58umVudaPLH+XsdHymE7nDVlIfJ9s1GQlKxg
RTY61Yzc1oVGKDtrbn7+wKYFhUIMcysqMk1CIdtM/pneu+mJRDDzBpgua/mAp0+5
3jRpRiesXcWBtE9sPik6vZvFzXsHBeO93CsWs/w5G20bWDuI2n/pmlDKVBcGO7Sx
mIgl2knudaJI6EytkurgUq2lk/9MvzYl7gSCKipoJwUHi/KRbu3O1qBXal5s0CFs
l1bwfytVWUVxEb8x7E94/N6FcVYRxw==
=Do9N
-----END PGP SIGNATURE-----

--kun40GI+jRDZGgy7--
