Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED120DD51
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875453; cv=none; b=Beh9H4uOuJmlYWvO1kyN5BVzFZ/6luqmiiKHxZq0PATKBKtuXeyOe49R4gGISgYTL+iIJNfO0VmuqmjgLOiqdDJO3C2ZdGb1QcPIQ3BC5Bc8k3aSa/2dZWDH6Bu8sEzRV1mCD4FLkbnrPF1odqeSoURF9kyBInJwatiwAok61Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875453; c=relaxed/simple;
	bh=I/KROJ6W1p3ukcHx9q7nR+jw1dZYN3XjY8PzDF93NpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iguLly5P+xulcN8lek7n8Strrg8TRXvM4rVPA0wl2gKR79RTwGAG9e9qTuExQ4tUVr0/SzSslrQsT3ZgKWQkW96Q2YCuoXt6QHWRWhKzvd83VWukfNd2ppPcZGrqakoT5RnIbzw87IylC+d2X1aHiU9f2SrPTaGvtmwBkWwhBO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Knf5FeeO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Knf5FeeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xbF3
	O0GLiwFRICGBmn1o8JilNeiutX/EuZsrLXHxG8U=; b=Knf5FeeO/15X6M4LuAAb
	goyYPuA4gv55ZTsLXln/MfuEI3gHEfyR4FUW3RM+m0oP6L6BOHsSVC6+yIQH7PU0
	b1HUeAP/P82quo27q2YW9W/jpq4aUM3Lp2odK1zeCy6b6DI8F9+9/31F4G9RjvoG
	oNk65ig11EGkxfuaiXDe8eTr/yu/MY5FEkj77xpQe9sDMkS7dN+f9GD+2kLZq+Xi
	/UZZwF5B0Mzwllprax0i2zweJ0wQSlRXbDsKkeZdKRI9wAW6c+2VarLGQXYoA3nL
	hMNx5RaVi1//9HO3cSI8vvoAzstz2xT2fV8JNgq1dB3byNU2lIYDep2WIZMamEKt
	8A==
Received: (qmail 3520160 invoked from network); 4 Aug 2026 22:30:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2026 22:30:48 +0200
X-UD-Smtp-Session: l3s3148p1@DpWthz5YYqEujnsQ
Date: Tue, 4 Aug 2026 22:30:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Message-ID: <anJL96XqyzlQVb9d@ninjato>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pV0yin9mZAw4oQrG"
Content-Disposition: inline
In-Reply-To: <20260721082952.215691-3-herve.codina@bootlin.com>


--pV0yin9mZAw4oQrG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:29:48AM +0200, Herve Codina (Schneider Electric)=
 wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>=20
> This controller handles 8 timers:
>   - 6 16-bit timers
>   - 2 32-bit timers
>=20
> Each timer has its own interrupt, its own prescaler that can be used to
> divide the clock by 25 and all of them can work in either one-shot or
> periodic mode.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Dunno how much this helps, but I successfully ran 'inconsistency-check',
'nanosleep', and 'clocksource-switch' from the kernel selftest on my N1D
board.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--pV0yin9mZAw4oQrG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpyS/MACgkQFA3kzBSg
KbYG7Q/9GR7b28yQC0ny+ZFY3WtMlhWKPoOvjOFZ5GjiCbaNgc4fYoDmEXpgaLya
3vX5Z7/F5okVIlk5VqsvzIood8yL1Jo6baOZlW5YZVt5WtVLeW7pnmxAEvgrKBiM
p55UX1qDXPaLpVux4jT5GWEwgrcJTKgEm+ry/Ami4DRg+i3Aah2gn7Nj67Zu1c2Z
JVGtcBZwLEBRj6Tunr+62fDXpSKgtefGWGbIMA8o7kfeIvdjz/oaAcrx0/eNB1wN
jnf8ob7HuzWq1qHVAUhUufNU6qLpYU5miCop2saTIeA1L7/mkh68OIZk+RJ/2m2T
MTOP9xbKkM3Inpq8YfL0KRMCZs6KidghbmAypccrAKKZj/BXAKtASm0nRsot+V1V
IDgeqTtGmGcK3ovwlWE5Z86IboOFbOUxJJcfLhFLJ1Sg9Hjnmbr+wJ0+e3eJr7ZA
kEXrI2JZXAdzwKiHsNHc4aF3opfK11EYO2WeKIpN26SnfGXZyyp0nYtteQZEKKVf
DUkpUWmXD5BEQjmciCSCy1cAz/YhWbdTiDItE7v8w0wyYfiaFnhh5gKr6aP6sWE0
wDN4xbabh8rPv3ucJSme/DtnecrBKs/5smDWm2LnNLUgw4p3mUe4CNTl0KnOUW91
h2lYwiGp1yxLtwvwVJtATrbwB2VzV2VBDC56sBTjq3/Fvi1mV+8=
=03fo
-----END PGP SIGNATURE-----

--pV0yin9mZAw4oQrG--
