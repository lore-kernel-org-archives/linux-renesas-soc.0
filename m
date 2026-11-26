Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731536;
	b=ytcjoyjMVGKd1ptVc+ypAiG6PeiqlIYzrB/j/BWB9ioQt14x2ffKDQRFC72OO+9Jnij1
	 6AP5RYBQpqmHICrw5MZ9Dj7CYIwF8++W/wu4Y+mE9bOfpvWEsPZ6x2yToFAbLb4mzuIcX
	 FYDAJoPPFFsIngbUtBcsCXhPItLhskldYt2CXmwvKwlNeA5YY8Hav5PLhrvTghGQB3U0e
	 woOE36gCtu67+IPvG6aNIH6goHI8TRNFftRMEzajcGwBD9xw/RlDtD/AoAkMEd/yjeJ86
	 Lj26ZixUFSCFzKf6tC8oI/GZreHgRp5Il6y6tFoqD1yLvLLs+cV7g2ZUd7RdZdJmkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731536;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pDZ4T9HNnrhv7OW06Bv3skkU7QYMWt1sIx+VN6xDhm4=;
	b=nOmbwL/C4seFc0Xb37OAkZ2b6VhJKjtNvujdfzKWnVo0W2W1ajdjsoCusiAfvzfwXolX
	 +Uq2kSIBD+A3H4rF2EXFKOBP1sKelp2pbBLCIQmH7vqZp2/YmbHbZccMGxhPLrahi7qQ0
	 epTaT5a3v0nooPutJyfoc7L1ApezgF1zGF4ClYX3xdKJG4NhhtpSUPP6W3VCc+L7bW5at
	 g7TjgWSkDEzOhmHw7/7CGRprBdKx2iR2IGawLbhT/7I1R1tzBrn9veRQhHLVBIcOBgMkL
	 5TfvJS9epGEplrgQwA4N0q10X/srlSMPX9L8cPga0YF8jvPdZcHaoXlJTHuEtgXDp3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ieb0EkxN;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D95606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 22:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ieb0EkxN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pDZ4
	T9HNnrhv7OW06Bv3skkU7QYMWt1sIx+VN6xDhm4=; b=ieb0EkxN4E9ZZby8SQZs
	UlL/MTM6xVE0Mbavjg2DtVN9RfLw2vmFcSi2zVYOTMhy66/gxsm+hmn0tM0aQ/y0
	ERnKqY00O9S8aQNwiwNbn6+icalaCIAs+GddSF27QvVhdcvmE4LADHI1LBPWlcyb
	Sk2pWHLvejW/3AHhgpg1Zi22MWwCNeMl9SJVqG/UbGioUYk+ReWWKm7b7UopvCNl
	WGoL6AcV4MVUrPYU6Tc83lxhQnWQ7Q01/aOJgyjJ6J8JckDKrLVblpdbhab3/yb3
	rJ1nsP0mBgHkJlKnOCARmSy/KFWiY1g5Ft384tOdVn9qTi7gm7vi6NOgtd7LUIg2
	nQ==
Received: (qmail 1766453 invoked from network); 26 Nov 2026 23:18:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Nov 2026 23:18:50 +0100
X-UD-Smtp-Session: l3s3148p1@qTL4UzVhiMIujnv5
Date: Thu, 26 Nov 2026 23:18:50 +0100
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
Subject: Re: [PATCH v4 2/3] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awiwRTNx-Qi-aNzZ@ninjato>
References: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
 <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="t2Y4PbylN5J00VDt"
Content-Disposition: inline
In-Reply-To: <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>

--t2Y4PbylN5J00VDt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 08:11:06AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--t2Y4PbylN5J00VDt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsIsEUACgkQFA3kzBSg
Kbb25BAAscL31qp38pQcZ9Veug/0oHqeKBKjoMr/H7cX+GGbUuE6Pu3jrdGLBGMO
st3/gw3ru5XMTUoOU9myYZnltdbq2TajaRgTDZpD15fsIpFxbiUS3syS9A/fq3jB
unpUzggvHq3YKtXe3kgPsPnABkRMAdodicXTe/FJdItBeYtw8YqiwKS0UK5+d458
GDU+uSk7gGcJXCvYx+NkFhAf7c4yPV7hMCS2Dea8l5iYrK87DXI2dDJ8PUrakwSF
BUyaKvZgveF5Vf00VbRFm991YkN6mdvrY2UFqn/TEU3cNx7iAvJGg/0UKilsI0OQ
TBeMs9Hr0uneDIetcP2qNalWnZ73JAoSO/X4nETS1It09MMSTmwrjGuPWYYTEIMG
kVULn80hlC/pQTTJy4WO8YacC+NUeJ7LOcjy+Wmo1qEG5fwTU/P4GrJVk5CHxhfx
ey97vd7dWsBnDW3ZBzLTsunmj6Q/DT26qgbJf0w/2zMrnsYzcgIPgGaom5Fmc5Yd
Q9DmYpGOLawT/isIM1+Il6nsUwZ31nEdkyWyKzIRd0girHZpTZ5GsORlNlpcbKHY
8gXu84XxPkjuGM3CF/pPq7nhYzkDt8d/QokPFt+Tqh31ESpOaGChqFmV9W9mcVyh
Lqlpq8UKBeACf5IUZdKm+NKgo/8XByAmHkWdViJRyLqHqXZiNuo=
=wHPG
-----END PGP SIGNATURE-----

--t2Y4PbylN5J00VDt--
