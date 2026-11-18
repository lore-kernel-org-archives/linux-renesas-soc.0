Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997625;
	b=f+8g7wC+AKy0kMKmwpvKkx+fcKMKDNtl6Xo4rFK5Z9UIS4kLQfqUqMITk63i5eW5T1+K
	 g44u9N5l4fCE5zjrGhrpvFOslvifmcSYFRqirYvkErz05J93TpW/J1JdyPFppr1d4arKm
	 qnA2LRznfg7dTCxeyHqGX/QEIDc8u8uBjKCeKpFI63EoZZyoPtTfg0LxWZaoDSNTbJwgN
	 BIHvCqVonNqoKiSlxTL1wQbHAhg9ntqwiatWm/o6BvOGBU5z6Gvqj3eeYuMT1nTAnpCYt
	 M1zo7iW7x8FxOar8Q9Ry8p6JbivAnE/lXIGavzWVhCVKWviRp9tRwzHUaU7Q1zU8itQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997625;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i9D3FjkLfYPSTdei45bQlEx7WvqZqfPDZxNohyDEg1k=;
	b=l/+F6C+em8yTWqLdsKmH+VrPfg0Fr/LDqPjIccGVUsxcsYFjy7y6RldJkzLvHLtAGYrg
	 sLBiJ24ALiHVwHTWzVKYlbw2KkTwMv4nObKX+iTXCr8DN/mdG1buMm8RnGtcyTk8h75xt
	 YNAOcpeBYQg33FtXpmsBWxnKxAQiwGlUgTgsGLz6tMHzEjZPnsbEJbLZNk9WEzxdKg+jE
	 jh+sMudNvZFlfGKt0fkPg+2o7H0sjLOk3nR0K6Ykwp2mf7gtqVifoCEsak0ZEvsYyvuQN
	 dC0f4UuWopLHzvJfhXL5+FFcsZL5uWNcjpan7Z//uyqWY4dQtq9tlImmIH18PCv1goA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=aRTvwNsx;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA3606A320
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 10:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBA3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=aRTvwNsx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i9D3
	FjkLfYPSTdei45bQlEx7WvqZqfPDZxNohyDEg1k=; b=aRTvwNsxNWSIAQKnbg8y
	CREq05UiAMceZGfiRN20p7OOOml+GunXax3jFBwsGP3H85Zs6Bt1HERjMxhA+L0z
	h3fWiLM7ISIHhK+BDsaH977cujSzjLGgqivalts34j59dnQ1rfz01wgv/BaSONgU
	cof2oFyLY72SHwVc5REEFSKCRVGineSB/xYqHL3QLBbRkliwaAKasuMFemxDdu/D
	pd1B2T9TKEmZoRH9GEPohMX8onrO9x6Gnm70HdcfIRlygq7lv3zSDQcmZJdy+1Fz
	+FiBoqIb7mQKGl7wQajfSXqfKefAqXJ1hYH6GNk7ouH0slyVpl+a9HFxbOEPuDzQ
	ZQ==
Received: (qmail 613653 invoked from network); 18 Nov 2026 11:27:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2026 11:27:02 +0100
X-UD-Smtp-Session: l3s3148p1@K7Cjc4pgZsoujnsi
Date: Wed, 18 Nov 2026 11:27:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Message-ID: <av19dZeraUiSEzyi@shikoro>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
 <20261118-paul-v7-3-rc1-edac-v8-3-ed791084cc19@bootlin.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VBm/YAgMbcVHdp09"
Content-Disposition: inline
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-3-ed791084cc19@bootlin.com>

--VBm/YAgMbcVHdp09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		edac: memory-controller@4000d000 {
> +			compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +			reg = <0x4000d000 0x1000>;
> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +			clock-names = "ddrc", "pclk";
> +		};

Dunno if we still want to keep the 'edac' label. Currently not needed,
but might be in the future? I'll leave this to Geert.


--VBm/YAgMbcVHdp09
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr9fXUACgkQFA3kzBSg
KbaMvA/7B8Z4dcvBaxxcDL55zgR3FmtZ5EbUnUKeq6FHDZjiEYOVIhv2O723ghhO
QJGp2KwPBb4ahYSp0+0/w79DDSdctY5ZljsOhvRj9jFK1EgqOqoibmbWmdOY5zft
WoRWzvX5zwHaq3Wdrs3RoP3vTACIcQBOiXc+rf5gamHuG67YGQHHH23BSGaB9Fmy
76qDyCAGUQPpq3mg/yrwuikaJLT0NV+fxLTXQ54NXUgfuKMaxiiwYsCWdnehhLmN
Zz/j+/tm58sRbC/dQ4y1dB7cnbu2kNygC5j+YM6J1RvVK7RCDtA8ZbqM+0e9mipy
0sEKEImcjkrr+ADGInt916OQb09dbXFxy+37qFuOn7j6fmv7pfzBezWLRV8UY/t9
heRObcuRvus7l45V4JgeitJeASdZy+jlBblXiFnfwlT3R+JqPh3eoFiEmLXUZwKa
7iXoZzF28rO2YTNBGncZ4Jig9AoEfoDQf/8dC5Di0QVXmqunbMM1C5XeRTKnK6ij
Ad1Fr18FH6VP8om5/kK6406+yShfnGc+m3o4lOYk0Ov+oBctOf1WL4iVY7XYj9fv
l9vOpgR7HkL4BsCd+38ZnWkF4pU1NcHIIER0t9Gv/NVObnEnlCHmUzHSx3jxCgt+
n4SrabWdXl4IDZ1zIIz4zlkQZjE/GHS6VDMhgVhtcD/DbE5V01c=
=zwkY
-----END PGP SIGNATURE-----

--VBm/YAgMbcVHdp09--
