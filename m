Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3C31A576
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424414; cv=none; b=KeD8oG7qh+evFWJiYP1XOT8uz9lgfirt+WNgLB+QF3qbt2C5GM2axxuduEEzw3Ka85RCZkYJKM/CIXGfvZW1iT3pLzU5TmU8z/4ufOl4l9aSjv3z/ubjm9MSf9j/Ohfuq7SlfxB9gG0c7Tl3EhNnlWBBlaKiyFx7BWN5oVneAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424414; c=relaxed/simple;
	bh=d6b4cyFsfPXTRT9lZba+sdjNjulkiQKqJacuuZy2VXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMchcEcQkH1Gk9SC47idKZUxoIy4F9xuPukLEkPWyVM6zdnIjXadKjmPznBD6lNdg+xhIcDtjCbbO8uaSUybnpJk5lrJWKDW4j5LnWpczT2a6KbpuFaFx6uev6h5eIPebaKrACU59CXmsWLNSZQ7qMBajtkf48aTs5rvvGvsLYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j4nUa721; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j4nUa721"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=d6b4
	cyFsfPXTRT9lZba+sdjNjulkiQKqJacuuZy2VXo=; b=j4nUa721i402Iz+139Zy
	2nKCA7T1qxEZY9nUCz8des1ohsefcC62haKl2F5LaskFX0OEWuo6FA7jWBjsMf1y
	th5c65kEQTrL7ZTjstxKBHlTjtAs7LCHa/YPDSfDVA6HDc7uAJx21CmSPa4oBQKg
	jGsPyl53yMOX5qPocIoU0YERL5Mm4FSiHu4wQkxep9nbXFmrRxrJZpPS//9fNP2U
	zNhLNqS5BTl9RGVqm04N+hCvD/Nx9bDNzkfZVKm4FgxB9Q4us2M6ppu10xKDbH6d
	FI3aBdo05noYkUNQwUtJj2AGvm27fYI/WWFXX5L0bxTJ+U4DY1mYnxfEMo1aPfPr
	yA==
Received: (qmail 2987235 invoked from network); 2 Jun 2026 20:20:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 20:20:01 +0200
X-UD-Smtp-Session: l3s3148p1@CKICXElT4tgujnv7
Date: Tue, 2 Jun 2026 20:20:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: renesas: r8a779g0: add MFIS node
Message-ID: <ah8e0OHtRoUuezVh@shikoro>
References: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oWn2hnaWJulllCVZ"
Content-Disposition: inline
In-Reply-To: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>


--oWn2hnaWJulllCVZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 05:32:22PM +0200, Wolfram Sang wrote:
> Describe the MFIS core which is used for various tasks including
> inter-processor communication. Interrupt numbers look irregular but they
> all work as expected on a Renesas R-Car V4H SparrowHawk board.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Damn, messed up the ordering again :( Sorry, seems I did too many things
in parallel today...


--oWn2hnaWJulllCVZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofHswACgkQFA3kzBSg
KbYRvRAAhezPXHcXAktrYqmgUF0CYeIcTpHsicaLDf//BioNo3RiEgFMef4VdFwo
Fo5Msa6m0UuMkagDyJL7SAYLbQ1yP1p2ubBbWcw6OThBIwRFFuFHhK8TBN0pMioS
xzdwqYeWiHYZ8Jmnrv1AaScDZS+D1UGJkkaR80RvcArLO7ZLYJsqlcx9e/GbaAFJ
cQWAbHGWqIXpJKj4KycmV+9bIzLxIYAAQHeO8HD+zd5SUh+Lo7+TIFWynxhr0qLU
QMdzHkbZbL/IGRGLtV1igaPXdHJ7Xv1h54cucSEzcLAY6hTLKT2iMy/zVy42pqNw
QaKu3KWTFYPBEiHImKaF2okFJGj1W9DRS+lj4OL60j82C16SG3MNM7DmzkIu+vro
MIBJeLeulmEOfMXQ0H2X1RCb5LyFcT7xRIKe5X+49KeKJhKpaKeVu8vD2F8GFTK6
hTOrxVUaK5etnUktoTOHkyi06lJzmIlLhLbL9++fXtz/Z6WLGFPr5uuJ1xwSa0qx
4JGFddRMWJieER8xwbHFYJZ6Y6JS3S7OIoNaf2xUzZubiOBc4cL/Fr+WElvgXlpW
RJlAeQ6cJsyaSbIGUDP4UC4anrBPbPR3AU+tUokNSthsol7BnXoTG3xHyMG77NnZ
ejUTdH76+8vv2pwIijjM+aPvDoB4PoyLxCqgbTIDkJ3nm5X+cRE=
=e6OM
-----END PGP SIGNATURE-----

--oWn2hnaWJulllCVZ--
