Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01461F942
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787168801; cv=none; b=Q+7m0hSdw8XmzqaJU9YbvprQkq2RR9Pwbng/WWiivTFpG/q3ge4HT+vazSZqaDl8j5hW4SlbYLE5p3TQ/YgPn+aolXC3Ml2iLijfpM5wIG7f3w42eBuL4uMmVmg77RLKYGZFF86U0th6BzfX8Ari31l9WHKkwWS4W+IFgQuq5Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787168801; c=relaxed/simple;
	bh=J8RL0JD69JaexBuYPYuUMdBhDSxzVN+7/1tP8Kb8p6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyypB5lxSnOT7AQRQ/30YkveMgjufNJrHKc4zXpQpWARuYhQNOgRv8GM6qcOceNfaR/eUnQ2oPCELDlmoOAGn3agw2ADm9RKl9q9W0mtsiWdT2gMO2NCzZoYocZJ1PYp1tnd0ShfJR/FGAq0SljaBW1wOBoEk++gb91XMLC7d0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S7d3jIcy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S7d3jIcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=J8RL
	0JD69JaexBuYPYuUMdBhDSxzVN+7/1tP8Kb8p6g=; b=S7d3jIcyx7qc1BdJuB8Z
	Ii/vcBPifUPb0NWP+JBnnq7emTtQWvoXqw5lnvyzgaDof047RkjaZE/tVlD+niA7
	X7cq8O6tHZ2kq2T9dPYvf9NrfS93BqxKNzxlxcZ3AD2K/C42WuYKORi/comw9gab
	dQc5ahwdUvN4G/1m9Hp4OZiPPy1rRZbED77Ti2QQuqyDU7rPUc/EAApnsNHTZYBd
	CYns+k78Y1gmcbKRr5aHSvcIyNi+adPGhK4fSjor9J9u0qpW9IG0G8j+naG7yeRA
	mcuHZ9fscWK4dkQDsTPVl/B1S7KpEf6iaYaEoao4UUjNOioQjrmQ7bnhmb4yS+/9
	IQ==
Received: (qmail 52807 invoked from network); 19 Aug 2026 21:46:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Aug 2026 21:46:32 +0200
X-UD-Smtp-Session: l3s3148p1@bSAAqWtZDKUujnu5
Date: Wed, 19 Aug 2026 21:46:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 00/15] Add RTC support for Renesas RZ/T2H and RZ/N2H
 SoCs
Message-ID: <aoYIF8zAoPNyJxXM@ninjato>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aoWsgnsw5gC6TCj5@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="38COm2/I+Ngkf2KZ"
Content-Disposition: inline
In-Reply-To: <aoWsgnsw5gC6TCj5@shikoro>


--38COm2/I+Ngkf2KZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for the quick update. I have done the review now, but still need
> to test it on my N1D board. I can do this maybe this evening, but surely
> tomorrow somewhen.

rtctest still runs fine on my N1D, so for the whole series:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--38COm2/I+Ngkf2KZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqGCBMACgkQFA3kzBSg
KbZvrA/9FSSCpIUUKdy51NOPOuiVEiRGjOtCpDSMYov7ZKE2Er7CxVRseqfB0H4u
alLRBCFUilYW2D2zPNL5kRTYCXZPkp68KXdBH4ABvaVqUL3GHHQvTVA70X47Zv0C
ZbyON0uvrRdrnAFFDjp8/F6YjMSF6lJGRqvTnSLFc4qhE3BoPJU/q8sJmnHtpkGg
9k35d7lvdWprY1i7ehYhLymR5zkWxSFIf+xofxAUEFn6/K/CMyya+pVbhpKsavst
9ij5rVRujhI7ZqmQCqGRqb4Y0KWc72xbH6vSvFPl/TB9/iVX8Po09HWx2bw3mUen
5GKSPKJyVhySAwpU0F8o6nMCUmsqCiaZb4Z3SnT6PPgCZgYZU/ZAznCON4+EDfPC
0zxG5XD+vP8d7rkkXBbZlEaM4/zfrcg3sW55luwVDIMOGPI01H7RLgyfNs9Refdk
o27umcKujkXBvCqRuD4DOEJ5PewbMtqquZMtd31UFxLXXQbc0td9iLUpKX1EQuTB
KE6vzoUer7pnblJx/IObNdZvLq0l/GT69XKBTzaTkmRbxhydPDPUgHAgyFQTqeBr
uGzDNfddtLW5mbkW9/jqtxS7kaPg/dg/NFq3pYJom6oPiIXFdsVd3lDo6RKbTMMp
UK1kQTrAOyfG+6B9YJuOEsBsUPrbD4hAs2jJBi4idUQ500OjkrQ=
=wKQ5
-----END PGP SIGNATURE-----

--38COm2/I+Ngkf2KZ--
