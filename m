Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31892ED870;
	Tue,  5 May 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998344; cv=none; b=cNtDJzW4OJOLp0o0HFpCyPibyn73gkADVhw8ILDdImqgjLFAjAF0CC3QFVfKjp3vatX78422sDHOPGHaDNvYuiNTYETK9Nu8XwjwQ5wUsBl9IBdD/kLA72E2O54Ij0KTKdxAzEK1c3vLw2ExX3MqdFeMx253BueGfKXxn4oNCms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998344; c=relaxed/simple;
	bh=WPu216Incjmw8eB35/lQ6mmp0B1xWpx8Vomx2fAa9Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpEJ0Egnq/I3qsfFXzE3n2dpsWxP2Obi9TjXfM55r+8rvcw15wenjy0PmOloyYO7PNEm2cCtMl2J3QwNCISvMJvdQCzaHBwBG7/CtRPXYE8kkep/XOqq/tc6EjKAk/oWQtnmOFJhVosfDr5U2ak3GdbF6iy1haUJLFCqJjEP0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oljCHmBF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oljCHmBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BE7C2BCB4;
	Tue,  5 May 2026 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998343;
	bh=WPu216Incjmw8eB35/lQ6mmp0B1xWpx8Vomx2fAa9Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oljCHmBFalJCqjOsNZm/6iDsv9Z/utu/RtUTfdZCgSouRJ/iXtBN51p0CrV9AvYeI
	 SjFBjFDFkfVZrC6oh97JlguqYhaITna9Yd3qwuv91OfPXGjwlXlAc+lBSxXwtZbzi0
	 bzk0K3FTIp4GGh+WIjictqdrIgXhbe791hZ6wBAO/m7uVyLy5P1TPja6XLw9Y//48F
	 C4bPj3AMUruUsvvhqgX1pi34jYq9dC58AvopzbteYOuuxvuKzfC4tC6ZDIVeGnWTvj
	 AjnWjRIQT5Gkv/g9uIuvolZyH+wY5QWjW6EzadQ6ig6HXvP+WXvRxpu9sPsy3REJH4
	 ghRRWFkavysuw==
Date: Tue, 5 May 2026 17:25:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQMa8MPxS board
Message-ID: <20260505-eleven-sustainer-5d71b389ac03@spud>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="veD3UL3c+j07JysG"
Content-Disposition: inline
In-Reply-To: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>


--veD3UL3c+j07JysG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 08:33:43AM +0200, Alexander Stein wrote:
> From: Paul Gerber <paul.gerber@tq-group.com>
>=20
> TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
> MB-SMARC-2 is an evaluation mainbord for this SOM
>=20
> The SOM needs a mainboard, therefore we provide two compatibles here:
>=20
> "tq,imx8mp-<SOM>" for the module and
> "tq,imx8mp-<SOM>-<SBC>"
>=20
> Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--veD3UL3c+j07JysG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoaAQAKCRB4tDGHoIJi
0n3iAP4jZpdMpADxOFMIh+lf54qGmc29o3W8mvfbGPUr1TaJwgEApzbZzyUbjw4R
J5kBwnbcl8PhWUs3oWQdq5DtHYfMvAc=
=Wzmt
-----END PGP SIGNATURE-----

--veD3UL3c+j07JysG--
