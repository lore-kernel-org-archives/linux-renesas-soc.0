Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3F73B4432
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875464; cv=none; b=ONJfUcteLs2xeDVL8gu7ZulRwbVwI1tWzPxlCJGnZ+3QxwhQPCkp0ziFxUOXpkaGwkAM/VxE5C+s22jnEZguB472WmWmei8Fo9E1yOCs17uc/73YbV7Eu4U4hUeXWzd46W8bepMLIrbNRehVG+Lw4+zm83knjHFvSNm0PEs1HSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875464; c=relaxed/simple;
	bh=FEVcsLwCi13+tQSy5pOPAi3kFTUi4iMbxrJ6/313e+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQHsIlrTUTGAl8J4BD2Pyfq2pTqvG7bu3nrBi4nTfmuQjJE8T8qdGbE+zzj16OYjR/v5z6R/ZcjPHBU0HUM7s129pLDnnOpmGN4kP3LQ6VmmWSHP3BAF2wd3CyEE6xWP5LJY3va3ye0wTh/TlK+cPjoetYsA0+tmzY0ILJO8l8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FmOEo6mC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FmOEo6mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FEVc
	sLwCi13+tQSy5pOPAi3kFTUi4iMbxrJ6/313e+k=; b=FmOEo6mCQ3DcbiVSTcLZ
	AYrIaxf/L/NI6wCVFBdVPJsPK55pOWaYF5PSKF91DefbWUzuShhHr1hrhFNBGHmS
	AhmP8hoXig5Ja+gOvaXkyCp+lIJ6wj/teXDtU7hNcE2ySAX7MKw4iwIGEEQLspLH
	L9u/cGFtzMxv9ohjl0IvfyNipxskcXgi1eu+sVGZMzxNz1hQFP1ufOUKe27C1PvO
	ysrl6CWDo+Vc8UHRb/WhbO0pcAXuWOJX2KOau+qALlQ0oQ8h1FGLYrfDerrE69TA
	AuvJRj5VE+RsgvgvSaU5/zrKo7lk0TlDfwZgk2Tab3SyQMnqK7d4KNGD80glOMvG
	6g==
Received: (qmail 3520273 invoked from network); 4 Aug 2026 22:30:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2026 22:30:59 +0200
X-UD-Smtp-Session: l3s3148p1@8VRgiD5YVMsujnsQ
Date: Tue, 4 Aug 2026 22:30:59 +0200
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
Subject: Re: [PATCH v4 3/4] ARM: dts: r9a06g032: Add support for timers
Message-ID: <anJMAwn-ke2CnUx8@ninjato>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoFCxAs525i516L1"
Content-Disposition: inline
In-Reply-To: <20260721082952.215691-4-herve.codina@bootlin.com>


--aoFCxAs525i516L1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:29:49AM +0200, Herve Codina (Schneider Electric)=
 wrote:
> In the Renesas RZ/N1 SoCs family, two timers block are available.
>=20
> Each block contains 8 timers composed of 6 16-bits timers and 2 32-bits
> timers.
>=20
> Each timer has its own interrupt line.
>=20
> Describe those timers blocks.
>=20

Nits: Maybe delete the empty lines and write all this in one paragraph?

> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Same testing as in patch 2, same comment about 0x400 reg-size as in
patch 1.


--aoFCxAs525i516L1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpyTAMACgkQFA3kzBSg
KbaSUBAAoCiV7bvLt69Riujk0VxlkiX/AXRHP0Mog7A18gBhB+qoUgcZFE5spHln
05Xh9POGu6HS0vsY+8GlBkg+68J30753gmJ/I4zWA3KBrtHZ6Fz50SUsX8ZWJzfH
0sOAStzCn+PsRJjJ5BwAL/SIq6hPpc3CZEKzaduzwZQ3VSFuxAjO2W5GH6I9+5qN
iNgfF0kCUEhd5mfatzaYvimVLGdgrW4fTrCw6zRmpU8edCas/61Hdzw4oDLjEc2q
nKGfuw1qo5VzW2F/gYo5ZeJQ5YYKx5P6P60U56LSmimgQcpAQqpwUFqectpf2ZwW
14sdEblb3hWTtSMThPqDfJBKNCDNPWO/TVGCrf4iqUeNC8ZKFP3BfuLZryM1Ln3C
HDU3NrXzUIJtjxJSA0DPZonywCVJHKEEzFPjGJvtA7h8+NJJnwZSDFaM35nF9NJw
vA/S3Cat6rmDZidW+p7rcGOJJM0uO2iOjHx7RHvI4QXsS7++zUekSUKUY9oSeqvk
Ykr2DA5/lEhZpO3i3h2jAwRX25F1IckOY3yEsiaCEeUISVeXzjDAB+vLOEeKHrYV
JptdI9Ppnhy4kuJMTSSJoYI5lkYf0/vtQDWU2Si96uRFNckNOQHrubovL/hmCphO
4uWwvVROYwPOZr+GAANdUALR1tK5uP+0MgFm5h+QpB5Q+a/KlaI=
=+F3g
-----END PGP SIGNATURE-----

--aoFCxAs525i516L1--
