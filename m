Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93063E49F3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915096; cv=none; b=XQIplURM9REX2nanRW8oBzfHgj/dbWYtqojNI9BxFj6ELBVe6NVhuqPBkhJ9PwaA0PlX6YmH8Wbi3BtmRRGbvwlekvZrLaCwOvEGaZg2CRmQ5kS6/L2cZsaMGonmxbDAt/VK/gJ9/1UBiZMc3RD6SrgFPIGf258G5kXF3L9hgcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915096; c=relaxed/simple;
	bh=IiysvxFQKiyMoXV7CQZDMewNBxSpNElHPdU7HZDl/w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lE6MVfFyOIfYpTNNaTj6245Pn3H2HaAK+F8cVNV67UPCcvOc6WheNIcBoSNooY93bCj/5vTLNk4G0Um2k2MiK5prpKxDGIEns8rKatDoEpUBeyvzYIgd8+y5wAzWooqcd/lGhdFo712NGi35LLH6NcUVgua0v4IG3GP9QP56FSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YyhD/yUs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YyhD/yUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=o83C
	iKf5urEh1JCoodABYV+o+kUT7HZESetSTfx7yfE=; b=YyhD/yUsLPMc/nolwQlC
	Xvq6J6VWrKxDzYfjWA49GqiV7CTbDXXY3ZzYgYpH971Z9M1eZCpsC7Rd4KqdZyKJ
	IbiVNRTvDjZqKzd7m91OfNmQiaUtGUH8LP8bB7Tl1pgNc5CVesogPpRAbifZsPiI
	WWxCqlPmROdR7giu0BkrNwRvEMb8rTUqh+2SEYbOMrYL4aiMjKyTuGX+NMTyx90c
	9h776KBIztURXDfy874mNWU86I1EvD2m8/7CH0TXdRP3ZF0V+X8ThsgfHlCwTKzY
	OsV95+RPof0ZaxR1HH4ax2u8aHITO0ymoXgvaigqWwasKcgtsi1rg9GdMqD/GQ4O
	xQ==
Received: (qmail 3669082 invoked from network); 5 Aug 2026 09:31:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2026 09:31:30 +0200
X-UD-Smtp-Session: l3s3148p1@0nGHwkdY+p4ujnuk
Date: Wed, 5 Aug 2026 09:31:29 +0200
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
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Message-ID: <anLm0fgzm_TanuMS@shikoro>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VQ+T736CLi3i+e6U"
Content-Disposition: inline
In-Reply-To: <20260721082952.215691-3-herve.codina@bootlin.com>


--VQ+T736CLi3i+e6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		if (irq_disabled)
> +			irq_set_status_flags(timer->ced.irq, IRQ_NOAUTOEN);

I just got a buildbot report that the above line needs 'irq.h' to be
included. But I wonder if we can't skip it with:

	flags = IRQF_TIMER;
	if (irq_disabled)
		flags |= IRQF_NO_AUTOEN;

> +		ret = devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
> +				       IRQF_TIMER, timer->ced.name, timer);

and use 'flags' here?


--VQ+T736CLi3i+e6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpy5s0ACgkQFA3kzBSg
KbbLKA//WcVbwVkGuPRc8bj8aREUVY3FfdcHNy3nNdDGt8HRld15CrU/hCnYEjq+
R6WvTF79CmECfIFbtPka4EXS8TGuElUrrwgUrehuXXPZ39C9B3u9YEggepoEvZiu
aFLU/1sFmXcnEn+3DtSDVtv3Y5W2zW61j7BU45+Y/5SkxFE+7lqTNgCAIzeX77g9
w7ZLj0qWw4/nS9cJ0zHFebToXV3xR0nwMte5ZEgrSKSI11wECOOgX9VKbV2Sav/J
gVs6BFnTQSQrcb0dR3CvON2KRwodbQLrYKeqdIdZpd/TEPaGZh45QENnIiTxvGQ7
AgkdkANS2WYbazST2VpjGF7A4mn+GYl8uAGz9VM67z/p8H8w8JJbtETSFoHV2QAW
UyECY/4fHLz/gaisX0zFP1ciAiCrgTGcYxl+nAANuTKfWwP/wvC8tsdzXLSrL/ol
AW8dI2WqAh1PCHiEhlommo572JFU4iD+EUgeOMDlK15LlQ6PbMO7g30ZCmUsCYS+
/S+4UY9v5miCEYWRbEf2nwccFfL39ybYgdv5idl3HSWfcNNdh9I+Wtp+hq6W9nwv
3WJ7QymrsCrLAFroV5V2hm3IHtp7ymrP46hlNziBO8Tkv/Zh5ZUr/qIq3KCOyZKD
AgtEb1s7pkkEsvrmN6/lV8MHo7ZBppi6/S4K2JXeWa55Ir7ZrwI=
=h0pA
-----END PGP SIGNATURE-----

--VQ+T736CLi3i+e6U--
