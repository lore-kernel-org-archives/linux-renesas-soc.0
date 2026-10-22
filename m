Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663129;
	b=WR1IZEV9vD61IwE5gtwl/scKhH4jbKYTdoUW6Iv16k+SIqtas9gd7DELWWYGHd+Syc1S
	 uOwkH9YbFeZ4KKAE0yTuRp0s5DuOsQOXBHx4+Ir7hSq43Xq5Pbp6TKHpap1Ej05bs/O4V
	 e6/98r0nmpus4u6rLmxViWl246YQZA4ELZns8JXvsdrqWsIa6XU5pV2mo4CgQZyfF+gUt
	 TmM5C5fgGUAPFKj8etOj+mWpSjgewMwRFhqPiAIxut/FPoaS/BCfadM2wETrUP8Y2gaaq
	 OmOyeN4WJdzhqOMmuL5nVECWV8xy0pOfx5ei0O10Vu23LZ0CV8djNrWbCW92hoT8FxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663129;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zI/Avxi1+u+wYsWO55uH2d8mbN45ZGvy+SEZu2RrbOA=;
	b=veLJ2hoo5dZpmXKvvrXsws89OHpmvjfvPFEGVDDL01eAt4ZDHQN8Q1R+Jqhz+/bP1dAy
	 KtxzvZxHwms9ejTdWxk7A+tyaT0IXmv2AK5XelLiT9eLTaxnMpGB8/VqSeaDhHGr1GdEO
	 bHOlVnqwtXkHdPUiI9cb0q1pjiZI4gKchrPYFt2Vt/FQrOCXgBmdipM2P3CA53LACtHp7
	 5mV975bOe1Fn+YJuYXbIKgmlnRqKMsSDJveoe/40/AXDilRC/Z/mB3dU+wig+dU1SeW1E
	 ebzLfFrJq1+Rju4Tjnpy7c3N+47t4pZVR4kPy7iaGseasijvJdgta9jpKCAaNGworDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=EmRR2igZ;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25E606A31B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 09:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E25E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=EmRR2igZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zI/A
	vxi1+u+wYsWO55uH2d8mbN45ZGvy+SEZu2RrbOA=; b=EmRR2igZoRtiK64J+yWM
	L8b40xFWg4OkdiEnJJxzsQ+28LSV34UeZ2rnkgt+bPWbt4Ikz3K+xLDNo3AmbVQe
	W+JYlRWbGoO+DPyN6p9JEpgyiLj0WKLgyFR/+9h9LLFqBYHAAMuPkklAEtPxh0GS
	Hu+VoM8+sLvoP70CCfeRC22bZx0L1AIzfTWslk+Naa1QDuePKwPjnV+NHLWYFkAd
	2pTMRCg1xv4clOZalUN4du1iOYJ4yBjkF23Af2Xi7o/MPGctfXsxBEUvVlgjdiSZ
	oQEV03S7rdrvViVaTbVJpaK7zhzwktB63nD5rm0oti1MwYRoA5r17UKniyC62JLs
	Zg==
Received: (qmail 1096776 invoked from network); 22 Oct 2026 11:58:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2026 11:58:45 +0200
X-UD-Smtp-Session: l3s3148p1@aR/B6GpeKOYujns/
Date: Thu, 22 Oct 2026 11:58:44 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v24 10/15] mmc: renesas_sdhi: Add write32_hook for
 CTL_SD_CARD_CLK_CTL register writes
Message-ID: <atneT7Q7wZ0qHrC5@shikoro>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
 <20260820171657.62815-11-biju.das.jz@bp.renesas.com>
 <aplMNoRlIYbVZH5-@shikoro>
 <TY3PR01MB113465A077155B664C7B4502186B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AX2ahRsx66rUrkGg"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113465A077155B664C7B4502186B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>

--AX2ahRsx66rUrkGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Have you checked that all SoCs handled by this driver support 32-bit ac=
cess to this register?
>=20
> Only RZ/G3L has bits more than 16-bits for SD_CLK_CTRL,
> This patch is a preparatory patch and has no impact on other SoCs.

You are right that this is only a preparatory patch and my comment does
not really apply here. But whenever SD_CLK_CTRL is accessed later with
32bit width, then we need to check if the platform supports 32-bit
writes or if it only supports 16-bit writes.


--AX2ahRsx66rUrkGg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrZ3k8ACgkQFA3kzBSg
KbYJyw/9GIMJOqMX/IA36J7iN+qASBjPMGBFTk3Mc7xWajqJ/TAs6w1K1UGZdsO+
9tU/KadWE3VEYjRjExS0SFD4SyvXTlTpL3twzmvHkTCVA+kUGgVLVz4abQWQueCO
zzgmhQjvYb7olvvioGqVb0TiRVywPrRH/1YM0HmbokzWRm/hVumNUPHpc8mwdiPu
ijoCSKgRFsIHgZ3N52z14PDZJrdnkrpUnqRo5wnj7I4DE0VL2neCXqD6wD+BX1lL
Tx/sCNI0cy20Lrm6WkcwoXbtETadtMogZe+KxnacS/HGoOQi2RWn2mw4t7AyP94O
R41iei4o9dFOugc8w2i/kL2UOfzdu8hGvNcPP+MRkmJFw2CpXKmlrqQ4O95DkY+s
Tk6fCFiFzWcDhk+DF8Z0opZ5vRpKlvyhe8fSXIOsXWthIqQDDBiYem3RAad93qsB
oHJJVGtad5eBy8Jpd6CzJC3tY69nxrMZBAat3OxfvOEj8WMiPzc45gckMYMNZ3R8
5A4O5r4yB+XkGpboFBbqO5rhUunVuFDrSKfOzx9xrtQBtPPxttGTW9oEp402JfKr
WGnGDyZhWwJvMxfGBf5x+MzKaS3tTcLsNWoxAo9TVF7EZwlKxB6YxCBj/nm98BfL
J4TvVKbddLhxoKoodqNEiKwBgKZpX9O7DY1hGJX0mAEFDpCE2jE=
=5jyQ
-----END PGP SIGNATURE-----

--AX2ahRsx66rUrkGg--
