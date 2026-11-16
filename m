Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830229;
	b=t5K/zv0rNL5UnOh9mw01MN++Mu5P0xVR0h06QahtQlFsAto7pN94GAZpCtEvZCtTV5+G
	 qtN8XvyM81UBfYHyNaI+6X6LKNakVU89ja3NsNXOZG4ydePi01Hr/zHVdQn+GPuiTz+Pp
	 RuNcRvWaJ5Fbh+AnlS40Rk9tDK2kCJBPGHoTASh6Z/q5XoJNeAosM+uX8f4U19v9QQfbl
	 N6et7lORaaex8dKWKONPmA+bbxlJDX/A1fbxC/o7ho5zYaiPp0WvhMDtHesiINWrmY2Yn
	 sT7tS4ULUUZD/Rtpu04OdJu9aF6LNbicoEC1iH43Woj1neucoMBKCU2d7YlVoECN+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830229;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XPQ1wIXQCkQXPiny6s36FrRzIlHdxNRjUMbMmTa47BM=;
	b=UqEA+PA8Wqxf8vNN0p0YTv1ch90HcV2oIrmnDprsyYaNsYwrT9Bbku6VkGoZwp9dV6AO
	 xYnfX+b69aM49YUBwT++gnVGih2dJSXrT8pvDF7E6C9gmUPKUtRAhO9PcToVJmTXIcoGJ
	 V9iP3OfYMf7nhqAqfQH2iv3yoHo2+sa6ZM4iq7sysdiDkLP3Ietr4323Fda47I7vmj98/
	 nqeo6HZuOs2IorP+GNOpUf+6+Cm+THsxRS8Oi1D/SAK0FBb1A4YQJ1LtyfZ3Qg75xNOZR
	 SVHpNhqSflBTx9JtVceQqoA2Ai+Qz8d99hYwrSYe+L2WL2Tiohqx6hMAnyTdKaak72w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=e9qWIYEX;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBC3606A329
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 11:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBC3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=e9qWIYEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XPQ1
	wIXQCkQXPiny6s36FrRzIlHdxNRjUMbMmTa47BM=; b=e9qWIYEXxZMCm4mjbaNR
	tIAuQ88fKvTqH2QXOgyN+ul9rRhg8zCINmvw0JrCYMVcuLesFPYJPV7n/AlQ5Nh5
	l13ZH1zIYMg8Ej612P1Cx8ds4HMmJuTccH+O9Z5yYcDO/AN/YuEtCS3gHo6aKxAo
	3Hym1+hpIRbccoC2k0uPKclf5drzr3x9cUC4bUbCZMAQZqcqich9RkCuzzAwTWmE
	Kj0cYhJY774UDulZ13WJlzrvYRxQl1XuxUxYDcIvBZXikVLuo6vEFr04iNDc91KY
	mP75UbhLQiocWrytPsAhr/za892hAvl9/HQ1/DWC/UcuYOw3nVL2l/FOBWn5vFIz
	jQ==
Received: (qmail 1270761 invoked from network); 16 Nov 2026 12:57:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 12:57:03 +0100
X-UD-Smtp-Session: l3s3148p1@WLLmeWNgjMgujnv5
Date: Mon, 16 Nov 2026 12:57:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Increase sdhi speeds
Message-ID: <avrvis4phg1v-Uxw@ninjato>
References: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>
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
	protocol="application/pgp-signature"; boundary="KhGI/zD6So15lITj"
Content-Disposition: inline
In-Reply-To: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>

--KhGI/zD6So15lITj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> [Severity: High]
> Does enabling mmc-hs400-1_8v here break eMMC HS400 transfers on
> r8a774a1-beacon-rzg2m-kit with RZ/G2M ES1.3 or ES3.0?

Dunno which ES versions this SoM can carry. I will drop the relevant
hunk and leave the addition for a party really having the HW.


--KhGI/zD6So15lITj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr674oACgkQFA3kzBSg
KbZJIw//akK9tTqEjgihe5aLlFrEUl5fXdImqi2/3bHhmA7T+M56aYeqy85ii1b8
ct0HDw2/tSkX+tm2Vc/ALoPrp89prWvXQc3cat9SJzcNHJXnUF/rn7z2kOEMBhn4
Aab05/Vw8VyQszUJSJqKVAPVtXCKgP724PxHCoIvjS5rsSXsYn6X7SpRHkLd1koU
pOO+u0B/S//ijlzrOuizCdTDo1uTppuTDAM1DyDAC+5R1yZP7h551ycOmlLftkuc
1SZXXG2uRBLJK8ZQv8bxO7EbLW/zadLCTYPyeAGmGlUSI/6FM8o3lzGYQtNhUzvN
xW5+tVbnqQ95bRKNZDbfZoCFc9PhTRGIkasCFcdaS0Lp4I3uKr7CJ9PxeFNv8dv5
FR1HbYC7dacT618o7KlgeZ21Ry29UbcvrJbgrroYA8ykZUN+gBwTO8CR1EP8Xdtd
nFRPNjqNuQSdMXMHBdSGgOU+CQHdQwVN5e/88YSVw3dK5Zb3P4Qj1nslvrMgdbLH
xnyKDBGTKlSeoC2cBG1ILql7c3yrpHeIUbjVQxAN3x8VB77LtRyEfhdYUJPOqpHP
VLJX1hAFeAz0CKXs78qZBv48fKSvgUH3edld1dDG+fqbh7m4A36uKL04/wLdnQ/W
BUNinlyXH+hJxgyYJPbvC8djUD5jvET8qM8ndiNCYDAYCdr0J10=
=ACCe
-----END PGP SIGNATURE-----

--KhGI/zD6So15lITj--
