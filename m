Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313DB3CF69B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869649; cv=none; b=i45ACmw5nOaOlBIUzAtZGJ5M1BDMmaRVFzyVKGXcDZHeVSEwK4tTiWrRogbdsZ7dy16wlTZuOnTvxg1n6/RKeR66GvOxVQDetiYuBR9tzcQag5WcejpOJLCl2y3ep1vkdFT16S7XImPS5WnsBtxtdH6A2C4uh2GYNiqsOHBYnMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869649; c=relaxed/simple;
	bh=LpZinqaxRBgapJHrDySRzd7UgsiHFapmnqcwd2PgiBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6si51+AV1r5ZbzGapovcj1dFabwJ4Xcc+EGxkgUe49cbV2D2HRi6ZS6o3hbViOEE7t41YRFK+/VFmi4kkILDl52P/koEtdNHCNUy/iiOhDfQY/+xi7mmUywY9WdJcCQ+dX42v7IJGEwybYfN1aVD/UULOWwnAQTU0eHBVvqn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NojF0/IL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NojF0/IL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Olu1
	Pa/qJFrNawTP+d273Gft+z8FMKh5wec3w+tn3U8=; b=NojF0/ILPi6fVKb/vbp6
	zWhDIwuSq2ds9Kd3VKfUzD9BxDY2XqoJu+kPxJIxqU9uX/urkBHAvf8fb5zwwLfG
	d8kb55XLCqpNKezbxHsKStUhdAy6cT9GaQrRGF394Kf6dOjRgWxlEpCm9uYbAMut
	wrI2tmh2U9DcbU0h5iR2BOi00c0GF9OV2ybv0A5m4Jfdp4hhBnQkC6jpT4CS8RhL
	oesP0f5BqXAGofmNJEZEgdxP+N0asIH0BpOJ/M0RJh6BfEH8B3EbEQQtZx6NAz0Z
	EhEn25EFCorQmqeZAQ4SPNnIdbLmPAzyV8eo9Yk3XhZKz8iJwCdneJ3ZEdQpZPny
	bg==
Received: (qmail 566481 invoked from network); 27 May 2026 10:14:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 May 2026 10:14:02 +0200
X-UD-Smtp-Session: l3s3148p1@MpC4MchS9rFtKDBr
Date: Wed, 27 May 2026 10:14:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use
 SCMI
Message-ID: <ahanyVCJoqk9Hl8x@shikoro>
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
 <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z35F0N8OyaZ4TlDh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>


--z35F0N8OyaZ4TlDh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

we are missing you here! :)

> > +                       scmi_clk: protocol@14 {
> > +                               reg =3D <0x14>;
> > +                               #clock-cells =3D <1>;
> > +                       };
>=20
> I am a bit reluctant to apply this patch: with all current firmware
> versions, the system will lock up after "clk: Disabling unused clocks",
> unless "clk_ignore_unused" is used, or unless out-of-tree SCMI
> quirk handling patches are applied.

Yeah, I understand. Maybe we leave out only the scmi_clk hunk and
send it separately once it works upstream?

All the best,

   Wolfram


--z35F0N8OyaZ4TlDh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoWp8QACgkQFA3kzBSg
KbYTHA/+IDgRW3Dn9MHZd3V2Y1k0X0Rj4PMzFbmWvb5I+8gpcyhCyTwQVBstgo9+
dpo8dPlFs+ut7krQ9sPYd9+zakrVxT+v/k5tSrYFcK1v09TiP54ROP+E0SBQKnw6
aCASY895psarfDe4OYy8L83XGh2iL0oKdWL0vNU2te7WikSrjWs7QZH3iEDSjyUx
uSkPo8AsLT1RU87i0sRfYODpW4Uvl9gM/eqbXpA9tA0oXEHrsUdunwM/VaOFDPv8
Tlx0nKP/vPLDA8McLC69SRj/mVts3uK028wiZjXr7uEcjv+/EP8UDxX+R1vqA8HD
OD3w7PcFURqvVuox153QaxKePPW7QExLMCf6l9Hlv5PcGvaX2DFmY2AZPK8hqQjv
ppSfXn1e4jxCFPbR+SWPmw5rj74aJGFTiqBqn7cSO/DTDTJ5oKsREecE0QEtxTXd
Kssf/D+aO5bhUTkKAunLjrPG76KBE8weeUwTc0MVnVwOHdr+hZ632S2Ht9Rh6JK1
HoDVQzTQD39qIb+RaYZY71358sAHQeB+xZVaq1ieM1w6MyWOEzgsi6FTHeIuIjVj
L0Ci4dTU7qHnFkrWKEDQ+6TTHuh7m19+/LsPUvsfcBIdKy+8G9miZ5fhV1Wl64iS
B2AyoYDgvF/paPXF3zNkOuaNMbASurNr6ok1ZN1TyNRtYQR8vPQ=
=suCz
-----END PGP SIGNATURE-----

--z35F0N8OyaZ4TlDh--
