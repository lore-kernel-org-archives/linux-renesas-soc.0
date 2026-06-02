Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F6360EFF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414194; cv=none; b=koV3FbVsLY+0q8p/D6KZQ8FB6127c50moALdI+zvmz+OC1XfOGT4U/0t8loV+9hARZYBI8aYInxtZr56yDfAtbAHTBVTuwCK2b179PwkDpgdEiaMSgEP20KIjXG/zssm1TcLhHUTB/Zy5X+a3xCBaDlQWMi/dGTvRc4+w3TkBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414194; c=relaxed/simple;
	bh=BmaogNle+gIaeUNsW/TU42ucQpsv6uqwwdUr1XI9n60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XW4PzF4P+mMoA/gy+x3o6C5JR+fdpl/CqKxGVtKwYA6hXUWM1ToobHur1ZgfjENdOryAiaeWSUJGowgJfKTSvll8p3Ytx4qlpzNl2GkBICzEdCdx83Yulz+GLme0XFKI+6q50DH1fTQ7oWBKW3XyvwtKgrDNa9+Adn9XSDPc+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GNK8sP38; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GNK8sP38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pX+x
	PppqzP5D0Fb2dTDQLPJYTfhqUhRGodlzwIoZNlY=; b=GNK8sP38od1Ssfcq4v1n
	CuZpazrAo2xaYTaNrvZOkn3ZdjcX0ImAzELKj5nRHkHCcop1GxraVO1SurgyAPyT
	ZWgOoKCApVeytGVgk1o77XwswBB6nsYAG8aCLtJgFGT2KjIhxXkelCJSm36b/W3T
	9anpMfVhuQfIvl4jXnOrtun/ijwYV/CNbxPz4J5lN7ec/ouLrvS2a5YuSWf772W+
	6I4ttEO4XPXmusnB+a/dpa/ur98gL03+O6TUqanhCFMLo+Qi1hRzqb8heK8KgBY0
	+24jmCQL/dfdonA8DJ3Alfo6I4P7+kn0tAWDBnyMuhbIfR3UCMHGktOvxdiIOApS
	XQ==
Received: (qmail 2942103 invoked from network); 2 Jun 2026 17:29:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 17:29:47 +0200
X-UD-Smtp-Session: l3s3148p1@Yqk1+0ZTwqAujnv7
Date: Tue, 2 Jun 2026 17:29:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: renesas: r8a779g0: add MFIS node
Message-ID: <ah7262yZmtFsx8o6@shikoro>
References: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
 <ah64Y3fuO2ofgsDG@ninjato>
 <CAMuHMdWBfaxdK+Ov7xSVK+TfD0rbrOwVg-a_+mMHhU9wfE5_7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ICYZizeKSCSaMhx6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWBfaxdK+Ov7xSVK+TfD0rbrOwVg-a_+mMHhU9wfE5_7g@mail.gmail.com>


--ICYZizeKSCSaMhx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> However, according to attachment R-CarV4H_UM_018_AXI-bus_D_r1p30.xlsx,
> MFI14 applies to MFIS H'E626_E000 - H'E626_FFFF, thus covers 8 KiB,
> i.e. double of the other regions.

Thank you for pointing me to that document! I did look for the size of
the memory area but could not find it.

> > Can change if you want...
>=20
> Yes please.

Will change it.

Happy hacking,

   Wolfram


--ICYZizeKSCSaMhx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoe9ucACgkQFA3kzBSg
KbbSkBAAoYtiOFGifE35KhXjpsIBUo5tiysiYu7zGim54NaC3rbl0im7uhSeLokA
p5MlNLAZDra+wFfXTvBr1jEJlnfLsB0oh4oImB4dkQPDyeWHibxOQoS7zYjknGaf
Kcao50F+jrV4NFgnv8UpcXzPgP61hMBugRLicCCBUmya0Rwp46gUvw1tq84GJf9S
iLsaRuGfdp7t96T9W8t5FwQuDn9kAGusOke8QJhqjDaxLugxMVHKVunl4dV7fWny
7sbpbuPGyFNPPk4q53bV4F+o6xUItfdpmaaenMXXnxJhNyGZSPAANlJ9/v4pO4KI
pOq5Fvj8gPq+BYQEfO9Dp5bujFc1lwIYnDdTslNnDpWSmv4ukOyPui0znW0lj155
+mdG8tZl4lL2ErXEr5feH24CofSHWZzDnhiyhisfyM/1bK7reBDkjO1ZP3aSqGh3
kS4I1BMdyisf3G63OZ8U6n09uDrzDL/a5f4FCZ4kERicrv3EpN05rg/DOKcgcigK
qWt6yqWhru+wOZDPxqGNeQVrpGIVVz5EJVnafF5Nvvz+ZzM8/TZbFyb4vw/VHe5y
14F0sjAH4a7F5zlVeIWt7UJtevawBo2I/Ak9gwRtVgQZG7gD4i12Z2q/PgEEqnR/
Ro43f+qvm2Jbd2tBJkpGko/2EpPJxEI7RwOojPX8IyXjewTwUJg=
=Im2W
-----END PGP SIGNATURE-----

--ICYZizeKSCSaMhx6--
