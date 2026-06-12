Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38639E197
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289771; cv=none; b=W8ShjCfqevW2CLoNl/JLsvf1faeJRp2DZ4f9HFwzORj1FdvJJPFqMs0jQbdh8C+7zXpNQ8zEgY+94RrZ12PnuDVgDX3rKisQUU5bY74lddKUfycjd+scsO9bF8lKQhQo0nSjqSiNpnB9RYHGYP42QTJh1h97KgM5HNC53A2q87Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289771; c=relaxed/simple;
	bh=6zBMoAfETzqoJB7EZLIoHa4utS3LVBdTvwCzt6hhs6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d78a5IsUyCtATvcX1EquQIHbv01WT3Z8eTZVKS3OhISJEaqruK/bddiNlmqOniiFmm/ovYOgWs+JMVM4jOYDYqi63GyTt5fUXBSVjRylQROHdC+y6tuM45xVR9fHNGbMxmQYSzXffSW86c/G21yN6a8frEHOtid69BzyDy0SobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gixPF1MU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gixPF1MU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0fzq
	pum4tGCK94V92sX8WXhbsvBRITtuR8sbQdpTqMo=; b=gixPF1MUbfMaYvUl7QX8
	6GLTpsB5tiKcADZB0kRhK7RvJilrXupcu7u3LjDdyFbCJZTQ+8T8Cm5BhJJoIxkb
	Xv4d1mF5XkpRfy7u4iY1iXBnVPUMD/zXAefZi33n22AeuxoDFJHTAMfhuwuod5pH
	vGIdMfHjTaLPIhxzKKDZ6SURAt+DK+PYMORmg5ii422CgRT8zqFokgHLhie+nf0l
	+Nx6gzxID+Z1TvNmVD0GA77mni17Llw+npJSyFjsKDHfSzgaTPTXEJQP5iqtotaW
	80b0AbUop65XYGbTgkllQ9U5FV7G01qWOI2ZPZi/NJu22juJ0DYxaWJLfLjKD4B9
	tA==
Received: (qmail 2624270 invoked from network); 12 Jun 2026 20:42:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 20:42:44 +0200
X-UD-Smtp-Session: l3s3148p1@9E6o1xJURL0ujnsK
Date: Fri, 12 Jun 2026 20:42:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable
 SPI-FRAM
Message-ID: <aixTJEh-A4WeL4fJ@ninjato>
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
 <20260612080354.57459-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RgSO7OGNoDorQxMy"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>


--RgSO7OGNoDorQxMy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thank you for the reviews!

> > +&spi1 {
> > +       pinctrl-0 =3D <&pins_spi1>;
> > +       pinctrl-names =3D "default";
>=20
> Please document that this depends on SW2-4 being OFF.

Hmmm, this is a bit weird. SW2-4 does only do the routing to the SPI5
(target) controller connector. SPI1 is totally independent of that. I
can read out the FRAM with 2-4 being ON. Dunno how well that behaves in
parallel with RMII2 ;) Shall I still do the comment?

> > +       cs-gpios =3D <&gpio2a 31 GPIO_ACTIVE_LOW>;
>=20
> It doesn't work with hardware chip-select?

I couldn't get it to work and I know other people also use cs-gpios on
their custom boards.

> > +       fram: fram@0 {
> > +               compatible =3D "cypress,fm25", "atmel,at25";
> > +               reg =3D <0>;
> > +               spi-max-frequency =3D <12500000>;
>=20
> The actual FRAM part seems to support 40 MHz, but that may
> be limited by the board wiring.

So, what do we do? In my tests, 40MHz did not work. Up to 30MHz it seems
to work. However, all of the BSP DTS snippets say RZ/N1 can only do up
to 12.5MHz. I don't have an errata documenting this nor could I find
another source. I would still rather play safe here. I could add a
comment, though.

Happy hacking,

   Wolfram


--RgSO7OGNoDorQxMy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmosUyAACgkQFA3kzBSg
KbYANQ//T1OTHlp8Fe1hQZD/6UShCS77vR0zstyCGqvIkaenmb3bK98371NOC53J
CC17WYxzevJOZqblfUgm94P7hQ7roPN7+3QOurupSE9nzZbAKNex/5fT2MmTAWzF
nK9cVsUWGyhXMvTWGcRsrkQdIPPbALG6Hi0MgG6PARQLJWc5A2W/E72ogmNt7PGz
mcAsqSQjxkW5Ttqwf7k2rQ/NvOwG+OpReeJUJ86BW6rT97PRZG13jh0UrxVUN8/a
y+pmbJu3FI7qJINq0Tj97I3Zh7eDrP4U3f9rEpqQUBPWPi5/wtUqUxNSuP47qR2v
f5eJhLtMMyvjhRT4/hApzwOjVWlpu7+t92x6Ncc9i7h2dGlfZSgHXB/ReB/ecEJ5
5x/bQ7Hh16URjH5D2QX8yzOGzbepaSHsv6FuW1KlX++eTqcixTKcjfcHupKxKa6l
fz9zg6s51QvOSbRzeQSScrGlSvFMlB5QG9JTHYeikawxtRxG5UG0y57ldv7EeZBY
K6+mNpGeIrbywTTCw+u6wAIj6goeuOQ/ubfqNX0s96niXY0+h6kpo6mYClQmieqN
a8Z6st11dmdzpGV0CeBizOgb05CMU6rsFjhzj2SC05Do56WVxwqHrl1w85BYDjIM
IePSsjN58ynmpPwkCLhOi7DoueBh34FGmTFQ7fB2Fm5TTWDGjdQ=
=Vkmq
-----END PGP SIGNATURE-----

--RgSO7OGNoDorQxMy--
