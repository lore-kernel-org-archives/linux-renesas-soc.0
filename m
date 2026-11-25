Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633472;
	b=5ie3kGZ829xvrOzWJvDfbaIL2rDgvITyYuow49S6eCSV3JFFEsPSk/LfHaxCtyDCdztz
	 3Nfr7jQYxhb5+vkpaz0PcwGsAt/RQUVSVOLijuu1ncMmlWf+l4Q/GrTF0DHLMawbXxg+/
	 gA50bjSavLGIDZXSwDMvLkiGAXudxuZPT9lZ33VK1Jx00ZZCOpn6AePFxoQX/tapcr6UZ
	 XzEwt7IQfLsj8s1OrpcIbHSaRJ45qIqMgrl2dVWqfDuol0gwyeQQuO7XAvY05ehV9QRcs
	 CNglVuTiqcrdjahLuphdqW2ZCJ2fjMkXh0SvN35zEW25hSRJQTtoLXtDZ3nobmO08uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633472;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pA5kKd4iQVCR2KTF88e0onlEw0OIJivMaBXQAKw9JcY=;
	b=WlldiAKZs21X48J3n4Qf6RM/UqUgf7UZuXkEGnkBj30oC0VziZ3M6GiF9L5PU66aULGm
	 6nWwar/p8F9qyBQwOtWESlCZueyX9Zt9ZB07/wTGM9fPGeubQH1bBypCDwUwPPIC4r4Fj
	 RrffyPBHef06Bs//OVEUz0UUdJcavr3HVYxK50uTvRk4npl40p5/p6/gYvWgS3uIcprvi
	 JRiN+ovloMhVe5vrHJJ1hDOIguMF7sijTE9ImSxMhIM/nnxhxf+G8fA1GNwh1uLnpxYOm
	 PeDngjqlkrVb6Z7qunjFlYq//OareFn/6Tu6uuG51CPc5wqfWh9nhjY7rF7VRH2H0aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AJCKwfY5;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B6606A321
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AJCKwfY5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pA5k
	Kd4iQVCR2KTF88e0onlEw0OIJivMaBXQAKw9JcY=; b=AJCKwfY5zancEJ0KNEs5
	BY0lZzlYlJmnj9FDldXxMpkF2UQ6G3NP0Pv65NQOHCb7mHdX7oZR4bd1kjreGyBS
	DQwrkVc5MGJVbwCkrzImau3QiiF+zfKbcfnnYttrh/8X6+qiqyRKrmisp83QkeEl
	0j3v8eiB+lDwQeml5LqqFw83olMUSG/E9MJMpFBpMAoiCSgXVGJKPFy2kLMKYYa5
	flUkjEfOb2qe28B/9CZQ4CEnp36K3uBCWib7t6XNxMKMxV7RkCfexzhRbOynNmM7
	iSG/FyX4j6ZLIZ44HNhfrYMXAGF3sn8bunc+Jv73L4RSDCFMIgU+bD3RYuCCo5+p
	Yw==
Received: (qmail 1091951 invoked from network); 25 Nov 2026 20:04:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 20:04:29 +0100
X-UD-Smtp-Session: l3s3148p1@+sIUfx5hmNxtKXAi
Date: Wed, 25 Nov 2026 20:04:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awcxPKer4G5oXQKo@shikoro>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
 <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="eRna0Oic4QwHxYLT"
Content-Disposition: inline
In-Reply-To: <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>

--eRna0Oic4QwHxYLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

> The rzn1 system controller has two resets that need to be cleared for the
> mii converter to work. They are not directly associated with any clocks
> so they need a reset controller to set them.
>=20
> They are documented in the PWRCTRL_SWITCHCTRL (0x4000C188) register as:
>=20
> Bit 3: RSTN_CLK25 - Active low Reset for Timestamp signal selection logic
> Bit 4: RSTN_ETH - Active low Reset for RGMII/RMII Converter (50 MHz).
>=20
> Add a reset controller and add resets for those bits.
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Sashiko's comment about selecting RESET_CONTROLLER is still true.

> +static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
> +				bool set, unsigned long id)
> +{
> +	struct r9a06g032_priv *priv =3D priv_from_rcdev(rcdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	clk_rdesc_set(priv, r9a06g032_resets[id], set);
> +	spin_unlock_irqrestore(&priv->lock, flags);

I checked the docs again. (Do you have them? You can find the relevant
part here[1]). Figure 7.3 and 7.4 mention a reset propagation time of
5us. So, it is not describing a pulse of 5us. But every access to the
RSTN register needs this delay for propagation. So, despite the U-Boot
code not having the delay, I think we should add a 'udelay(5)' here
after the unlock. What do you think?

[1] https://lv.mouser.com/datasheet/2/698/r01uh0750ej0150_rzn1_introduction=
-2931374.pdf

Happy hacking,

   Wolfram


--eRna0Oic4QwHxYLT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsHMTwACgkQFA3kzBSg
Kba11g//cfNY/SqoXYVZbe5jUUEasxicviSn9VUDxqLOGOGA97dcdyA7kslpzPOg
73ZgXFIHXxN7Ud6vy61xNLp4pGNQPVd3CN972E3mm0DfgSqZjkvI7tCQbQGJfrBU
5KAXDlAvRp8TWZFZmYUlOS3HIeci/A0SGpy/J21jNwMOW3D5S7xshzNPKnjzFxSo
arum8BILxufSmeru5PseM9lDDwzYGBefVkgbBLGVSl66J8EGDnsc01qWvtEX2MFK
G8os2cq8Sood9CrVDAwk/3Uq6h27hOo4z3/C8yw1W6X9PKeJScLB7WuBY12qHjeU
NyPjHcVHV8ULKZP24HNRwj3tAEDPSX8xla8kqxL2x/1oml1pIRxNI6BPWQAboOAM
Ng8REWjSjRB4nih9NdZvmPjb7mgmAQM0bMconJhcEEgfTTJsSiXKuKOxwMFIQaKP
ZYrEdP6sgcufdL3HzCLxnB6tS4YnTlKnqZXfLkQtgAAi0bb6dEFfR3vj6HJvTcfj
W9UVm+o1gC3qzXVIyJ94rUPFvQGuJXZWuZC14SKb8Uu9ldVXOaniACEDABeUfURW
t2jGHwwP3xW6AAbx/wQKovyixV1L1Iqfe2dYE6VzdjBWtLJvgCqV3FeKP4YkUf30
M+m1K1g4AJ022+/n5VVKFDRGqJMOekznMULBmO0wWTScWJouSJg=
=70yD
-----END PGP SIGNATURE-----

--eRna0Oic4QwHxYLT--
