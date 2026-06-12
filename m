Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0A39891D;
	Fri, 12 Jun 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279130; cv=none; b=X6UHE4QynUw3zf2VLR591FjyaGV4C2G9D3BseM8iqOor+8F7A5KvotI388fOHNi+p3cmuuOlA1qAdE/xB6/eIRaJW55JUguDBUjg+ir9JhwePpusP9N/+XLMzY91kouyK9lFzs37I9PlH0KOUzSz+BiYYK/nmlQfA7BRRUi045Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279130; c=relaxed/simple;
	bh=nssTccH/fom4WxtJhBNQyeipR0ibvOC5NoS4H7s0qZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfzXlMxkdMgPgu1EQ7ACX+QhzvRm/TxIdRINmphDAIAB5aeU+dpKHlVvVIh6UL02BBfLuY2UaeH70tjqrwjF3xe5W5ALEFcaCO1H62IZF1ejOzqGAi+tZ9/7TE1WK4FJgZXadO8z/DpveupkHHig+IMsvOkraiEp4S/Pk3KNRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi2zcq2u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi2zcq2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70881F00A3A;
	Fri, 12 Jun 2026 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279129;
	bh=yksJgZT1TIIqAj+SwsimufQX/7BGhemntFDwwyJfiVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qi2zcq2uapaQitk//jYJWR4MfBAvvIusIGAWr1pjDA2uoRmRwy4sJJZtxEejWAw0q
	 1PlzVmCOYHZ8icQCWusRsZy7ZHPtI24ufJsIsRxcZozjD2cPi+ymZAWCVV7F+OqYkN
	 O2xYUN67Y4Y72f9M0kNnatGM9/oBFjLrmKrJg5tCiuUS4ppnTPF2/sd0M9E9i6eTyu
	 iqH1cH+fpyBoR1ZnO4K7ZNNcP6+6uA7iercyB6NGrhNh7xoRlbbf5Am3SeE/SqoC0A
	 voo57Owtkvyyh9GONlRW0HT+DhGjv0ZaVcgzuUhjjpIfI0BhP/WBb9qADsledAhmYD
	 IUQhZBkE1WxSA==
Date: Fri, 12 Jun 2026 16:45:25 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
Message-ID: <20260612-unmanned-lankiness-3d48b43f4bfd@spud>
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
 <178127350175.916476.16317522760209240659.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T1We9rblDBdisqj3"
Content-Disposition: inline
In-Reply-To: <178127350175.916476.16317522760209240659.robh@kernel.org>


--T1We9rblDBdisqj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 09:11:42AM -0500, Rob Herring (Arm) wrote:
>=20
> On Wed, 10 Jun 2026 17:29:20 +0200, Geert Uytterhoeven wrote:
> > On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> > Controller is located in a controllable power area.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This fixes "make dtbs_check":
> >=20
> >     arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: cache-contro=
ller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the =
regexes: '^pinctrl-[0-9]+$'
> > 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
> >     arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f01000=
00 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
> > 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
> > ---
> >  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
>=20
> Applied, thanks!

Thanks Rob, was at an awkward time for me and would've probably sat til
rc1.

--T1We9rblDBdisqj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiwplQAKCRB4tDGHoIJi
0p2vAQDbkVb43B8FyxcRpYlkxaEtWJo8tOl2iytGMKCtRrdLcgEAzmSlrTs0apxM
XyTOs0uAWpgY5L5WEw41TLOF6W6Ekw8=
=KpFr
-----END PGP SIGNATURE-----

--T1We9rblDBdisqj3--
