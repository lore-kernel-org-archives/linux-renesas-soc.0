Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487189;
	b=eA96x0RzCTBst7y4UuyTrTp68xcd51eKJKbQw0hEpG9B6OL3Gb6dNTZGGlzo75xQHdXI
	 ionUb/l2cZ0uNcUjyY+8p4wUlJkzLvTrvvTe9VtN3x9UmtbIPMVE9qH6f4u8GUkFqQbQm
	 lPt8N/aHXmt2UnrrGHpX/lMr7h7Lh74iLt4wxJ111SqQNW81BztjGrqrQ4Vkic/Ep3Vs7
	 NPnOn4lgDN+HOnDkM51xcmkpKn4yU3v0P6r7t4wLAh8NcSR+A7So5cbNQ+5oE2D3Bv8a8
	 TyebaD4+EFBhOCBOMi5AQ95fh/B68mEu5zuA8AsrWR0E/7ZkR9WWGaraFyFDbDYY3sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487189;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XRLMwQm9cSwnCXwLWzr19EeC/TeAhie3XNROKNH+2Bs=;
	b=zMoyzTChZ9649HAFqYNCLl/t+Lt0VibnyT0boP7ohyfhhKjFsMh/xsaiIloxW21CmLxz
	 97kwYG1lgSSLNyErYbJVSgVyqd69iPTerVEx3pYQC5EK5ODbqlQdIgewMf759kRx+jlAY
	 jvUdDNVV5EvRhi0/s8GaHjyD2tccLJOgZPtR1gMXFs15q34KEastIcIQx4wANYB69MauA
	 j8qJQV6g1D82smy/wmYp9oRbW7mWJmaE6TRYtgWvOGLeKT+5adj9vG9V4hE3ybbRUtACA
	 HRdZp0p7ojlw2IQbYvyMn2fy89MjHa20VjOks3g8MFct/8X5sywvQ0ll8q5+m8JeIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chbPH5HR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20F606A33C;
	Tue, 24 Nov 2026 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chbPH5HR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F81F000D8;
	Tue, 24 Nov 2026 02:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487188;
	bh=XRLMwQm9cSwnCXwLWzr19EeC/TeAhie3XNROKNH+2Bs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=chbPH5HRokEWNzPzf+J9gMRNiokhjFcZ9PsFwIVZX1A9XK8IzkLtix7bOKMLtpi+Z
	 p82NHvdTL9zSWwU3m4jOxK2REdt97jmcLnroquUSwhs0GFRF9c8SpZ+0qq/FNL5BVv
	 Rf89FKdSofDVBZSJ9tHEtBPx8XNOy5cezAag5QtDB0NFdFN2TZVpGF8H8m9dF3XR+Q
	 4XzdN4YR7SpPcf+HBrG1eaOGUbgh/L9xZtPZ1ozMAdsGpX2bwgjC4BxeG4f0bl8eDQ
	 WpQg2iGj4GuuQdCS7nHx7oGMDzfPzTlj6sQx68fL9gQBVVeWjY0ADv/I0QG5woTeqJ
	 sDu3n3AzBbtLA==
Subject: Re: [PATCH net-next v5 18/24] net: dsa: rzn1-a5psw: Get pattern
 matcher register offsets from OF data
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: clement.leger@linux.dev, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hkallweit1@gmail.com, linux@armlinux.org.uk, horms@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 f.fainelli@gmail.com, ralph.siemsen@linaro.org,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, prabhakar.csengg+renesas@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Tue, 24 Nov 2026 02:26:26 +0000
Message-ID: <179548718681.3135.5483552869953704216@kernel.org>
In-Reply-To: <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says the patch will "use the correct values
  for each SoC" and quotes the RZ/T2H/RZ/N2H offsets (0x3f00 / 0x3f40).

--

net: dsa: rzn1-a5psw: Get pattern matcher register offsets from OF data

This commit moves the RXMATCH_CONFIG and PATTERN_CTRL base offsets out of
the A5PSW_RXMATCH_CONFIG() and A5PSW_PATTERN_CTRL() macros in rzn1_a5psw.h
and into struct a5psw_of_data. The RZ/N1 entry, rzn1_of_data, keeps the old
values 0x3e80 and 0x3eb0.

> The RX pattern matcher registers are located at different offsets on
> RZ/N1 and RZ/T2H/RZ/N2H. While RZ/N1 uses 0x3e80 for RXMATCH_CONFIG
> and 0x3eb0 for PATTERN_CTRL, RZ/T2H and RZ/N2H use 0x3f00 and 0x3f40,
> respectively.
>
> Move the base offsets of both register arrays into struct a5psw_of_data
> and use the correct values for each SoC.

[Severity: Low]
This isn't a bug, but is the last sentence accurate for this patch alone?

At this commit, rzn1_of_data in drivers/net/dsa/rzn1_a5psw.c is the only
a5psw_of_data instance:

static const struct a5psw_of_data rzn1_of_data = {
	...
	.rxmatch_config_base = 0x3e80,
	.pattern_ctrl_base = 0x3eb0,
};

Also, a5psw_of_mtable only lists "renesas,rzn1-a5psw". These values are the
same as the old hard-coded constants, so the RZ/N1 register addresses do not
change and this patch is a refactor with no functional change.

The 0x3f00 and 0x3f40 values for RZ/T2H and RZ/N2H are only added later in
the series, in "net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet
switch".

Could the commit message say that this patch makes no functional change, and
that the RZ/T2H and RZ/N2H offsets come in a later patch?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
