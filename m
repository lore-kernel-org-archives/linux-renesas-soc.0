Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502445;
	b=Qh2QbKMuvrfwC9QVXgGTzhpehPLoyY+pINu1oWrkBmu4/J1Lp4jxoV9upub7m7FR2gvI
	 rOjlMO/kM0rtAExjz+vGGnuCU1FoUH7La8cWgUH13lpxYY7GMO5v1RnuABbabeM7UnjiM
	 dmsMM6iq40FMmFzqlgNtKpWNHDyWxn8uCIIDoShPcbUDIL5TS5Vskq6h10k+OX2dGKgGj
	 hv4mdr6c1YNTK19kAqjWCNMG/1UWtN06HU5ttoA7CqcTtiYkCMFwlvXBdCAoC01Kc4YuM
	 LfSHZWI4VBRF4stCfdNhqpkwDOmRuRJ2zB1KbVng6bdpnyA4tRNWsGFRWf2IIty8kRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502445;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=w23lNFq4PU3EA/g8IT7NKGXR8jqt/dFslDDg8kIe164=;
	b=HKE0j/oKlfBfCPz2ytUomVLgWB7jMAv5ajL9r4yvcErQn6nCQX4/saQ35eesq6p2e6+S
	 Rnz3n7ysDEhsDEY3BoHYgBmJPM3/2laNYPyk+STCC07ls7+DwVK+vTu+kpjuTNC5+6XKu
	 Zg+N+O0b8uZOfUYznFo5S8uX5sM5jpdVvwYzdCqnr4OJ3OOwPKZHEEGlIGGeYiEClRW9/
	 XoxkIvffURY2aSwWwTqzqq3bDmbtIo0c72ux0/4aghusVcePnNw8s03U70rDPfBAibfdY
	 N4+RR6MSbJJJBkN5B3lrJBsXZcUr2qXOn3weSCfmtFXBqfFOSyulps8JWKSjt/PPXIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=oBumkIjE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WAZ9zMHG;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08305606A32E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 06:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08305606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=oBumkIjE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WAZ9zMHG
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 05349EC0980
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 01:40:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 24 Nov 2026 01:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795502443;
	 x=1795588843; bh=w23lNFq4PU3EA/g8IT7NKGXR8jqt/dFslDDg8kIe164=; b=
	oBumkIjExkoM1uwCehL/8oDhAQlt08qXvFbsmQNQYgAfGBD5NYGk+u85+QcpSBr3
	IeGEwNWzr8kBxoP1y5MR9UM8OHEvHqfh09uX11iwF6Ad8ch+aMafcxG/qRFYEjcY
	J4AO+Rnl1EmniiB/RoKKdWumxugKLRfac672moww3Ug+NUnYbwOZQTRsr+yBUGn/
	sYa7y3WvyWBNsgLSBwElyfZQN9GYxA7KPxZNqU2iHvf7DBzXvD2h3nUewhy3F5b7
	Y57JfrsJNJVip7YLloTJ3EIcEWI6L/t50gcmR1alY5fibg1MpI/prAqb/eXaU2OC
	g7aP9zY5s3s9aJLtoNZLyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795502443; x=
	1795588843; bh=w23lNFq4PU3EA/g8IT7NKGXR8jqt/dFslDDg8kIe164=; b=W
	AZ9zMHGtea3NNZRXu4FUEXV6Bzhntnmfou1n5WVSuKqpMR7dDsl8QLH26GCd+W/z
	KctwHRNHLnlUnNjIOAREn3DWh/m7g/pcvjcrqJ4s+mpfAn5oTjLo7HubR/KnUxIc
	ayEmdMZ7dYcfpVzBKzQ+pK9TDtCf1yje4ZPBGN60E2PPY5416Th0FCxFqzzsS80J
	1c2tt5arOumSyzIYNnltDrghSg2qAXKWo2eRQlYct2uSqISLXQfVvYuftJ7Vjs94
	yESCxu84mAM/BMXm8l+g/ORG0/QwvjvrgcT4YsC2JIIWBrO1M5n3qpUNFfHUNXaj
	aeSjxODs9RT66EM97T/qQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795502443; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:VdIrPy0YVG58pDJ/Da7aY02R4P+o0om/kpXGFFFYxMhhBK0
	wfsaK+lnP9szSik9Iw8FVuyopbOcBZlgaQh9nL+3qgJniMVXhZEgrQbTqJA31QET
	4XJMEQWSD2eWTduAIh2/Ag7JnXkpxJlzM+92bLrvtPBnkw+P8B12maY3XFIzY4TX
	l1v6K4lAhgi82qekabCEpjNInpRhGH/0bURIuExm+tWAiuLdTYrXRwTJibu6nNIY
	BgA6OcqJkF5ObmcWLijSDEsvFn3L6ZgiE+sLHJcvJjKeRz5Pfo4XSdl6NFyEsjWF
	26m8zVTISAC7YcWBOrtDQyExWMpNVqld9J9TdXw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:STD6H0HdESP6jlj1Ui0LxDpZbGwRDzEyJb8kvkm7AG4=:XDFc0NTQHGVBocCGeAeBq/Z+MiIoxLgdkMxglKsMzN0=;
