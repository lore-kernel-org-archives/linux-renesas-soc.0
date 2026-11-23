Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439168;
	b=xcsb9e7X5pFV3iNAsjHpA+MasGwENdlm9GpT0afnaFoumOnIwQiZS4uhkzTmob7E61xd
	 wl6nOsa5ceR94EQvCFrDoBAaRIS6nLL6Yl1COxga/oPpo3OhhDXULUKfD0vfwzIEaWHt0
	 XY5i+oODGEI72U1IuSx9M+y1i7J4ZQYyIaPRmQBdpN3oCJ5piGa/G38mkZrwSWrJ0l66W
	 4GGXmemxoenfAa7qJnPMckWoHUkRTQ5AJCRkK7RKHsEkuyNMDSdLHSshYQgaHKl8psOG9
	 Tbinv2Q5GZWElJJ8MI17YMT7DGwOFo2Pm3kTjtcjVNSn89bO3+zhaF7SBAxg4aPDClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439168;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eBZpwWyrav8yuFoA0vlExqV8f7U0LYTnP7ApT9lXYes=;
	b=PJY7EAkURZDZ0lNg4npdYQihuelGN1A090OeDxtjyzVHyjBbJXO5f7jYj2ww/cgIBJwn
	 /6gHiQLDQU0jlzlZ1JrekQ5Ir7Dhv03qf3bFDuSekysPKsdbQDvcYQuF4+3s8atKrZ0qH
	 8/Hpftmh8xRyjf0YnijWADYecH/fBcbGDuqjRQpL2mdN9Pr3ddcmezKRJrewV8zCcPH6r
	 PsIwp4M65L1ck5Jm85X6frLhmDNbjDamZbeDS6B3t1H0ZAd7WGdl+9pkdjBrNyj1RoNB+
	 731akzGlnQSl7euWss+VxylImwdzb9bFWedjMoYN83dAZsdCxpyjclKyRdTcfQ7FXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=HLUfPuM9;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3878606A327
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3878606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=HLUfPuM9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eBZp
	wWyrav8yuFoA0vlExqV8f7U0LYTnP7ApT9lXYes=; b=HLUfPuM9FNCHsI3arcOG
	sl5EvTAt3bcHjlDovFKX/t97wlVwrtFgMHUR3JNa6i6XRTqmtPCmZuDXXwwg/Cq3
	DxQjcCOdLyZfUx96gTCglcABU40lcoLqg8+7HqUgzPNFhaaWgvnHYust6tPnpSRd
	BY4swjsM0Zg05+BAOSsugoBxu8p2jBsrFTXwa7yysVkTm6U5ILkZqhyAo7uDdLPP
	Jrl/6LXbqS+QWDBbGN4IaDsjTxSLYhUicuYZ39pyC1B2/PJTcqCBvjTrIt1qG0KY
	NAAJTXeqVetCqNfCOPmpOdYhJ6ttWd3Qd+Cm+1Hi9AaDf8uUr1QaMD7c75/lGndr
	Qw==
Received: (qmail 2734891 invoked from network); 23 Nov 2026 14:06:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 14:06:05 +0100
X-UD-Smtp-Session: l3s3148p1@lz2nQfFgPr8ujnsu
Date: Mon, 23 Nov 2026 14:06:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: renesas: Convert to dev_clk_get_from_provider()
Message-ID: <awQ6PXdLz88kI9wQ@ninjato>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <55d67b95c675924fb67d13ecbab47bb45c8af372.1795094688.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55d67b95c675924fb67d13ecbab47bb45c8af372.1795094688.git.geert+renesas@glider.be>

On Thu, Nov 19, 2026 at 02:40:36PM +0100, Geert Uytterhoeven wrote:
> Renesas clock domain callbacks use of_clk_get_from_provider() to obtain
> clocks used for power management, so the latter show up as "deviceless"
> in the consumer column of the clk_summary file in debugfs.
> 
> Fix this by using dev_clk_get_from_provider() instead, letting us pass
> the consumer device, too.
> 
> Sample clk_summary change snippet on R-Car H1 Marzen:
>     - sata 1 1 0 62500000 0 0 50000 Y deviceless    of_clk_get_from_provider
>     + sata 1 1 0 62500000 0 0 50000 Y fc600000.sata dev_clk_get_from_provider
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on R-Car H1 and H3.

Tested on RZ/A1 (Genmai) and RZ/N1D (demo board).

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

