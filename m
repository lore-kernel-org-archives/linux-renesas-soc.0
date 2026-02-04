Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC933F365;
	Wed,  4 Feb 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228197; cv=none; b=o3xyPnsGgBB/RSrwODs36+ngvbRfXzWAbMAqC0/BnPn+W5vAN5npiYGuho8Ojbw7mfRLmXMdj0JixkbsHtmVKwt9psOxUV1sk5GueZVxXNKTILzdvPGFPyEPowxasp6eMxKvpUjJ+qGMdA/LB1NHZCYZfM19UcNmBtUdPcJfcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228197; c=relaxed/simple;
	bh=2OFYk7iX+psFsXH0hDDyLMi1RI9ZoBRz6/hasMLy1Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQaP9w3usTEcN1+ABwgyn/ZN1i2n2Rei/qE+53Zv+VZsEqDZ/2UlQTZ2t9AE4IW3XmA240Xt4hgAXKwCvhpzY45UDDThT9xCOnlmsugvJVQSSIFGx9RgDwcjGGR+Nbp7Fs4wh4jxBl8J3UP0xSsFZ84Bc6S5uco2nE5c7WFQobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5WCtXxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5WCtXxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A84C4CEF7;
	Wed,  4 Feb 2026 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228197;
	bh=2OFYk7iX+psFsXH0hDDyLMi1RI9ZoBRz6/hasMLy1Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5WCtXxdtE+gp0mEQcA5JO4wHv6nTu1qDN+eY8uAOl1EeiqSmy6lmzz8GZopUZWls
	 OpxUfQbbhFEZI+Ii3ucLAqL4BzhbqUZracuhKXWKjLZ10ZKSkUJpt8LDxi1gXoZHVw
	 yQtAszY/Fyqkl5sadSGQGoYDV1L3euczwWYRxFPrRfTiHqUIaWGMJkDseqfHqQ75g8
	 PQkrLGqeu9QlQnVrqJymR+/nmRAn9W2bbt79CRGkuIwL4Wy1tTkz4YgV0OAuj8x9rX
	 zarFpSMpwuHGmV8YqdzjxJYTXsGow8gHDWgvWO+zGhY5zYZI7XWEOvafm/Pe9jfZcp
	 034gp6vk4+PZA==
Date: Wed, 4 Feb 2026 18:03:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: soc: renesas: Document RZ/G3L SoC
 variants, SMARC SoM and Carrier-II EVK
Message-ID: <20260204-edge-petted-56088f0ed8dc@spud>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qSR/IEu8TORPDLog"
Content-Disposition: inline
In-Reply-To: <20260203103031.247435-3-biju.das.jz@bp.renesas.com>


--qSR/IEu8TORPDLog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--qSR/IEu8TORPDLog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOJ4AAKCRB4tDGHoIJi
0tSIAQClYNysLvX4IXUpz1z/6ZsHtN99xPP6pDYi2xrwr5wagwD/VOhiWhvs4+7q
7o3mGKeoqg/xr0FHZrBcDqZkBO1ZkAI=
=6+QS
-----END PGP SIGNATURE-----

--qSR/IEu8TORPDLog--
