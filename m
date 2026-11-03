Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702195;
	b=PkZ1JlbVv2yLd3IfFthXpCOJfTcF+d/trfPs3ZK7r6Pmssz73QQUhj2nIJWzrIkb+Vzn
	 ECymYadyyn37WfeS96QMFzR/UgIY410YjbKgsrd0mzCb290foxYFVB2x2R5T66KgPMe71
	 y3e5jRYprgUeBHXO1vCHy/Aim22U29K73s1dLrCshmoY37Jl9WB5gwKV7Kr2f2R3gD/kn
	 SwiZoOcvDQ/8gydp6oPcbtxKL0PdqA0bLOmf/My4DZGnJmFZ+6rpvQRIPIqtyeTvMNbU0
	 X9wW1hV1LcCTPrCVHreWdYhxbkCo+t8TM/QIjt5+FI3WOrmbSismGfUSzjX/7n3Kvkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702195;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=lTWGPJAHq//Rmt+lKT5HqcL1UWzsOvq6MdEoTtgx9KM=;
	b=ByzkdkHYvMjzWDQzVfyZiH+/lxptRhR9P0/n6sWyC3ldYFGiOed0CKg2N0Nr4Z0ftuLU
	 BjYNqytG73+RjWFV+mVM21ioennrDxyAPSeSzvs2a2od0Cm1CzPHY1OPSkByZZ/fRukh7
	 IwgMZLYhbcI/LBy2Qze9pdjghND0T81QJm7fOGPwjl98wrvJdL7qGgOYDcuhY9RXXWRpD
	 skwuq8NRNhaaP0QqueiYMJVJPc/ZIsWIU8LUVvJmXnsRR+r4wFRbpzUAkMzKXOLbDai8i
	 N0kOUuWukodLU+dlzFNUHkUMBvY7XJAPN53BEvr12LgXUeo3gKe2Ut46hiSSgG5cLkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Svw871Qf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E8606FACF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 10:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5E8606FACF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Svw871Qf
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A79AC200467;
	Tue, 03 Nov 2026 11:36:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793702191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTWGPJAHq//Rmt+lKT5HqcL1UWzsOvq6MdEoTtgx9KM=;
	b=Svw871QfrvdZWmcrgt0xdC9ee1M4MPIMntep3p6+p59vzZxhhdiXG8nz+6vzkNQb8Zo2Ay
	4ygxHPRQHCpmREEk9hOlJmR2e9O633cllhHVYwW9o8sNY0E3HNHzc4W0YErI5YSVWeiycZ
	6ZV2KFHqkpelZvsos3FLstBYIPssenpfCGKDcfUQ5MK77dysnVnaPTGt8kAZxxdVmmVPz+
	d3fNbf7PWlYezsjUFtbhNtkFxTJDpgBU9MpAiHvv78uYZSyDYw4EJZmUPPKwoJJdgEGSmB
	9EGKtW3FzadwfOlBmR/LQd6cIM8nc+E1WnVU3dzVp668zEI8eTN6zC3oES/cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793702191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTWGPJAHq//Rmt+lKT5HqcL1UWzsOvq6MdEoTtgx9KM=;
	b=Fkh4td+AcdBESkI1zUEkFeszjmJOUN3Vdl8P5soWAc229uWaGB9CcArIon7sPLjMsGZYD8
	u5whZXA5CpT0F8fam/8o+H1Osn4PC3K/ZfgURHwLqu7gaOAh6cuzdOP9B3EC1oZIVZapk/
	sReOiXXLE+AhL1LDuU63I0Wh13SiD4O6i5MPBbQTEp6x0s2pxnm/N7g9h4j6ckTlFplmJm
	E34mNFBrTI2UHzLq/IvWHD7/J1y9ht8E2WNoaygbyId9p3lqMmgo58XpwhiHctA4F+clsx
	pFtn0uajJgAWkQszFCvEXNu3k77lyQxTmEa5kpMN6t+rDyx7acsqVLSVYsSEug==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793702191; a=rsa-sha256;
	cv=none;
	b=GowZxeb0CzHtNDgaKU1CV4lhRySgLVdUY5L4ZJSWiIKY6JxFhGKtFy28vysyecKiEWTpaR
	J927MH6omb76BVuo/4iGDSTLjFsThT8iG9v4MyR0xPW7GIH2gsNqovwqBSUXP45NbHpAlG
	gTwdM8SuT3yfD/y8VGu6LcaYp48P/zPS5lI3a1hdplprvOH+XPVpEHjDmJd4YajMugF1b+
	d39IQWtWftKuuFbLWRHusKvMGSvLChAvxeuFECo52QtAbrwrWKEsAQIqGc5K4aWZZdqIeB
	6b+7Fjyfoj4EjQx8IjcS49lGewh2iUrEJk1tYR2l8kOvzcPFBlVlKuKP8csqMw==
Message-ID: <8372ae767434cfa2adc9e1f89f771b74bde83fb6.camel@pengutronix.de>
Subject: Re: [PATCH v11 3/5] reset: rzg2l-usbphy-ctrl: Introduce info struct
 for match data
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,  Chris Paterson
 <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>,
 Prabhakar Mahadev Lad	 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 03 Nov 2026 11:36:26 +0100
In-Reply-To: <20261005111854.275120-4-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
	 <20261005111854.275120-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mo, 2026-10-05 at 12:18 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
> rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.
> The new struct currently carries a pwrrdy boolean. The probe function
> now retrieves this struct via device_get_match_data() and
> conditionally calls rzg2l_usbphy_ctrl_pwrrdy_init() based on the
> pwrrdy flag, removing the previous integer cast approach.
>=20
> This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
> which requires a different regulator configuration with two per-port
> VBUS regulators.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
