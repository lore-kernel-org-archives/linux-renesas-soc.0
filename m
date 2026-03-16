Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1D13DBA0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670661; cv=none; b=PJVBezQZuDQeBljnGJvJeQWMI/yI5aIyuTLStztWnN1d5rO6ZVEl6kkBiQqn1B//q9DsBi4bH16m0z6T4c5ZOs8Kbq2phiLo1vzhzfCrTXQcvE4Wj3Xo28ZcjhOODPoBOyPQ0Epts02+ouswKbRZ1UTInWJTyVBV4Jvg7JCyN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670661; c=relaxed/simple;
	bh=HXyby1fC1woD0aOW+X0r3xZY4aiybILZs4zc4kb404o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoTxl+yrjV57/D1mXUQdb6tbqWxeggJEf4uVck6TdjMHxTsAv6phSbAR7Dxj5W+7T3+nG3FPy9Eq/vX4fsz/qh5HeOwgm0oUcHSOiDQzC1LZsc50BSwvxUuvkzV//jbVguvJp2vELuNSCTBRoo8iBQ3S9ei1z2/aHBuhyMpLgMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LU4FUYp4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LU4FUYp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Rg+/
	J3EnrGFEOVXzIPjA7aMXCL8SqvKE+yvSPuZjfM4=; b=LU4FUYp4WtOE9Gmri1pX
	EBTZ7KLGbq95t5cy2XsAukdYdRVRhLcsf5/V3D+zw0ao0/LECtx/6LzWyX3w2E3R
	4fKeHK9SevvTF2hUSJK5odAAOasaPCmwbsSnT2+S/N1HZ7CI16owrPZqa0nUNmKK
	m/Zt/GWO5NUF7iPqFjo1i/uVfECqvx7ZNuaMcR5TOXyS0zOa15ST179HbL0sXbTI
	sIF4Tp169UN8piHhCG0UrSJ5YHtGDC0vtsO9XyjCUChB+znpgyZjHVY1cEfQ7B4R
	BrURkwIAFwlm0soSJUGyN6iyjgQy3qhQ353TJlITnua2eF4nQZl8R6zb0J9ebfjB
	Fw==
Received: (qmail 1454690 invoked from network); 16 Mar 2026 15:17:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2026 15:17:37 +0100
X-UD-Smtp-Session: l3s3148p1@y0Z24SRNDrw+XdJ7
Date: Mon, 16 Mar 2026 15:17:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] memory: renesas-rpc-if: Fix duplicate device name on
 multi-instance platforms
Message-ID: <abgRANFdpr3rEUQ2@shikoro>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="28MoejGXT0OM86eb"
Content-Disposition: inline
In-Reply-To: <20260310212927.3372410-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--28MoejGXT0OM86eb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 09:29:26PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> On platforms with multiple xSPI instances, the driver fails to probe
> additional instances due to duplicate sysfs entries:
>=20
>   [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/d=
evices/rpc-if-spi'
>=20
> This occurs because platform_device_alloc() uses pdev->id for the device
> ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
> all instances to attempt registration with the same name.
>=20
> Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
> unique IDs to each device instance, allowing multiple xSPI controllers to
> coexist without naming conflicts.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sounds reasonable to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--28MoejGXT0OM86eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm4EP8ACgkQFA3kzBSg
KbZSKw//UQfVwpbk/u5gXDzzHRT9ApAYtCDR7TnxgKav8zKE+t++ECleHANll9+O
+8k8a/R/vg6kFYJUPvcgjTASQ3CNTAwNKWGLZgYc/mezongVk4ee0Bpe1586CLxd
SLDr7kB3xuEgXe/8MP6f2h7LQx99swyHCz4yygrXjSNsC5USCG14bGTagd1dN7kl
b9+07wooMVkdzLRjsirLltf7wB40E/mKVwY5IFgULGawVnrAoCJPgTP/HZysw2Du
zW3gg3CeO3qsiSGE4GkdW0Ssy78L4BjsXsmeKHNZveHYHYUvvqz2aqWYoNrLVuBV
FIg4wm/nR7M4aGrq7RWYEMsnBnCZfa1rIGpPWmz1L5ryI2rs1T+UntFPQVr1PBQt
CjWRGXVhC4oPFqtCifXh6DuJnMDwGjJNfuKzM8ImroFO+WD8PumNnaFuEs8VRpds
uF3GiP4K1xNJnE5CkVn7AyXvhQpkzP2a4ghCP8RyACFpZ0odGko0jmdHIykVJ3UA
dixjWKAOCsBY8ArbiiC/6l6TJ629xjjE4WbJzDLLzt7pnxfN1TM4iiOb+K6yMpLN
+XjigoX3nEHn7BC8KvtmuUkxhh9eWDpywhPrqmyYyhqYA+rWeNmp0xmGly3xumnV
2tn6N+lgGBzRUvfBcMBwXucQ9y3fyBQUIKxDJF3F/GfQ7i89ikY=
=bjah
-----END PGP SIGNATURE-----

--28MoejGXT0OM86eb--
