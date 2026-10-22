Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696590;
	b=zbc5R3nmzooiNXvnyd038OheJ4sGRlDXoUBjwGS/XijwA/S3elcU6XF9Cam3fRvb31E2
	 sumTaPqYKgrR6vABw8GFX/6AGYbQ+qbf4vZ0ucIbV78n/JpyvvoRqiPXH9gWLIF1K9xXc
	 Q/a3wcR2tS/2SfaJfBy903yW26hRAeyh5a5nLYfaceXIkDqr24EEkzk6Sgqup3jztzsWD
	 GpjyquA4P9l4ElM7k4A1dFLLxkA/vZjDzVT+vISISiI7RVWDQlEzQquMI5crc8RKu5jJV
	 Gyd8CSREe5ybeHsRr4YHIMQfFpJRD5DC8BrTIjhadV5BsDJWy5S7Vhbty2nak9At+1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696590;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=worign4rstbwAXV4Bgti+MrdTiT6gtNxhhZE7rH+EtI=;
	b=aruQTFsesgp9/5Iy6qBsk5NnWQbEFIxaO3tSdMC1st6tG/oWOcfK70V6GFqObY7lyDF6
	 8EwjEmkJtSUuY1WfE2Wqqjfhg8+tpYo41/QZegSgcsQhgZmB2I3pnASZ/elgx9xYqe/G9
	 130pASrEbyTEuX4rVXvoswZLwIeXklKEtgvTkwnR2HUbvJGdGP2YK5KITkdAPPQWmXKpQ
	 MMeE4clzY3mLQvFu98c2UFijEMo3KTCY41Fqb2XXN87GrPBt19Cp8+UoH4WocBkRYg4jM
	 oFMYXI/gbJvtFazvZw21H0hMhV5xyt8bgI56Ik348XR4xuH/lnHV4vNtzzBM9dTsjnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bCnt7TT9;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2DB606A31F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 19:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF2DB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bCnt7TT9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wori
	gn4rstbwAXV4Bgti+MrdTiT6gtNxhhZE7rH+EtI=; b=bCnt7TT9ert32tXRWd8p
	vWHPz7UYsPjM0Hv2sizm5s0Gg3J8gT3tS/0xLufQdjp8XgA3yjQJXnaw0gI4/3S7
	7h/TwBT+22sAyEpp84mbXtRGt19gICHiQi1oWreGn3p44m7uT16UL1LpT7jGxlaa
	afYJW8Ckeu33yIshzsWDoP4IR/gDlfNbSOU4akCF1BkcRiVzMz0ifNge4vZUIIWO
	ReAesxGCTmy/5zrjJwLjcMkvdCgzInj7jLvFeLqSvbaxRTsI65Y5fNA3bjwqndjd
	afDhwTqDRTh0bNKiCNCQhK1A+LOEDLzkvEG9C1LwVS8JglgQIY16XL6ot2RKCxAc
	Zg==
Received: (qmail 1249909 invoked from network); 22 Oct 2026 21:16:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2026 21:16:23 +0200
X-UD-Smtp-Session: l3s3148p1@cd4Ks3JeDpAujns/
Date: Thu, 22 Oct 2026 21:16:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v7 00/14] PCI: rzg3s-host: Add PCIe hotplug support
Message-ID: <atphAmy8ZIjY_JNC@ninjato>
References: <20261019065025.2146539-1-claudiu.beznea@kernel.org>
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
	protocol="application/pgp-signature"; boundary="Ow/o1bagopSaNDX2"
Content-Disposition: inline
In-Reply-To: <20261019065025.2146539-1-claudiu.beznea@kernel.org>

--Ow/o1bagopSaNDX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claudiu,

>         i2cset -y 1 0x18 0xf4 0x8 # Link down
>         i2cset -y 1 0x18 0xf4 0xc # Link up: PCIE_SLOT (NVMe Micron)

So, I applied your patches on current -next and did the above.

During LinkUp the card (Renesas USB3 host controller) got correctly
re-initialized. Same for physical unplug/plug.

I don't know nothing about PCI, but I wondered about one thing: after
removal (both physically and via I2C), the card was still present in
/sys/bus/pci/devices. Is that expected?

Thanks and happy hacking,

   Wolfram


--Ow/o1bagopSaNDX2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmraYQMACgkQFA3kzBSg
KbZTrBAAjnY8NNyL5HwH91DskA4hX6y4V7+LCoo7rU++Z6JH9I0vvyhwOwrtdd1Z
DZwhZGMLooSQCG6nuEm+JsWwPUtlWBWULdL8LQkgLHiArPYzyfUGqy7kc9sNgcKQ
vXNToCw0Q5nQXAd6Vkg274EbgtPF9L6MVh+ZkUraMCrA0fkO4CpdKCozsmGdEaqp
u79HtHV3Pc8sfL2dCzFc49NY90NShQykan88ZXZaOhASOS+lEuwRU+rZ8cjV+Atc
M6CZtVE2qjdxVGTSmcN5MyezhfR0y2NOSc6dog1Mr4oWsuHye762gVgxzKrGR+c4
0aGqmmoQ1iAsp5pUumG2zt9SufI8b9/Ig1B789Nlnp/iPA/kBt3rEEAKYo3nxxjB
APayRljviwFErFkgZbAK99OC1F6c60jLdaLD+G0z9fkGbkYdFKngJf8vdtYW26Mc
XKmr3l+d8cHhMcyjD1E2T4c8WxcUj+kNwar5BO8LI0+I3JnAUx2Tihak/s8QrBFY
iikG8/GtgmeYxp2Cr2aK1fVN9nLNyQOTLQm8zP4r0hGTzzSpAb4ebd0y5mt/WNua
2hHaeEWB6O2g6oGRCtn937F7upXhZfJhZjLnoLctPH4chXW60NiK0rJcGJ/loepB
HV4itQoIYpCb8KQ9VsriQLUDFr/db0S9smuYOFZLDshcweCjHzg=
=7/Ow
-----END PGP SIGNATURE-----

--Ow/o1bagopSaNDX2--
