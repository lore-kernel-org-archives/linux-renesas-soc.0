Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA5443E2B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139108; cv=none; b=KtWyf3KXZH/w7fB67blId5EszN11Y14MPrm8NPBUKLSWzCkutvduWR1iYpwkmm5ZshW8v4CbjGA2HOZwApQiwEvG0J4l65Cu1/FPFPKw+yOgOVtPT6EWb/4t3iEOj+e9apjQGn5SmAN+OYZtEzcMF8Np8uXsxPmUVijCc1C8GrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139108; c=relaxed/simple;
	bh=iF5GZkiz2K9L9RPtRHO98UAmRQG3zvWaAtuv9eQrlEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG1Kb1eTbkgJF2bo2VO1+hAZr/dvQvMQdCakieHVej200D/vwUe42uJ76ky6yrivzJdFZpjZleqVnTojsvSABbzaZNfz66hD+gS7zyA4jZG0qad6HjUr3dPcQG9clPMHJQyJlX54XH4RSbGeDgAWFl0bHpJPSyqx2Nd8yeCqZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=U58LChdN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="U58LChdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iF5G
	Zkiz2K9L9RPtRHO98UAmRQG3zvWaAtuv9eQrlEw=; b=U58LChdNHK6QyaMceBlt
	F17XScMZuCuTfd2tnH0zZ8Q5EyE6ujxg49YOrf4icN1qAdsPkBfDuwHxPF0dXAR6
	xejtfevHlP95V5qpM0vfnODjTOn8w9pK0GaPjy5EDAg19QVr6s4oj90z7ERG2Jx4
	+2yil5jvDDSb5LzkGf/z4t/DkneUozPM30v7/r6sfdcG44W/l8K7BvgxRrUJchm5
	9OXFaRwG85CL/8K/OoKSks8nUmHvnZOcmcFFeJecdwCmhgXYGxy3vm7yXPC7vhIp
	U8kCS9CAwakPAUiCZLCmCAIXDaNBRAp15I12yWjfhY6i0VnD5J490fTbOcVrJ/CD
	fg==
Received: (qmail 777209 invoked from network); 15 Jul 2026 20:11:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 20:11:41 +0200
X-UD-Smtp-Session: l3s3148p1@Q7xOQapWVohe276h
Date: Wed, 15 Jul 2026 20:11:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs
 on CN12
Message-ID: <alfNV-_Cb3WlqiHB@shikoro>
References: <20260715122341.47838-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jqYPwWAJhEHCrDOt"
Content-Disposition: inline
In-Reply-To: <20260715122341.47838-2-wsa+renesas@sang-engineering.com>


--jqYPwWAJhEHCrDOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The snps,dw-apb-gpio driver iterates over its port subnodes (like gpio2b)
> to register gpio_chip interfaces, but it doesn't appear to register these
> subnodes as independent platform devices.
>=20
> Because the driver core only applies pinctrl-0 properties automatically
> during probe for fully initialized device instances, this configuration
> might be silently ignored by the kernel.

True. Will rework.


--jqYPwWAJhEHCrDOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpXzVcACgkQFA3kzBSg
KbZBPBAAhIUej7DtDgk3O/WdyjSq7CVnI57qzhPLhfmY3oRm7+e2bU90V7pbRziu
jJUhL4eFDArC85u8mvZi1n0cKWCGnpgd3ms5YEfkDDi0YVTZ2CZ3EbVKAGwVF92A
iJGA+uZVawLilCzBacDACfJRzTscLFL01SScD8EEFv56zt4ljQ+H3MPIukHYeXl/
73ZgLiqlSx7nwZsLbyQDtL/j5r50p2Uc0WwiWiw7YSAnOf1X0XjPnaHbJ6ElzW4N
bdKyAocR0Br+5V79d3BljnrVyBnw59BDrgyLwMe9qdSis9AIY6TDaWXslDt9JFCa
nt/DRRiYEDjzchDBZpbpVLzwSHxa21P8uDtCaFurcF50D7w3fqY+xFIQBSEJ07nn
fJnbf+yPmz8Mo5ihMDe7Z3R1CY236XPUHc/GK1lw+UhZrTRQpVQ2J8qAQtygyuac
1IaRpUFGyUlpd/IB7V2S4XvODv8TdOlcIWB5lX89W5CPektVT7KF34VOaG6SuyCH
d5sQtp7FU3UI4Ih+GJy6T+iqB/Pv5xphYtcXt6U8arpJsBXkfE9r6nVISQQv5Ncs
p4lMQiUCORXQBR+L/Z8UcvebY6oB2F0cd1Xqg9djovBXqCAv8BtfT5xC0mLxvIE0
2CO3pbjygW/wBC342NbM5KIbZzWl2KZ+a5PBBRKQomMDnW7IH58=
=IsHr
-----END PGP SIGNATURE-----

--jqYPwWAJhEHCrDOt--
