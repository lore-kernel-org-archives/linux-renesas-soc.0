Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958ED4C6EF7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 20:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874331; cv=none; b=EEeydBli6so2pgLTgsDomVNtSOX4jpExSdYVVIcaoneXI9JVVSWM/H7bcLolsjtzaxaTdHfdqi5cfDfOd6nIM5EPSuC1VpfpRW6GdyMMQj6XQw7qVHLBmSYSD6DIgQWKYIIUGfsmBkJs0VzA0LKRNTyS4NX4yfLxx8riIcdFoes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874331; c=relaxed/simple;
	bh=wpf69s1Ff8qScLAMkLZ9gpi5DiKNuCHz3HvGvqrBn0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJxgngVw9Tv6iqzpYTZ6kPqLz6oKQwlOMv9JJ9pNKa85yQ5+By5thhWaTp7wFNBX7++sZWfAf3lSZZECHnunPQO0BUvtZppCn3tYuCiRMyJgnvUDsk56Ww1NNMI2GDRUQKWmWO1Nq9RYod2tblt0VPfI5wfgdanO+IyZnwD7mvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J1S+qOqR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J1S+qOqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wpf6
	9s1Ff8qScLAMkLZ9gpi5DiKNuCHz3HvGvqrBn0E=; b=J1S+qOqR1q35FHlbqhAB
	MEkD7dZoGvKPP1TNJ+nxfLVb79aM1juDQL0kRmLnQIq/K1s8iIIbpY9lgxnkx+mB
	tl/bWdolotlGgsWko5Hv6ktcukXmU8LyZQdiPpmOUQsi4bhY9JOtXtmR/ThyxOsy
	ioBEz2XiMxjI5Bi2ZulKyWenqC7zTrelhIs+v8n8bJnd1BZQhxINjFmiPmOD6kTz
	Q1LlBZ0YX2j+4vjW7GH91dKL0hp/1D+3sIZTcSeD+QtPjXSxU29ouur+u7/G2o41
	0Ngj34vLxA5XZ33sd8sa2DQibWUu0BjzgGXFaa8VHAxwE5nRUJ7IBFT+9HtZd/d9
	gg==
Received: (qmail 3516405 invoked from network); 4 Aug 2026 22:12:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2026 22:12:06 +0200
X-UD-Smtp-Session: l3s3148p1@dtLQRD5YkLwujnsQ
Date: Tue, 4 Aug 2026 22:12:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver
 entry
Message-ID: <anJHlR3FEJxpRNAr@ninjato>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e9eQDEvhZvpgy4nx"
Content-Disposition: inline
In-Reply-To: <20260721082952.215691-5-herve.codina@bootlin.com>


--e9eQDEvhZvpgy4nx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:29:50AM +0200, Herve Codina (Schneider Electric)=
 wrote:
> After contributing the driver, add myself as the maintainer for the
> Renesas RZ/N1 timers driver.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--e9eQDEvhZvpgy4nx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpyR5UACgkQFA3kzBSg
KbYe+Q/7BGzUJ6pQXvmKRPumYNhGJkjLvlN6Ly8/QxwvJxhypsikAW/Ihlt5Zi5C
z2qJyFdcfhdyr7YKY2DZtZZpjjcIc4eu/SLx1X5Md/0IrfnfdTGAQKRm/9XdTXzE
nyrVRVGsEJMGd5ErHEke0tOAzrxflEV/arC7oz1Ce5QN0azvPt3J6OtO2yXT0DvL
Wq1Rr2jiwi70R7TJRRqegop6cNLsBNtdGmoeZZ21IAXInSn28GtNF5cu1vZ8JKF/
TXCsL0q22J36CV5DOcCV9pojQvaS14JQIIeIcgCzeH1HUOhG9D4RPSz2BkeaBHkT
oZjjKg2fABnNsYv2+Ow4IUXSW7Ro8f8cuHyJMzg1XavVRhIgG7mL3EDpw8VgQ+/7
VVuiP2AALCJBA7aC3xI638a1Oe40wiskSQzQ8DA5wjpFaRsZcgyY2ptqZrhNNWIu
PuZDSHiw04Nt9dxw8I/F0S3M3ckO9OD4mW2nv1cI1bmFcURdXBppEGHYN5KWgxEc
Ed2Zi8lMS1+gay3FBv5l9t4W61uoasXH7HqeSnbgOH7uXSSzncIWja6cuzmrsus0
MYnGxZrCDvlEZl2XR8vPTFeI6pJumGvm7eSCGzRfeAb3itctubUTWODisg5rpLvU
JjcB/gZZmudxYfYjmfTw3btrgi+RHh0zfNsh4XRctvqjYdcxZ80=
=SZg5
-----END PGP SIGNATURE-----

--e9eQDEvhZvpgy4nx--
