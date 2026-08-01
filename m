Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4E397E96;
	Sat,  1 Aug 2026 01:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546031; cv=none; b=r3hzLBYSAmMbqGtLY2QZLpkR2UQM/fEN0NySvlQQ77OW/VewT340F1q0bCJLrivRvBZM4T9yXcMfdySCe+O++m5ngc7ZksFIUf04cwU8DScSRBastnk2sZRXsI6SJuVe5xEzGPqNZ3uNOy5nkkQtgJeao2V/eVXfrZPr3cFCvjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546031; c=relaxed/simple;
	bh=oEK6W2wIWcCphBUCG5YJ73654TA9eU7SZ5d0xV8V240=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHb0U704+Km45yaFGbUBDiJbFnh0SB25hy0X8WtNUuQXyX1Yf3fRuKsswhCZwPS+bv47dP7MBWjLuP+YXbKICTS8YcnLiIW01WHjhYUF5F/88UfRtV/P87JyHmeAJPUd0f+3IlNzQvgEB/5Dz8aPrf5lDvhGhEKe0uOaBJifqZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey5Z/jlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey5Z/jlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863A41F00AC4;
	Sat,  1 Aug 2026 01:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785546030;
	bh=oEK6W2wIWcCphBUCG5YJ73654TA9eU7SZ5d0xV8V240=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ey5Z/jlpZYXaTxnXHhM7O+eGIP+ow94ajLzTucA6avtoKi7UTvYwTSYp55o2RDc9Y
	 c5HrNI+NritjtB+8oOCYcdsvqjgMpYOvrYU1yaE1t3hRBXqKLid9EN+LH0lbur687X
	 sD1tbHZ3ga4ChEPGw2CMw4/ir6iT7BoXzgH309WOdHEUuay3mit3zcTH3wzYVGX4d1
	 fs3bOgEehFbeIwoKx+WrNBACplFtmwQdtaVofioVZEHN3UhH8punzWwxs1thJaYr90
	 vsPfFnemGuYuXUVupftLI+Xk0uFp2ZYYeXWQe5+LtIhT3NGbmzs2l3DpTFYdSzGNgu
	 wUVOiYOFXtsVg==
Date: Sat, 1 Aug 2026 02:00:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
Message-ID: <02e862d1-7e58-4667-b0c6-5e9745014676@sirena.org.uk>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
 <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
 <CAABR9nEKCtmkt1H+qe5UAf42MncOpEqX+pZ-AySTSBQ5Q3URTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xAM+31mrShMlZYZk"
Content-Disposition: inline
In-Reply-To: <CAABR9nEKCtmkt1H+qe5UAf42MncOpEqX+pZ-AySTSBQ5Q3URTg@mail.gmail.com>
X-Cookie: No shirt, no shoes, no service.


--xAM+31mrShMlZYZk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 01, 2026 at 07:53:09AM +0700, Bui Duc Phuc wrote:

> > This doesn't apply against current code, please check and resend.

> Oh, I think I already sent a v6,

> https://lore.kernel.org/all/20260609113836.45079-1-phucduc.bui@gmail.com/

> and most of the series has already been applied for 7.2:

Ah, I was actually trying to upgrade to v6 but it wasn't in my inbox any
more.

--xAM+31mrShMlZYZk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptRSgACgkQJNaLcl1U
h9AZIgf+I2VvIvetrhsSLnHXp9g3WcHL+Wsjy9AcG+YkN1+Za3p4O6ciWzgB/6Qw
7PbbJTdo/oMz4qHpXJoa9gGLa2rXnPLGCLjwDc+S2gyrDVFlhQeJCOGEsnT1SRMj
zgIn/p7JFwM90SYIyTU0X+we8Rshu8Q/ejCtvrjIdqfk10/3nQrmxVTQiIEgDYfq
JC+feKyQu8Q4OKEx2AHGMrvAH1gjCxC2hHCYF+VWRlPurwwC/40GQ6FI++DnjVLW
4dq+2DonuvGS5HbXCBazSBVZFMa/WHgYCyzpfo4pctjSx4IWfnzY0gu9TpsGaaop
MObGbMOYBnrliTQPAwa0uIpgXzZqaQ==
=eXpo
-----END PGP SIGNATURE-----

--xAM+31mrShMlZYZk--
