Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8440910B;
	Tue, 19 May 2026 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211888; cv=none; b=HpGYHOjK/LtVYcpo9vPGfezvl+eyH1U1z3RldLNKQagn09rgJpp/4F0q9FrdAouDQ1vB/7McG22Uc3Q05q3NE5yX++DqRHUU2cfKW7P3+A2WgBNROo8upbKPiN+inTwuMKGgBFvOtUR3WZqtl/uklNAorJOF8tojkjzGc2ge6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211888; c=relaxed/simple;
	bh=wdSAoO+zV4jfBKXi2yopcIIkgL/D8b+nfqxpH/6X7Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNcGmRDgKBosmIeW0ovx+G5Qea5JjAO9ud+dfsQFP3wpBDn7+xEegyisZjAHnbycoazpFcuJnj9PobmZUyPXuNLYwBZ8qvZTXVJ9l3wQOlOJ80wXTPqT4fJxPo1VWJ6Dcg7xiD89RZHKgKD4NKvIPK0eGgL8Rw9Ia1y2cP5Jbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnJxjRCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnJxjRCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7CFC2BCB3;
	Tue, 19 May 2026 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211888;
	bh=wdSAoO+zV4jfBKXi2yopcIIkgL/D8b+nfqxpH/6X7Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnJxjRCVKzlsywR8BuCkhaQI4bGWQI57gFhrln7i+pUj54So+nEkNuSjpYcram3aB
	 zIq/3il45lff6qZmMiq7RAwj5pgQw71hJP9mFKpBFa2ubMCknGq1z4mieH9EPpFmEI
	 LbPeB5+g1SuXDxpnTA9PK1GUjLMUQeFEwbpK/9oU0e8i87MTACvyu9Vt5hIhPgICSp
	 WQJ6C/Y6YVyH9CmMmFqfDMvKSf+ebo14ka4AerSi2pH8RcexfyW5idKV7qU1uMYE3V
	 WhniqKgVaQLyw60fhxuPqx3zpppbuuHvtMzwstjM7yd+3pcdusOyDLgplxW/yfr3kN
	 9+Toe2vln/6Zg==
Date: Tue, 19 May 2026 18:31:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: renesas: mfis: add R-Car
 V4H/V4M support
Message-ID: <20260519-crewless-avenue-a402b90773c8@spud>
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
 <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eIsJkIsbP/VR6HTZ"
Content-Disposition: inline
In-Reply-To: <20260519075620.4128-2-wsa+renesas@sang-engineering.com>


--eIsJkIsbP/VR6HTZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eIsJkIsbP/VR6HTZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagyebAAKCRB4tDGHoIJi
0rorAPsG5MOqSXqSR1A9tHzKzbEX0OxGdOKVtstJhA2XuZX1ZAEAyEOM/aUZRzMO
myCnWtIus6uWHOkcQqjsWvSUM8qh9gE=
=6xzR
-----END PGP SIGNATURE-----

--eIsJkIsbP/VR6HTZ--
