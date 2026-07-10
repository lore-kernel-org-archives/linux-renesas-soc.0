Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC8434408;
	Fri, 10 Jul 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703031; cv=none; b=cVdPhV2ma1l+LQo1s9TDEKE7n66ccUnm7oH+AzLwLcCd0HHxuAiz6gPioE7mFSK/eAoryt0nciQLlOEBfzw1iaAA+f8hSXwHWrFiHPuGScxnGhMbtxKaUbbPqTYe6+vt7fIARTbylzvBPhneZzA4wRpsww9mpJ4FDdCgKLmojAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703031; c=relaxed/simple;
	bh=XEPNxeRC6JA3l5LDOfmbtOD1XiOiJOftUmu27yGvjpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oq5KS8t3KxrSO99p45u8VKVNpGEd7mYRjQNPmfIhWSp/l6xbQe6j+OtOwbhF37RVjXHQMNOYaLs06RPGJiF70FDSs5hiBziXDf0KgNX+CyJ83tX2DFhUAbumZKjcWw9BXzGp0jrn1td3m5D1t5Amsn8KrScARAMALkD601hfOsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDv/PS2+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDv/PS2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E391F000E9;
	Fri, 10 Jul 2026 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783703030;
	bh=XEPNxeRC6JA3l5LDOfmbtOD1XiOiJOftUmu27yGvjpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XDv/PS2+Zwi74z1ye54hGZXDBWN0fkby7w5TGyBEV2pW2QWf12K7ZpVCDZ80RA6Of
	 SbLm2PLyjdtKtrCnVed3TV5YqKS05ki78CLUjuNzOIawQFdniQIGqcdge2+P3TfUcH
	 iBlZwVAgNqxsFpvn14N8LI2v39Ii7DTDqZEgtvsaUh8x6m4Z14Y6h9ftkUdZ6vmZWI
	 TGHuANp+GuiLP/fHZ8CBbaTqkmA3KFJNbkcw8CCJ9ujvfoXVgcGnrUUkqQIv4Z9SR1
	 ZovhqK+qyemkxTZz5DKInMdlkpJZbCkJY7/GIWt61PQcgoAj3LvNe7UFczzoa1xfn/
	 M+ZQ4MVjA0AMQ==
Date: Fri, 10 Jul 2026 18:03:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Message-ID: <b29edb70-70d8-4223-8de6-ba1366878eeb@sirena.org.uk>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
 <20260709083108.108370-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UvvoCiyKpGqx76hF"
Content-Disposition: inline
In-Reply-To: <20260709083108.108370-5-biju.das.jz@bp.renesas.com>
X-Cookie: No directory.


--UvvoCiyKpGqx76hF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 09:30:57AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
> has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Acked-by: Mark Brown <broonie@kernel.org>

--UvvoCiyKpGqx76hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRJfEACgkQJNaLcl1U
h9A/+wf+JwAuutVeCEMgLrhOxQZe7BpWuzUHabeyzNh9jB/EVfTH6sWKdcieX9Hy
A4bWr3GwPI7IrhXNCOfyGCee/MH/ZEpVSew9WP7I8ZXUKN99+SMKTF8IqFhvk4kN
t7HAePf7f9ZjGxDDusoZAHQ6oYAC/OovYEfyYJzH7iS++IquNUV3afHig5wT0UoA
etBEIptpy5p5XJYL/evNgha0Si0ZN46mf2GsSQVv2UCNjBOXPDMeQgpP0IpbRVC1
8m9wPVOrsdpMhwWzSmeUlr9HXrmOPh/YyqicYZ26eYtU7Kw9SI5ngkoV05HFLSxc
WycPYQFLIsBNQe0EoZVwNnStyayw9g==
=UYLi
-----END PGP SIGNATURE-----

--UvvoCiyKpGqx76hF--
