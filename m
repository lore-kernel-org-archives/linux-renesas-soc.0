Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0B3F12C8
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873990; cv=none; b=Fg87S2umm3Lwo098p7UG4GK2gzVqk93cQgx4excIX4US7xZyDynGhs7HgsekxMpr3TK25wrnzNDmG4y+/0SY3oZmVoE8VeA0FqI1kEYQp14Ydj9d3ymnMtZX8GnUebeZ4hnxupGP/FwS28gCGRONg9bs+FevEk6vMPvysmAIMDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873990; c=relaxed/simple;
	bh=gD1MfLnCAaFRcWetE3NiZig5k758kytS/smQILHwkGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXK7NYOZBC22KW88A1XF4wAashoEWzb5GROPacnQNso14ZdWl4e7pxARm8dUCRdvt377AurTQA4Wys66JF9bkN7BJD8wTet/xYPXB0LSAEX+4GzlKiokoRXxsE+/bbP1zmDDI/is6K+z2bvWPAncYJUS5yDA6s4tapuUt7p61lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WiIjDqU0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WiIjDqU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wr7q
	ld4CYOnNrQHlbO9S3jk20nz81d8l7qEVsAvo6So=; b=WiIjDqU0OSJi6rAWvewk
	ZwxPwNtbYKXnpmQBIn23GQBYqz+FlwdESEodfvc8t/iuW0wP+e0gvpfL1yJIdPtC
	bPNLXJT8Y6titQhxfi4t+9FqbDkKTN3yQLJN7EBmXL6zgIQUfwBHELHnWhujzBF4
	erp2RF0ng7khbrg3I9hhd8W6dNRe3K9/SVRpnsnoOjVZjVSqGNGjFmMiEPCnyTDy
	jUAhmV2Or3qsb8Pkw1/SmncDtFqGApe9ldENlYquED2VKzGrjUciU2ls7G+aWIBt
	zlyjeowcnbXJItqsbcc3I11DuxpuqGbkCSptQbsaIqHhhlql6igyMFSXdAOsYQqg
	bQ==
Received: (qmail 3515143 invoked from network); 4 Aug 2026 22:06:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2026 22:06:16 +0200
X-UD-Smtp-Session: l3s3148p1@0iryLz5Y1JsujnsQ
Date: Tue, 4 Aug 2026 22:06:15 +0200
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
Message-ID: <anJGNyNxcSAwylK8@ninjato>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K3YzAXkCWFXIec1c"
Content-Disposition: inline
In-Reply-To: <20260721082952.215691-2-herve.codina@bootlin.com>


--K3YzAXkCWFXIec1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:29:47AM +0200, Herve Codina (Schneider Electric)=
 wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>=20
> This controller handles 8 timers:
>  - 6 16-bit timers
>  - 2 32-bit timers
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

In general:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

One nit:

> +        reg =3D <0x51001000 0x400>;

Isn't 0x400 a bit excessive? The last documented register in my docs is
0x114, so maybe 0x200 will do above?


--K3YzAXkCWFXIec1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpyRjcACgkQFA3kzBSg
KbblfRAAp6Zw/Q5+g6+t0gQ6a1Ir0bRwdsP3ZOHD/Xdz/uXcxyOroVwP6+U86jrO
1UK5H3qTw7Ah07iWEKp9GXk3czVrvrMcAua0G/DhLBXU6E9lu2npWQoVeb4zaSEA
LOtzNATycySMssxdU08cEWg97/+LMTsGoshphhzkwdLHruD6lwFp4Pd5HKzW6JB/
phz4mgovybDKS6vl2kIluFpTjKM4JJvwZYSSIIuyGevSHjgcUb1JESUnvT2Qf+23
jmY9DMMQiKunWeDuS1i1iFXGT8Va8ah2HCqFO/CEAeF64dZ/AAigXbxMcfRMcvLK
abKi4Y/n1UD1JD9r3JL4MLLVLHiZ5ALsYFSjMI/pIUMLy04O48kdPdcINl/Ims3G
IFjQxxSqjpIu6S9fc2EUmb06lai4WtHkHryBlltNJd8uKhg4pEPJnwJqoQEFYPqc
cPXWtsNDPdb3LD4HEYJsAzj0IgRoeG4AQ2BfmhErJuyMWFBlVJZkqbLCRiR0a5CR
maPdD4OdPxENbV+UBbZCsb1gJxP3uN0oL73Y7Frkm45hWXTkelO7cYR/XKWG9TgE
bkYM7LR9JLukMahPEm/MAeTT/Ew8ctGRw5YHqDZ225deETZx4VEwNP/bza773KZZ
Z24UFLUGxF22qp/V6PoVpHJQPbQCnyqaA55436URZD5fvak2zr8=
=i0mk
-----END PGP SIGNATURE-----

--K3YzAXkCWFXIec1c--
