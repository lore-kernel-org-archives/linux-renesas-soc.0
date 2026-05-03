Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8D2248BE;
	Sun,  3 May 2026 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769863; cv=none; b=YK1G3whRuJkOdVgOMJ7hIXGdbXJPYL1cVDNYveDtuYl4Ufu7+AKUOn7Nt/57UU87BK/6BNSTgPQmV5mVgijLreboLM7JiYyvd/FLqsIRE3OsRbttJzFgLII3iErtMQLYWPQgsHrEMYyan3Y10a5aVtpMQzbjgNrXLVW2gBZsCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769863; c=relaxed/simple;
	bh=ipwOt3wDcTRbnf+Oq7x+2TSaOrUM5aQj+DUvcadvQsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/BIox9C3MxMD2xrNdZFLTiF0bQmEpL3CbHBhQOfyKlqaNdS9ZzqzBCz60yXTYIucnYPVwCPNDt+VULupFq6BVX1MRgEJD3ZUQcbad95q0i4foW3rShx8QbRhoH2cUfMDM4BtegbkwSr2UrGY0O0/HYn2UI1jrJY6X2BZXPQFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9IJrr11; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9IJrr11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C25AC19425;
	Sun,  3 May 2026 00:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777769863;
	bh=ipwOt3wDcTRbnf+Oq7x+2TSaOrUM5aQj+DUvcadvQsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9IJrr11YeHmjMVowngVy5iDRggjjWUvZVgdAPPPbWPqbIgUfUf6G7bQ7qnyPcHnX
	 DerWXJdPWM4Msr1RpaNIrjX1mNzvOlXVvwBHv7z98PRJr2FI+nrZ1hqzp/A7ansNhq
	 JWo0q8kYJsPeCFOmRWYQBvKCPZc16ZcaXGYKDMrKM5u9SEXvy3hwCY0yrTD4XmP+jH
	 bFoozIT1biXlbWDXvlvVyKHlBfWIK7rPRgIXucwNvliKMKYM9k/BLDScEJWNy/Pyrb
	 Hz1d0wYdleY2iyhXZCUJCzWmYTK5jQQq4tneuX0KD0luheNqMIzK99D/xXp9OZGD1M
	 kYQA5HdMJ0EVg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 347D91AC5863; Sun, 03 May 2026 01:57:41 +0100 (BST)
Date: Sun, 3 May 2026 09:57:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock
 output
Message-ID: <afadhRD4b94rrNZ-@sirena.co.uk>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
 <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N487/py466ktSMaf"
Content-Disposition: inline
In-Reply-To: <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
X-Cookie: 667:


--N487/py466ktSMaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2026 at 06:07:04PM +0200, Josua Mayer wrote:

> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
>    clocks:
>      description: |
>        The clocks are optional. The RTC is disabled, if no clocks are

Should there be a requirement for an input clock if a clock output is
specified?

--N487/py466ktSMaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn2nYQACgkQJNaLcl1U
h9BnHgf/Yc3mBMSBK/IEjBrrdzGboLZ+aDXwV/yLz1M2v5Izmc8/8CN4aOvRzrkH
wJqTgQPJ4lIT0wRjCp18ww+aruz89QU2AaBv8PTTGTb6mjXWr17oQZKtCG0Nmtm+
jDP2wz6KZd2spkk/ThgtZZzSMh2KIV645ItJ0JND9p52Kt7dxbO+sHC3d/tYM3aA
Rnh7fVl3LpqL7EhYZHypaEEC2/+Z8BdbNcVp2x2e0Q6t28a3Fzd4wTev6g31vg2C
CpbqzJhOUoWoZ7wjusIkLBL9xpnUiAq2B7+AnMA+/MNDE3fPJ9fQtu40NyK3/QAS
Oo9tNgz+3fpY0H70sMW0KHiXG/KZMA==
=mkq7
-----END PGP SIGNATURE-----

--N487/py466ktSMaf--
