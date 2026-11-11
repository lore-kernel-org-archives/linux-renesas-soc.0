Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392894;
	b=tfGh7d7jq7ybt+MfQZRBsYT0ddK3OPTV4OvNNSkPiMI1t3yINj5ytdZxhXEHISYkKQF1
	 YGEFrgD3C6OeYvXRmme9YZaW3FJLFW/AxVLykKElXk5nmSzCLQ5/gW80Pkx6dWSb7+ft9
	 Z+LGH6iOwNELiwNEDckWFJS1HY9vCABaoE2ZjPLohqBPwddwBTreNZNHlhKQLD8ZV7r6s
	 KXKIzBPKSJMybHcOv9G5/FB6qN0RbKX+ZGYJ/A4PYw73L6QC2zQ04HZItxZSLuziQJMSE
	 4wAMDKwB2XxKAIrL3WofATUlk924JpUWrGKl3OXunrNpa6iGTisBEE7ouS5Fo6NcHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392894;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UFoLO/iOJWXUZ8LPtrfxkOTStHkWrqT3iuMucBrRSF0=;
	b=QCAa9lQ+p+eQsXFYXXmFVT08fvNW/04POuNzvDcIV6zToHwbYm1F6WTKpIHEBOXuzSZZ
	 iTsOS0XyWyCU9dbG6Utckj6ZuF5K+Uk+HU2EYilGuaH1iwk0KPS6jYEpQ9T3RvkFwjkI5
	 C7ydsCUigyABD7y/VGjXVy/F5hFQr9JiFNk4zrKSO4RaoDz2ukx2ebMFpClNIyq4ixua5
	 ZOBHvlqNEQwtZ7Mtkc7x3dYjpFv2COnbqJBb66WOZIE7MK2MtBfpuuTESGnAypkJq+pDb
	 QsaEe57XEUXnSGKIujbMdnpm7cHtYMFwwJNFkWReqGrX+RAbBiIVUxBytSAiWTeiHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ahJkmHjc;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADF606A332
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 10:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24ADF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ahJkmHjc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UFoL
	O/iOJWXUZ8LPtrfxkOTStHkWrqT3iuMucBrRSF0=; b=ahJkmHjcaauoFZIGscNZ
	Rb0iiLRERHmHMIMp3HT6/ZOz81NXw6AWqSN0g+LY4KAq6ewLqYhHBqKrv9+u541o
	yIkalt90fhUtR6dhzV1pzfy6eZbd/pn29p+R/q2WhJjtwN66bfCafCI46pQOtFE9
	1ii+/C3ijdeR8RUwiFgYys16LiDuUVtk1LEiNqqtXk7pZjrHbBug2OpSUvbH58yp
	wdv8BlL13ybvDFUs3NVhM0FZnO6Kwbcmmj2MxvhfGqMz7cXg20D1cUX0MxEaoBox
	s36BG5sYjQ9Trepqssd7alH8EaC2H5wfQ2RCxaH4EkODjog48ynOxKvk/YTv5sLJ
	Lg==
Received: (qmail 570348 invoked from network); 11 Nov 2026 11:28:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 11:28:10 +0100
X-UD-Smtp-Session: l3s3148p1@2aLUpv1fHsAujnun
Date: Wed, 11 Nov 2026 11:28:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v25 07/11] mmc: renesas_sdhi: Add tuning delay support
 for RZ/G2L
Message-ID: <avRDOl1O5eXkbX6V@shikoro>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
 <20261028-rzg3l_sdhi-v25-7-57f16691c2ed@bp.renesas.com>
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
	protocol="application/pgp-signature"; boundary="LxrXcrfTQN6mcX3w"
Content-Disposition: inline
In-Reply-To: <20261028-rzg3l_sdhi-v25-7-57f16691c2ed@bp.renesas.com>

--LxrXcrfTQN6mcX3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:51:24PM +0000, Biju Das wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G2L and later SoCs (RZ/V2M and RZ/G3E) need a hardware adjustment
> delay written to SCC_TMPPORT2 on signal-voltage switch during
> tuning: 0x1 for 1.8V, 0x0 for 3.3V.
>=20
> Add a TMIO_MMC_TUNING_DELAY flag and
> renesas_sdhi_set_hw_adjustment_delay(), called from
> renesas_sdhi_start_signal_voltage_switch() after the regulator is
> set, and reset SCC_TMPPORT2 to 0 at the start of
> renesas_sdhi_execute_tuning() when the flag is set and tap_num =3D=3D 8.
>=20
> Add a dedicated of_data_rz_g2l descriptor with this flag and switch
> of_rzg2l_compatible to use it instead of the generic R-Car Gen3
> descriptor.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--LxrXcrfTQN6mcX3w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr0QzoACgkQFA3kzBSg
KbYHwg//WaJ+AmtoO2sQG9kq3fSF0VqC8Jm2BspR4uJuGYm99ZXjEaqMBLjEOEK4
O4kyFkT8fZdpL27J6FWySQTJo2tu8io+0xSVOGdJqH/HRp+W4/zhzPxcNXmoBJh0
vn4I1liUsdaluoxMoXM7jgdvHSrHssRoFJXWESE+bl+k6JFulNvRR5TYcbH44DYY
xu1+YFSkI+hgGrRP8ifr7hsjhDdlJMtxsYykU6Lm2TPjMsUNsoR59WdbNWX2TnHi
rKlMgNfvum8qxcJ8//KMDijp9QEorxccH6QAGe8hJ1eyBK7Eurvv9Hf6J4y3jdSn
ZK/4lWQaHsmCZUCP9sZ3yfGheTzq5aMW78r3NfvA+mFZKA++Sm67eiaHeVaYBLdi
DP+ZuuIpZJBlzkyb+P/KBLp/yQCRjV6OMMEu9c9RKI3NpvGEFlTZaFHlGKmsVFMn
BpFALILwgxxzjqS8/7MSU0vJTxOhtvYsjX2s2iB3b9NcyiSakitPkIz2LBsJrt6y
MCgIQrI16zhWMY+FfYMsB1OdWNIJoONWZB1etrF/YElHs2vNC3OvzxNDfdGlESN6
GIzuC2e8v/3xI7YNyDYdF0H2f6tObUNKIIVNaIYaSzwAs0Jodn1OISlatE0qxxW6
AG9xqVNIGaQ2ZfIlUOE4VEp4j4fn9ZjnjUpf/9eGb/FyYcjXZsI=
=tmOV
-----END PGP SIGNATURE-----

--LxrXcrfTQN6mcX3w--
