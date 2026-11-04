Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797789;
	b=3c0viUwI3V4gL4/AJqMDZUP4HXnfvSk0eTyhTHbMjffeADh+udc0BIW5WRfThiSbMVP0
	 lc9qmToNzSfZKnNfEuHwT2zgWwc3wLtdluNBP7kT0VPWfbTTbSr1cNDI8UsJOzm1K6BdX
	 Fd9Q15GYhrzo1jOG5RHhQ4hXRHlc/8dUDCYAc2Nvrjr2e4GZFhCUgtnUvBfxqcxrz1FIn
	 M4tiny4A2J7jCQaOG9v1ndypR08tdWIlHKPcq7grwAARKZO/fxFcawJHJ1t4W3aPkx8vL
	 P5FdMGxUEO1vTrQXPnCdJYJTVK6EiOPXy5aiqUJmqC98h3lBjEndnHp1Dqum9id9Z+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797789;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EvxDNnbUq6iRwGS6lhBcvMyHnODms5EH1l67p6lNEm8=;
	b=YE+fp4Jr2emEigk5aq8N8v12RyyxrCjjTfqjo2jTvhYi7HDNr/j0dKR0mmLByjPCPaVg
	 ofplmEJM7T1mJ3SmsGADD+actB77k0SmJ/D3Qg/eEAYGJImRMC9fcNlszni4BRREdhDJl
	 c4teGjgGka7BQ1OKpVk5W8WiezHr/3EtGHhiGY1+DIDVDkfBK/Pg/axRqWVNi0UcaJ6ad
	 Ze5I49IZKIWl+GQ/Dpng6zFH/b9J2z8GR4XwDrrPiRLwmNGYr4QfJbvfP1pDMfjKIxT7i
	 VwFSRzZpu/Vuh0fPw9sDP6Af139e3cMD3s7x3RuW38PnRPSfsZFw+8CLk3Q2mvBHCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IzkT0ZAt;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715C606A32E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 13:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A715C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IzkT0ZAt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EvxD
	NnbUq6iRwGS6lhBcvMyHnODms5EH1l67p6lNEm8=; b=IzkT0ZAtOWNrmqUdwPXf
	0tCA2n/yxSTAUpywGuRZu79/v0ZGk1g+lAF5pbgN/eSpOf8m+HYGM8j8oymHGpus
	VwrpAC+T7wXG6gm2OaFHUUXpZ6G/Lw/J3QNVITKgJA9JW0Ijb9uFIUAjw/fmMfTh
	YIunEsFf3/0JW+/0EVBrQGdC0gXg0VZPEROMHMleJV9aAyq5gBXlinw1EWCDxNZM
	6SSDuHWdX2iyARj1tV0kF0evGolGS2z28eP4R1cgDM9DVtJ/Xi1nGSPYzesKDCH3
	tzM0th3zMDwpU3ouFBYe2aj5Y2xfOmjayQMeU6QsiStZq3RAqubu2WXEruhGzZ+W
	pw==
Received: (qmail 732281 invoked from network); 4 Nov 2026 14:09:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2026 14:09:44 +0100
X-UD-Smtp-Session: l3s3148p1@1UrAF3NfDr7AwtcC
Date: Wed, 4 Nov 2026 15:09:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: andi.shyti@kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: Re: [PATCH] i2c: sh_mobile: request IRQs after mapping registers
Message-ID: <ausul_FO8-1JKEmL@shikoro>
References: <20261017233416.47b09ffff48f.i2c-sh-mobile@gmail.com>
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
	protocol="application/pgp-signature"; boundary="X69eXN8VBfvJjUDN"
Content-Disposition: inline
In-Reply-To: <20261017233416.47b09ffff48f.i2c-sh-mobile@gmail.com>

--X69eXN8VBfvJjUDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 11:35:16PM -0400, Myeonghun Pak wrote:
> The managed IRQ handlers are acquired before the managed register
> mapping, so devres unmaps the registers before freeing the IRQs. A
> transfer wakes its waiter before the ISR's final register read, and
> unregistering the adapter does not synchronize these IRQs. An in-flight
> handler can therefore still access the mapping when it is released
> during driver detach.
>=20
> With forced-threaded IRQs, the handler can be preempted after waking the
> transfer waiter and before its final ICSR read.
>=20
> Map the registers before requesting the IRQs so that managed cleanup
> frees and synchronizes all handlers before unmapping their registers.
> Keep IRQs available while unregistering the adapter because client
> removal may perform transfers.
>=20
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
>=20
> Fixes: 7fe8a9993337 ("i2c: sh_mobile: devm conversion, irq setup")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

I know I am late to the game, but I still want to say that while
changing the order to be "regs then irqs" is in general a good thing, it
won't matter here, as I see it. Unless the later pm_runtime_get_sync()
the device should not(tm) be able to send irqs. Famous last words...

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--X69eXN8VBfvJjUDN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrrLpcACgkQFA3kzBSg
KbYpag/+JmH6ej53UXJ08VUo5KB/VIydBB6rNhI9e7lIsaYzj9vBTSNrfJrj9jS2
RoWIFdVwm1RKlARCyNk+il5ws61pnqGaa7aTGNEGBaEPyc9aPvxRjdiDeXLxkcRG
j8HQ4OHSHvC2bKbTSvYFJ89+GURKNeefKwOzUncOJrfyyIdeUF8y1eVaWqeA8egR
iYJlgNUYDylanlugNdFG487fswtxDFoVNdCwPvpRAB1KgymswDTzVn2us/YvS0zD
Hya6RrjAVycFjLUMpgYyitm/NnxTvDIzC+5786VBV4YLX/2iZROy2e4K1R15qKwZ
5JlZOIAbGVxQCzAt8tjvfhWfLwMbN34Ko3/Db02BNMLz1ZLSkgZVFzUpV2UbOxvq
DMACvVEz713XwXM4eODYsKBKSPNr2wUFHScH1l6WGH2eIbybdVChKalCr8TzYlB4
29gN17EVwnWFvllGGL2LI/kPXSmISfKDhNlwLtKxH5jW8tPKRSkMLXkDhjbWkDYl
8C1dKTySaGPGo6NOkmBPpTbrHbpraLhewo/BX0LfCrzuDm8WL7pH3hHM6etyZI3T
aHCMMem3UVXETSTCkoZ8EiW9jAXn9g2oY7rp5bw6GmU+nAB0pB6ca45m3QK7kQue
jccfzv2ajqLBF6tXsl4FUIui3KMUVpTQWDgR3ClTj8I+B4HnaDk=
=VZ10
-----END PGP SIGNATURE-----

--X69eXN8VBfvJjUDN--
