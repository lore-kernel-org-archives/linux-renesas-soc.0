Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E531715D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563855; cv=none; b=D0H00+/IHWxG6zgp8EkGmzVqz5Ph7A6CZzwKA9pC8sRkylwqLlYJIgxnHhTM/ru0G9gsryx6FuwCFvnW5YjrZpYkFO/m8kMPHYKjFrKVIkivxzf1NxKhbhYshQvq8zlIjZ7tizd3hJQ7YMHM8MdfvcvawHUMnNVrHiDlSkRP5Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563855; c=relaxed/simple;
	bh=HjH0PlsxO8s7oDDp68JIoh69aoxuIUMQkOj1o/rXnSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joA9dAO7QMVVAp5Zy8rjO3GzcTpgSfiUmFqPOfUP0tMn0AQc/E3GbckhXi9yEmomg0HnM7wqvOOPLEy0Vdxnlr9eFvcy9GAKOsWnnjLNPUlO6ZmbxnOT66FBTT4XXZQdgneeJPi1P+U9v3pxBnN/NJJIVOudtS3inksxiE9K/IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iMfxmCK8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iMfxmCK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qj2k
	twWWU6X9Cs0GARB2gW9h+Xc08Lyjv9jgptGctY8=; b=iMfxmCK8A2jco3XaITsk
	ROWeVGDHMvIV5Y9y8qJn6OIpmdOWJsAZ0DYiuzTJ4+SHUYGKK5neg4vORFe7BjKk
	DdYr0hc1FPq81N8s9A9lCzQotw/3aWtqcv2ZluE3CBywMBKnWRGelIULLaL3Le6d
	iS4MzjwI0hlxe/5Ivpeplamif9RwArbm28HcpXlClY/NGW8cg29KGYEE02k8ZBoZ
	h2JySC8ShNM9SxMwdz4gnspTgQfWWSY9XiFu1QY7ibmafNCbH4vUuA3lHCVenKEn
	Gq4gaGjIOTWaDb4CGhRGxKyW4OCWE8Vn52tSZ06EKlDp0yHzWIQYr9xQyNJ5KmFC
	sw==
Received: (qmail 1663475 invoked from network); 24 Aug 2026 11:30:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 11:30:50 +0200
X-UD-Smtp-Session: l3s3148p1@0kJMpMdZHJoujnvL
Date: Mon, 24 Aug 2026 11:30:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC
 support
Message-ID: <aowPSmdlgRD6D59b@ninjato>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lirw39oVAKH5wGYG"
Content-Disposition: inline
In-Reply-To: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--lirw39oVAKH5wGYG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		rtc0 = &rtc0;

What is this alias for? I don't think this is HW description?


--lirw39oVAKH5wGYG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqMD0kACgkQFA3kzBSg
KbbrVhAAiiRKx0+t5IvtZxQey4TU8Wt3QslVUS8qUHp8lfN2cg8CsBrFcWfzLBJk
jQ1W0KRkC8Y6F4/kuynmKLcgIFhqYQPCppY/A8x3ZUdL5eJynPkaVapVkT1/o7yc
D+0mWLSPpGdzVBQwz46KDVJjuhq/904sKG4sRaw0JskI/PC2SqQ0E6hgxkdaoIQ6
/omPrNbUqQPn1OayXgv212zNesjQYPRMxE26ReLpTcn7Y4KyUiri02eNOi3zQO75
y8NXR6R8p6C3Wzl5ErLjM12JHeCydAX8w7Xo0FQxucyMKSzKROsIfOa3wrAA8K0p
QZGoXeE9FonF8V5rgimJ65HsM8srFCRkEtg84Dv5aqbdGmI9iTWNP/LaJ41ng2Pm
5XA3rWnmK12Mdt5YYQ50IvZo7NRtDZHz2P8uRjoB87nsRty3R8FV3uRcbQUIUBzq
PVgzGJfhXtTCh2cUs4nbtRFn5wL6BwBP2gnNVeEuue/7rtbu81mFcWL4axyJ05hE
PD/IbzZ2A7YK9qKDK9stAuwQX2eW3Xwh40shqlN0GTcmGOuGaxhfOqmqUkx20gLB
pD67iMjH0vx9AlXTmNDxNFegvBujeHMbAV6v8xxDxiFwRA1hI23WNr37PbqxQvIh
lUzcmxadOLBmERd/vS2ZyLKCXQPfNya+JuXrzdEPgkicGT+AR+c=
=RdTA
-----END PGP SIGNATURE-----

--lirw39oVAKH5wGYG--
