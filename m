Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42313BE164
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943636; cv=none; b=uyu5bnfbRSgpnxtRLTbnZandsfSImfRuPO+JTg7ztMbRxsu9vV/tBnLeoA3hshtdHmkRppem8a9T5T6AFWg+lxI7frRWeSuQoxs+xLamNwwAYHCudOJZv1hS7InOUHuZaKJMjbEbu0DifmAn1wRsUk9SoJE2dUpbhEgs1Jnv9lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943636; c=relaxed/simple;
	bh=QZpa8Udxm1KQ5kM8QEQg3Dx9M6/8afOdTxUPuCHEhvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBVzbgSRSz0ejn8xH7KXTAu65UO/Z3aPzInUA3J8NwkTv2GtFkG0lB0G3iSKL1AaO/OF41JA1x402xJDZQwop1eWCg+d6PTWFqSSvj4+T7JIFUBj+nDasVWjjbc3hNu20Igh9d0UStNZiEalHQy6dAY/baXNbXBpC7qbjzd6BYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WfiXXcTo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WfiXXcTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QZpa
	8Udxm1KQ5kM8QEQg3Dx9M6/8afOdTxUPuCHEhvY=; b=WfiXXcToB647nggrN8v2
	fc+CeLhQ1FpJCwH3kIw0x541qt60syDCqWEhsDZohccvC8rJqUhrf2g2+WbAB7Mh
	1ujktCIhQVnMOQ9Q1vee2XTUe19GVN1Hvazs/AtRIj6KyiBUNj/8mrPmBkx5XMcW
	XV44cJEaC0WnAjp9ZL8ijUolczaalyjgwxxjHUgy5X9oHzUlZwkiP5Ghli1pPrDn
	VJCMT6Avgb4ULrP+y9xckdQaVBDMqqs3SHRJbIUbi7Al3fz/xOLIwGsH1r1BYqlv
	4jrAzNb8ybvWPTHszLpqXiWa+4RJdIqojQFiniWdoGVtE7rRz1X8xctf/zicPtgn
	cA==
Received: (qmail 1594237 invoked from network); 31 Mar 2026 09:53:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 09:53:52 +0200
X-UD-Smtp-Session: l3s3148p1@j6y0RE1OCr8ujnu8
Date: Tue, 31 Mar 2026 09:53:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <act9kI96LT3HcSWy@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <ab-vWbjdlAIt1qaX@ninjato>
 <87a4vyynl2.fsf@linux.dev>
 <acIsrJp2Zq2ntS5f@shikoro>
 <87ikalp9b2.fsf@linux.dev>
 <aco7CM5N3E6A0v8v@shikoro>
 <20260330135050.GD22278@macsyma.local>
 <act1L-2tQV4fHyU7@shikoro>
 <CAMuHMdUP+pQwFuZDLV6LSYc2EBK-R2di8hzi1GA=jFYSigZDfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nPCs5Hhs/MqaXZlW"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUP+pQwFuZDLV6LSYc2EBK-R2di8hzi1GA=jFYSigZDfw@mail.gmail.com>


--nPCs5Hhs/MqaXZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > What about Reported-by? The required closes by would then link to the
> > actual report:
> >
> > Reported-by: Sashiko:Gemini 3.1 Pro
> > Closes: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brene=
sas%40sang-engineering.com
> >
> > The drawback currently is that only the whole report for the patchset
> > can be linked. But probably Sashiko-reports could have some more HTML
> > tags to reference only the paragraph needed.
>=20
> And the Closes-tag can only be used when the issue is closed in full.
> You can still add a normal Link-tag.

We would need to update checkpatch for that. Doable. I prefer more HTML
tags in the Sashiko report, still, because it will be handy anyhow. The
reports can get quite large and it will make it easier to point people
to a specific item.


--nPCs5Hhs/MqaXZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLfZAACgkQFA3kzBSg
KbZJOg/+Jt3OkNFKXRvaZGLpNMXG594H4kE1twO7oUXfGb65Hi7lKwOxpbLjBZp8
LnNIqiLzUm1e5cEznX36e2UwNePrX2nNS4DE5Qnr6dG5ewazDIaf2gli5RA2ZmmM
+WIfaM8Mg9yvQ4dMxdmOl7Czhi0f/KWzX/fbPVwjGzsy3gx1zt9jHyQ8USwF1vYA
UKgNvjpek4OyVKkk+wL9gD1j/ksOs/0gLATfxwM5hx5J5ySo/ew6wasIgMjlja8t
s61mHnA5NqSe7Psl3KRuFIsWlrTEMFm6AqBnQG0wpZhwtEVI2A1h3CkHU206uVMM
aw4OGrJAq+Eo6qQz3Z217F/Aj4OWbw6exN9ygTE+80vaHHkV6i66GqV6HKXAgDfY
ffwuxho560M5elhe175DzbgjZ0gWIFy9exZ5etZmEYuBX1EPbRuIpM8yhUuyBhEI
haCzGJqcf19B9psVwOxIzTLjWk5Zj9srZKA7UW5WObn6Bd8WxIue6rhCpcHf18pj
CyMx8fVGOgszaHiVnaX4dtjbvyeAZOXXW09edMITmyoROz4l5lhbul1ZNztCGcce
d8wjWggbYx7mCKFH36FbNUP0Oa2vhearCybaLsRgdvDCbrU0qW0oq09tfIN9EWkd
XD9Z+7wLRRygesZ5YKT47eiCZtsEdEy56HUbBwIiZHMtBxbNfQo=
=7thM
-----END PGP SIGNATURE-----

--nPCs5Hhs/MqaXZlW--