X-ME-Sender: <xms:azEFa4tD-g6g_xAa5S9YsbHnAmZnBQ5ahcc73PVn9xpPacqFWM843Q>
    <xme:azEFa15aAxm40NhgNkelVxNtVvusqHDHbkLa9udQekNfJj-0Dyn3rwF8dalgLMbPb
    DYM2A32Y69SGy-L1iJQ3HIKt076vR4e0LVbRikV7g_3irn73wee>
X-ME-Received: <xmr:azEFa0fqTEURASYd3KlUIdzC1wocQOpeic0TAAg2hW1b5clpRiuNn7tcGX43E-hz_5WD1qvBrhdY4jYoMvU21o3SgvDnYH0>
X-ME-Proxy-Cause: dmFkZTEZm1p0nloDXCDDKweUR4luS46Uz3EWb2EgwJk32G4Vg9LVoiy2p+zVRYy110bsoE
    0imqv32La6cgFk2EuNvmn4GxG5XLm/NJBl2YetOQhdgT2+k9mR4Bzki9T4yHyJ5V6QTQcX
    DmpQicN2uQkqExraEzYLlcXNOcQhRzYXSFwYVKD8ufnUxcNpQcWQVF2N0q6V9ibAJRuQ3o
    jn3mVXoryYaqGW+3G0ECefPAy4ybFAvHHB73CdCxtWAFc8Uq6LQlmKJtWwvOUpYAUmHcI1
    mij4p5AoXoNDsRx1Mo4UUURwoJW2xZIkVeEGp+iDQUzCbuvpPrk6DLtvk8fWJFgbJgLoFJ
    UOCUeAICb9oT1TQ5M+6CoIaudDjcALNbktE7fXWhpOMU+jV4qUdRerNCh4YZSYEqifKNwE
    Qk/EWvie8LZ6xSrWbTTK1syG5TXm4U96uBPqzoqJQ2okVfBpZyEVgv5PgUcZcPXLkdoE5B
    H8PZK3IEgchx7LG/wRupnpPqvN/v2jou1VEllehrrYZq5kjQ0wiWPLk8YsqqHkyR7Qh05v
    FSSrz/XNTq6Bn5cJlpM8VCNWUPVKTBiU7/GFlSLqcnfhIoU+zbFEIpJiI4UiRsULKt3KH5
    edF5++UkoIh3BiMxAKZXA/oYgMf44fKf2IHLOoiqPpw6l2XV0wcRLzo3e4YQ
X-ME-Proxy: <xmx:azEFayxxe5_YRxRV94TPLHwFWG1-DQqA8u2yXiNDELCbZpGuSoRCOg>
    <xmx:azEFa5_wcr9ctliapuT1eKrYDSWhWFOxJC6jNQFmH66qouQJJtTwJw>
    <xmx:azEFawxPKK23kTm4uezKwy11t-RTvDPVcSeC757YqYMbNtab0dJgbA>
    <xmx:azEFaxpIXJRZuzIvTuj66iuACsQk8jHATShGxcooPZzcNtyMZwXcEw>
    <xmx:azEFa9XlxaCFvUDAfTZBpnZlbDYi5Cv4esXVmnb5Rz2f3zL2FIAFbJel>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 01:40:42 -0500 (EST)
Date: Tue, 24 Nov 2026 07:40:40 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before
 the zones are freed
Message-ID: <20261124064040.GF3898744@ragnatech.se>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
 <20261119022926.1493582-1-shunsheng1218@gmail.com>
 <20261122144813.GB3898744@ragnatech.se>
 <20261123064745.GD3898744@ragnatech.se>
 <179548695107.1834709.12105107414276177799@gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179548695107.1834709.12105107414276177799@gmail.com>

Hi Yaohan,

On 2026-11-24 10:22:31 +0800, Yaohan Li wrote:
> Hi Niklas,
> 
> Yes, I agree.  I have reworked the probe to look up the IRQs first,
> initialize the sensors with IRQEN cleared, and request the handlers after
> all the thermal zones have been registered.  A devres action disables the
> interrupt sources before the handlers are freed, so ->remove() is no
> longer needed.
> 
> Since the thermal core copies the zone operations during registration,
> set_trips() still has to be selected beforehand.
> 
> The current version retains the no-IRQ fallback for -ENXIO and propagates
> -EPROBE_DEFER and other lookup errors.  However, if IRQ lookup succeeds
> but requesting a handler fails, probe now fails instead of falling back
> to polling.

It needs to revert back to polling. IIRC the interrupts are used to get 
quick notification of a trip point but if interrupts are not 
enabled/supported it can still find it using the polling method.

> 
> Would you be happy with that change, or would you prefer to retain the
> original fallback on IRQ request failure as well?

A bug fix should not alter behavior, other then fixing the bug ;-)

> 
> The reworked patch builds on arm64, but I have not tested it on hardware.
> 
> Thanks,
> Yaohan

-- 
Kind Regards,
Niklas Söderlund
