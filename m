Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415C23A9BD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 01:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786413112; cv=none; b=s9tevN7MPj2p/gVTx2OLdvKsT41PLJhhKOwCI3OyLPzXI9aJM+jcl7s9gz1GccS8lj4I634V7UxIg2Th4KOiishajPccOeDrZn3O4VuC0PjF6/lBg6pJizxPz3WIgIVxskAO3YIqYIyTKWBbLYXvFiEyjJOdpKIHuoQZtQcTBXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786413112; c=relaxed/simple;
	bh=r8HTThCXugbpAAl9VCdUHsHwKJZBn6+DRB58+4ksMuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1/IA9TaJUqZEjuLMDXj6jvfwRydG3qqzXEu/HzlqnhznyV0fyp1mFcP9wEWMhwyKVuOXljoJ9XFxgpRtaHlaEwMGCfZM9/Ad8KHPm/OMoWnriv4SflGXBM9jSYVcTfgQ/aCgsDZ0mWh6Khmknls7wyyhmQ5HhokTAaWQ+xX62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jl3tuSPQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jl3tuSPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DbG4
	Oa8QvPWoJtick5uHrB1Vc7DywZO9zps8nvpIzzs=; b=jl3tuSPQ+0PHzgD2Chjx
	zvfMzwU8ulaXAju/zPNDrSS18E/BvWbpodULIOYpHTJZ7yoqIjKIFoGV2/2C1mjk
	OUVPnEeEROj3tI/tX2xG0Sii9bljlIOz3dgtocozGhpVnZkNxgWdsk+2GLMBF9LV
	DbSeWDeCF9KSNTvnOxeLYu7P+3vEvDGdV9/7hVcNkpWwgGgSa2Ec+c+Rbe6XOqa9
	F0394GbWeem5OkaI6ZPG2yddYWz96ow7lyVLA6L5CuBau//+P2TRDU1xI/KN2lBW
	bBvyuoxOPeExESFw6t0T1h/RqaRxLIQJzonUJMPV2LmgYvibEctNDKoo4FZTKOzM
	Fg==
Received: (qmail 1348585 invoked from network); 11 Aug 2026 03:51:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2026 03:51:39 +0200
X-UD-Smtp-Session: l3s3148p1@R6U0trtYztYqEdSGzc+zASRLTMTc2Pm+
Date: Tue, 11 Aug 2026 03:51:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
Message-ID: <anqAKtaFCxADeLqM@shikoro>
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
 <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnI7wrOONy7lI7h7"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>


--qnI7wrOONy7lI7h7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +       pins_gpio2b: pins-gpio2b {
>=20
> pins-cn12?

Okay.

> > +               pinmux =3D <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
> > +                        <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
> > +                        <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
> > +                        <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
> > +                        <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
> > +                        <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
> > +               drive-strength =3D <6>;
> > +               bias-disable;
>=20
> These pins don't have any external pull-ups, so disabling bias will
> make them pick-up random EM noise when left unconnected.

Can fix, but is this bad? I'd assume the connected pins will handle it.
And if not, the DT needs to be adapted to that use case. Otherwise, a
default pull-up needs to be disabled for another use case.


--qnI7wrOONy7lI7h7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmp6gCYACgkQFA3kzBSg
KbYxFQ//aoMqyCZjSWPRU9o+uBsWOglUgPZRJ2OnvQbePBuQ9pt5Pafa8XEUaRw9
MkvdMiv0IfKzrEj1+v+oNjvGFU+LHSn5sR5i+CDLD8+bPy31F6XNA3nyldwfXbBA
yRsbl/BPgA2hZG1GCLPGzZxil+sqMdfjYAuuk6qxLbGIXE9jX1FYWb+GC0mK0h+t
ggJQoP7X2VIFbw/nFAYuECnSnwkadM+TDItgr3X0PE1VGc4q2YHNQSYrAymqGEPy
PvRtSFhsS+wxF3+MF5CwxZ6MrJMaUZheJPzEAKRvTLwIpuXZEyJx5aHjlcl3v/Wy
tnL8ubEBSOR+aNRn8wvaS0dP87tPwpZtX+24TPG9+sAo5qKbaIHKiBTj/bFWdmg0
HwyQbJRy8/Y4/vBZKTVTTIoU67TYnBk5dJx9VzM8nbiJl/VAY1H7Bewc4RK86Yqq
Vh66GcQ8R8FzkHgSjgXVd6sIrdr1ODNHrQBq/WEVHnCvGfoigkG6BwHT5FIv/eML
YB3rgJm+ORLX/yTgBXzNo+0nYnJBAxOThKziaZ5ztc++9hPJNl63aM+oeL5oBA+5
HL+HJy2NtIXqeRPHMZOOuWzQKhzIrIWuWiNoIYi2j9oLPudsYEruBdvAmurLTqbI
PBcn+1USAbDSsBjL/z1WQfNOVDy5uut5v9swVlcNJUaiN+NaSG8=
=0yYX
-----END PGP SIGNATURE-----

--qnI7wrOONy7lI7h7--
